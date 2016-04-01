=================================================
Collaborative multimedia asset management system
=================================================

|version| |downloads| |travis_master| |coverage_master|

.. |version| image:: https://img.shields.io/pypi/v/telemeta.svg
   :target: https://pypi.python.org/pypi/Telemeta/
   :alt: Version

.. |downloads| image:: https://img.shields.io/pypi/dm/telemeta.svg
   :target: https://pypi.python.org/pypi/Telemeta/
   :alt: Downloads

.. |travis_master| image:: https://secure.travis-ci.org/Parisson/Telemeta.png?branch=master
   :target: https://travis-ci.org/Parisson/Telemeta/
   :alt: Travis

.. |coverage_master| image:: https://coveralls.io/repos/Parisson/Telemeta/badge.png?branch=master
   :target: https://coveralls.io/r/Parisson/Telemeta?branch=master
   :alt: Coverage


Overview
=========

Telemeta is a free and open source collaborative multimedia asset management (MAM) software which introduces useful and secure methods to archive, backup, transcode, analyse,  annotate and publish any digitalized video or audio file with extensive metadata. It is dedicated to collaborative media archiving projects, research laboratories and digital humanities - especially in ethno-musicological use cases - who need to easily organize and publish documented sound collections of audio files, CDs, digitalized vinyls and magnetic tapes over a strong database, in a secure platform and in accordance with open web standards.

Key features:

* Secure archiving, editing and publishing of audio files over internet.
* Pure HTML web user interface including dynamical forms and smart workflows
* Smart dynamical and skinnable audio player (thanks to  TimeSide and  SoundManager2)
* "On the fly" audio analyzing, transcoding and metadata embedding based on an easy plugin architecture
* Social cumulative indexing with semantic ontologies and timecoded markers
* Multi-format support : FLAC, OGG, MP3, WAV and more
* User management with individual desk, lists, profiles and rights
* Playlist management for all users with CSV data export
* Geo-Navigator for audio geolocalization
* High level search engine
* DublinCore compatibility
* OAI-PMH data provider
* RSS feed generators
* XML and ZIP serialized backups
* SQLite, MySQL, PostgreSQL or Oracle DB backends
* Multi-language support (now english and french)
* Video support (EXPERIMENTAL, WebM only)

This MAM is based on 100% open source modules exclusively and can be run on any OS. It is mostly written in Python and JavaScript.


Funding and support
===================

To fund this long time project and feed our agile development process, we need your explicit support. So if you use Telemeta in production or even in a development or experimental setup, please let us know by:

* staring or forking the project on `GitHub <https://github.com/Parisson/TimeSide>`_
* tweeting something to `@parisson_studio <https://twitter.com/parisson_studio>`_ or `@telemeta <https://twitter.com/telemeta>`_
* drop us an email <support@parisson.com>

Thanks for your help!


News
=====

1.6
++++

* Provide a docker image and composition for the full Telemeta bundle
* Full refactoring of the search engine and interface using django-haystack with new faceting and filtering features
* Add an EPUB3 ebook exporter for corpus and collections embedding metadata, image and audio materials.
* Many bugfixes

1.5.1
++++++

* Fix geo-navigator lists and pagination
* Fix item analyses cleanup after file edit
* Fix performance and keywords copy during item copy
* Add various annotation mime types (ELAN, Trancriber, Sonic Visualizer)
* Add arabic translations through Telemeta-locales (thanks to @AnasGhrab)
* Fix arabic and chinese codes in sandbox
* Better locale / pages management
* A better management of RTL for arabic page style

`More changes <http://parisson.github.io/Telemeta/category/releases.html>`_.


Examples
========

* `Sound archives of the French Ethnomusicology Research Center (CREM, CNRS) and the Musée de l'Homme <http://archives.crem-cnrs.fr>`_
* `Sound archives of the team "Lutherie, Acoustique et Musique" (LAM) of the IJLRDA institute - University Pierre et Marie Curie (Paris 6) <http://telemeta.lam.jussieu.fr>`_
* `Phonothèque Nationale du Centre des Musiques Arabes et Méditerranéennes <http://phonotheque.cmam.tn/>`_
* `Scaled BIOdiversity (SABIOD) <http://sabiod.telemeta.org>`_
* `Sound archives of Parisson Studio <http://parisson.telemeta.org>`_


Demo
====

http://demo.telemeta.org

login: admin

password: admin


Install
=======

Thanks to Docker, Telemeta is now fully available as a docker composition ready to work. The docker based composition bundles some powerfull applications and modern frameworks out-of-the-box like: Python, Numpy, Gstreamer, Django, Celery, Haystack, ElasticSearch, MySQL, Redis, uWSGI, Nginx and many more.

On Linux, first install `Git <http://git-scm.com/downloads>`_, `Docker engine <https://docs.docker.com/installation/>`_ and `docker-compose <https://docs.docker.com/compose/install/>`_ and open a terminal.

On MacOSX or Windows install the `Docker Toolbox <https://www.docker.com/products/docker-toolbox>`_ and open a Docker Quickstart Terminal.

Then clone Telemeta::

    git clone --recursive https://github.com/Parisson/Telemeta.git
    cd Telemeta


Start it up
===========

For a production environment setup::

     docker-compose up

Then browse the app at http://localhost:8000/ (replacing 'localhost' by the IP given by the docker terminal on OSX or Windows)

To start the application in DEBUG mode::

    docker-compose -f docker-compose.yml -f env/debug.yml up


Backup / Restore
================

To backup the database in the data/backup/ folder, run this in **another** terminal (or a Docker Quickstart Terminal)::

    docker-compose run db /srv/scripts/sql/backup_db.sh

