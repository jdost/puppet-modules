class znc (
   $version = $znc::params::version,
   $install_extras = $znc::params::install_extras,
   $user = $znc::params::daemon_user,
   $group = $znc::params::daemon_group,
   $home = $znc::params::daemon_home,
   $autostart = $znc::params::autostart,
   $start = $znc::params::start_on_install,
   $bin_location = $znc::params::bin_location,
   $port = $znc::params::port,
   $use_ssl = false,
   $modules = $znc::params::modules,
   $config_location = $znc::params::config_folder,
) inherits znc::params {
   class { '::znc::setup': } ->
      class { '::znc::package': } ->
      class { '::znc::config': } ~>
      class { '::znc::service': }
}
