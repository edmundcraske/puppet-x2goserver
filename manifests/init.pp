# Class: x2goserver
# ===========================
#
# Full description of class x2goserver here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class x2goserver (
  $package_name = $::x2goserver::params::package_name,
  $service_name = $::x2goserver::params::service_name,
) inherits ::x2goserver::params {

  # validate parameters here

  class { '::x2goserver::install': } ->
  class { '::x2goserver::config': } ~>
  class { '::x2goserver::service': } ->
  Class['::x2goserver']
}
