# == Class x2goserver::params
#
# This class is meant to be called from x2goserver.
# It sets variables according to platform.
#
class x2goserver::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'x2goserver'
      $service_name = 'x2goserver'
    }
    'RedHat', 'Amazon': {
      $package_name = 'x2goserver'
      $service_name = 'x2goserver'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
