# ZNC puppet module

Provides a base config generation, initscript setup and automated startup for the 
znc IRC bouncer.  Per user configuration addition with password hashing is also
possible.

## Usage

To use the default setup just `include "znc"`, if you want to override the defaults,
declare the class:
```puppet
znc { "znc":
   user  => "irc",
   group => "irc",
   home  => "/opt/znc",
}
```
To add users to the ZNC instance, you can then declare the `znc::user` class:
```puppet
znc::user { 'jdost':
   password => 'logmein',
   use_ssl  => false,
   irc_host => 'localhost',
   channels => [{
      name   => '#puppet',
      buffer => 45
   }]
}
```

## TODO

* add more options for both users and the main server
* expand module support
* wider os support range
* systemd and other daemon handlers (supervisord?)
* figure out way to replace shell script for password hash generation
