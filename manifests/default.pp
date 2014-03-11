if $::osfamily == "debian" {
   exec { "update": command => "/usr/bin/apt-get update" }
}

import 'example.pp'
