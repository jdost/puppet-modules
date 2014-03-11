include "znc"
include "znc::service"

znc::user { "admin":
   password => "admin",
   admin    => true
}

znc::user { "Test":
   password => "test",
}

znc::user { "Complex":
   password    => "stuff",
   use_ssl     => false,
   modules     => ['nickserv what what'],
   channels    => [{
      name     => '#python',
      detached => true,
      buffer   => 63
   }, '#archlinux-offtopic']
}
