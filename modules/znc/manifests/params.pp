class znc::params {
   $version = "latest"
   $install_extras = false
   $autostart = true
   $start = true
   $bin_location = "/usr/bin/znc"
   $daemon_home = "/var/lib/znc"
   $daemon_user = "znc"
   $daemon_group = "znc"
   $config_folder = "${daemon_home}/configs"
   $port = 6667
   $modules = ["fail2ban 15 3", "partyline ~#znc", "webadmin"]
}
