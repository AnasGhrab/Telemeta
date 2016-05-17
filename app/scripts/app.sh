#!/bin/bash

# paths
app='/srv/app'
manage=$app'/manage.py'
wsgi=$app'/wsgi.py'
static='/srv/static/'
media='/srv/media/'
src='/srv/src/'

# uwsgi params
port=8000
processes=8
threads=8
autoreload=3
uid='www-data'
gid='www-data'
patterns='*.js;*.css;*.jpg;*.jpeg;*.gif;*.png;*.svg;*.ttf;*.eot;*.woff;*.woff2'

# stating apps
# pip install django-bootstrap3==6.2.1

# waiting for other network services
sh $app/scripts/wait.sh

# django setup
python $manage wait-for-db
python $manage syncdb --noinput
python $manage migrate --noinput
python $manage bower_install -- --allow-root
python $manage collectstatic --noinput

# telemeta setup
python $manage telemeta-create-admin-user
python $manage telemeta-create-boilerplate

# fix media access rights
chown -R www-data:www-data $media
for dir in $(ls $media); do
    if [ ! $(stat -c %U $media/$dir) = 'www-data' ]; then
        chown www-data:www-data $media/$dir
    fi
done

# update haystack index in prod
if [ "$DEBUG" = "False" ]; then
    python $manage update_index --workers $processes &
fi

# choose dev or prod mode
if [ "$1" = "--runserver" ]; then
    python $manage runserver_plus 0.0.0.0:8000
else
    # static files auto update
    watchmedo shell-command --patterns="$patterns" --recursive \
        --command='python '$manage' collectstatic --noinput' $src &

    # app start
    uwsgi --socket :$port --wsgi-file $wsgi --chdir $app --master \
        --processes $processes --threads $threads \
        --uid $uid --gid $gid \
        --py-autoreload $autoreload
fi
