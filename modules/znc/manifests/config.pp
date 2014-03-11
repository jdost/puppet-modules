class znc::config
inherits znc {
   file { 'znc_config_dir':
      require => User['znc'],
      path    => $config_location,
      ensure  => directory,
      owner   => $user,
      group   => $group,
      mode    => 0770,
   }

   file { 'znc_hasher':
      path   => "${home}/generate_hash",
      source => "puppet:///modules/znc/generate_hash",
      owner  => $user,
      group  => $group,
      mode   => 0770
   }

   file { 'znc_config':
      require => File['znc_config_dir'],
      path    => "${config_location}/znc.conf",
      content => template("znc/config.erb"),
      owner   => $user,
      group   => $group,
      mode    => 0660
   }
}

