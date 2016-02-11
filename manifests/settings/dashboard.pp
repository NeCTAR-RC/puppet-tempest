# Class for configuring Tempest dashboard settings
#
#  [*service_available*]
#    (Optional) Whether or not Horizon is expected to be available
#    Defaults to $::os_service_default
#
#  [*dashboard_dashboard_url*]
#    Defaults to $::os_service_default
#
class tempest::settings::dashboard (
  $service_available       = $::os_service_default,
  $dashboard_dashboard_url = $::os_service_default,
) {

  tempest_config {
    'service_available/horizon': value => $service_available;
    'dashboard/dashboard_url':   value => $dashboard_dashboard_url;
  }

}
