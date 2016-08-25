## How to

First of all, this recipe was created and tested using Vagrant.

You need to download and install it: ``https://www.vagrantup.com/downloads.html``

Then clone the git repository: ``git clone git@github.com:anaclaudia/chef-nagios-cookbook.git``

Go to the project directory: ``cd chef-nagios-cookbook``

## Test Kitchen

``gem install test-kitchen``
``gem install kitchen-vagrant``

``kitchen create default-ubuntu-1404``
``kitchen converge default-ubuntu-1404``
``kitchen verify default-ubuntu-1404``
