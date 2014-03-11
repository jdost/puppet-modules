# Puppet module practice

I am writing puppet modules for various services I use (or want to) as a form of 
both practicing my puppet writing and getting to better know the services and all 
the various settings for them.  Included is a `Vagrantfile` that I use to test each
module.  In each module, there is an `example.pp` that was used when testing the
module.  To recreate it, just copy it to the `manifests` of the project and add the
line `include "example"` in the `default.pp` file.

## Modules TODO

* bitlbee
* courier
* fail2ban
* ircd
* jabberd
* jekyll
* mopidy
* mpd
* murmur
* mysqld
* nginx
* php
* plex
* postgresql
* sabnzbd
* samba
* sshd
* ssl
* supervisord
* wordpress
* ~~znc~~
