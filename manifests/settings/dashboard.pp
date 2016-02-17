# Class for configuring Tempest dashboard settings
#
#  [*service_available*]
#    (Optional) Whether or not Horizon is expected to be available
#    Defaults to $::os_service_default
#
#  [*url*]
#    Defaults to $::os_service_default
#
class tempest::settings::dashboard (
  $service_available       = $::os_service_default,
  $url                     = $::os_service_default,
) {

  tempest_config {
    'service_available/horizon': value => $service_available;
    'dashboard/dashboard_url':   value => $url;
  }

}
