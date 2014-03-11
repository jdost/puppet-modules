class znc::package
inherits znc {
   package { "znc":
      ensure  => $version,
      require => Exec["update"]
   }
}