To restore the last backuped database from the data/backup/ folder, run this in **another** terminal (or a Docker Quickstart Terminal)::

    docker-compose run db /srv/scripts/sql/restore_db.sh

If the app is broken after a restore script, restart the composition with::

    docker-compose restart


API / Documentation
====================

* Official website: http://telemeta.org
* Publications : https://github.com/Parisson/Telemeta-doc
* API : http://files.parisson.com/doc/telemeta/
* Player : https://github.com/Parisson/TimeSide/
* Example : http://archives.crem-cnrs.fr/archives/items/CNRSMH_E_2004_017_001_01/


Development
===========

|travis_dev| |coverage_dev|

.. |travis_dev| image:: https://secure.travis-ci.org/Parisson/Telemeta.png?branch=dev
   :target: https://travis-ci.org/Parisson/Telemeta/
   :alt: Travis

.. |coverage_dev| image:: https://coveralls.io/repos/Parisson/Telemeta/badge.png?branch=dev
   :target: https://coveralls.io/r/Parisson/Telemeta?branch=dev
   :alt: Coverage


To start the application in a development environment setup::

    cd Telemeta
    git pull
    git checkout dev
    docker-compose -f docker-compose.yml -f env/dev.yml up

Then browse the app at http://localhost:9000/ (replacing 'localhost' by the IP given by the docker terminal on OSX or Windows)

You are welcome to participate to the development by forking the Telemeta project on `GitHub <https://github.com/Parisson/Telemeta>`_.

To build your own composition::

    docker-compose -f docker-compose.yml -f env/dev.yml -f env/build.yml build


Bugs, issues, ideas
===================

If you find some bugs or have good ideas for enhancement, please leave a issue on GitHub with the right label:

https://github.com/Parisson/Telemeta/issues/new

You can also leave some ticket to request some new interesting features for the next versions and tweet your ideas to `@telemeta <https://twitter.com/telemeta>`_.

And remember: even if Telemeta suits you, please give us some feedback !


License
=======

This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.


Sponsors and partners
======================

  * CNRS_ : Centre National de la Recherche Scientifique (French Natianal Research and Scientific Center)
  * MCC_ : Ministère de la Culture et de la Communication (the french Ministry of the Culture and Communication)
  * ANR_ : Agence Nationale de la Recherche (French Research Agency)
  * UPMC_ : University Pierre et Marie Curie (Paris 6, France)
  * CREM_ : Centre de Recherche en Ethnomusicologie (Ethnomusicology Research Center)
  * LAM_ : Equipe Lutherie, Acoustique et Musique de l'IJLRDA_
  * IJLRDA_ : Institut Jean le Rond d'Alembert (Paris, France)
  * Parisson_ : Open audio development agency for science and arts (Paris, France)
  * MNHN_ : Museum National d'Histoire Naturelle (National Museum of Biology, Paris, France)
  * U-Paris10_ : University Paris Oues Nanterre (Paris 10, France)
  * MuseeDelHomme_ : Musée de l'Homme (Paris, France)
  * DIADEMS_project_ : involving IRIT_, LIMSI_, LAM_, CREM_, LABRI_, MNHN_, Parisson_
  * HumaNum_ : TGIR des humanités numériques
  * IRCAM_ : Institut de Recherche et de Coordination Acoustique / Musique (Paris, France)


Related projects
=================

* TimeSide_ : audio processing framework for the web
* DIADEMS_ : Description, Indexation, Access to Sound and Ethnomusicological Documents, funded by the French Research Agency (ANR CONTINT 2012)
* TimeSide-DIADEMS_ : a set of Timeside plugins developed during the Diadems project
* DaCaRyH
* Kamoulox
* WASABI


.. _Telemeta: http://telemeta.org
.. _TimeSide: https://github.com/Parisson/TimeSide/
.. _OAI-PMH: http://fr.wikipedia.org/wiki/Open_Archives_Initiative_Protocol_for_Metadata_Harvesting
.. _Parisson: http://parisson.com
.. _CNRS: http://www.cnrs.fr
.. _MCC: http://www.culturecommunication.gouv.fr
.. _CREM: http://www.crem-cnrs.fr
.. _HumaNum: http://www.huma-num.fr
.. _IRIT: http://www.irit.fr
.. _LIMSI: http://www.limsi.fr/index.en.html
.. _LAM: http://www.lam.jussieu.fr
.. _LABRI: http://www.labri.fr
.. _MNHN: http://www.mnhn.fr
.. _MMSH: http://www.mmsh.univ-aix.fr
.. _UPMC: http://www.upmc.fr
.. _DIADEMS_project: http://www.irit.fr/recherches/SAMOVA/DIADEMS/fr/welcome/&cultureKey=en
.. _ANR: http://www.agence-nationale-recherche.fr/
.. _SABIOD: http://sabiod.telemeta.org
.. _CHANGELOG: http://github.com/Parisson/Telemeta/blob/master/CHANGELOG.rst
.. _Publications: https://github.com/Parisson/Telemeta-doc
.. _API : http://files.parisson.com/doc/telemeta/
.. _Player : https://github.com/Parisson/TimeSide/
.. _Example : http://archives.crem-cnrs.fr/archives/items/CNRSMH_E_2004_017_001_01/
.. _Homepage: http://telemeta.org
.. _GitHub: https://github.com/Parisson/Telemeta/
.. _IJLRDA: http://www.dalembert.upmc.fr/ijlrda/
.. _Labex-Passé_Présent: http://passes-present.eu/
.. _U-Paris10: http://www.u-paris10.fr/
.. _MuseeDelHomme: http://www.museedelhomme.fr/
.. _IRCAM: http://www.ircam.fr
.. _TimeSide-DIADEMS: https://github.com/ANR-DIADEMS/timeside-diadems
