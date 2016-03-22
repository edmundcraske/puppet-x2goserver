# == Class x2goserver::install
#
# This class is called from x2goserver for install.
#
class x2goserver::install {

  package { $::x2goserver::package_name:
    ensure => present,
  }
}
