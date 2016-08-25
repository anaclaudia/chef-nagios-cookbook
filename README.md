## How to

First of all, this recipe was created and tested using Vagrant.

You need to download and install it: ``https://www.vagrantup.com/downloads.html``

Then clone the git repository: ``git clone git@github.com:anaclaudia/chef-nagios-cookbook.git``

Go to the project directory: ``cd chef-nagios-cookbook``

## Installing Test Kitchen

``gem install test-kitchen``

``gem install kitchen-vagrant``

## Deploy a Nagios Server on vagrant machine

``kitchen create default-ubuntu-1404``

``kitchen converge default-ubuntu-1404``

``kitchen verify default-ubuntu-1404``

## Access nagios web interface

``192.168.33.33/nagios``

``user: nagiosadmin``
``password: ddd001``

To change the ip address, you can edit the file: '.kitchen.yml'

## Customizing commands and adding hosts to be monitored

To customize or add new commands to be monitorized on remote hosts, edit the file: 'cookbooks/app/templates/appserver.cfg.erb'

For each new host that will be monitorized, you need create a new file 'mynewserver.cfg.erb' following the example above and changing what's necessary.

To finish edit the file 'cookbooks/app/templates/nagios.cfg.erb' and search for the section: '# OBJECT CONFIGURATION FILE(S)' and add the following line: 'cfg_file=/usr/local/nagios/etc/objects/mynewserver.cfg'
