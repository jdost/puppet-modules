define znc::user (
   $password = "",
   $admin = false,
   $nick = $title,
   $alt_nick = "${title}_",
   $ident = $title,
   $real_name = $title,
   $history_length = 50,
   $keep_history = false,
   $quit_message = '',
   $default_modes = '+stn',
   $multiple_clients = true,
   $modules = ['admin', 'chansaver', 'keepnick', 'kickrejoin', 'nickserv', 'perform', 'simple_away'],
   $irc_host = 'irc.freenode.net',
   $irc_port = 6667,
   $irc_password = '',
   $use_ssl = true,
   $channels = [],
   $config_folder = $::znc::config_location,
   $daemon_home = $::znc::home,
) {
   require "znc"

   file { "znc_user_${name}":
      path    => "${config_folder}/${name}.conf",
      content => template("znc/user.erb"),
      owner   => $user,
      mode    => 0660,
      before  => Exec["hash_password_${name}"],
   }

   if $password != '' {
      exec { "hash_password_${name}" :
         command => "${daemon_home}/generate_hash ${config_folder}/${name}.conf ${password}",
         user    => $user,
         before  => Exec["add_znc_user_${name}"],
         require => File['znc_hasher']
      }
   } else {
      exec { "hash_password_${name}":
         command => "/bin/echo ''",
         before  => Exec["add_znc_user_${name}"],
      }
   }

   exec { "add_znc_user_${name}":
      command   => "/bin/cat ${config_folder}/${name}.conf >> ${config_folder}/znc.conf",
      unless    => "/bin/grep '<User ${name}>' ${config_folder}/znc.conf",
      user      => $user,
      subscribe => File['znc_config']
   }
}
