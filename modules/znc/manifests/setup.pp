class znc::setup
inherits znc {
   group { "znc":
      name   => $group,
      ensure => present,
   }

   user { "znc":
      name    => $user,
      gid     => $group,
      home    => $home,
      system  => true,
      require => Exec["znc_home_dir"],
   }

   exec { "znc_home_dir":
      command => "/bin/mkdir -p ${home}",
   }
}
