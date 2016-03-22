# == Class x2goserver::service
#
# This class is meant to be called from x2goserver.
# It ensure the service is running.
#
class x2goserver::service {

  service { $::x2goserver::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
