class znc::service
inherits znc {
   file { "znc_initscript":
      path    => "/etc/init.d/znc",
      ensure  => present,
      content => template("znc/initscript.erb"),
      require => Package["znc"],
      notify  => Service["znc"],
      mode    => 0755,
      owner   => $user,
      group   => $group,
   }

   service { "znc":
      name    => "znc",
      ensure  => $start,
      enable  => $autostart,
      require => File["znc_initscript"],
   }
}
