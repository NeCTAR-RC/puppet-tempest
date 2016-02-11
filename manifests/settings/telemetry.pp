# Class for configuring Tempest telemetry settings
#
#  [*service_available*]
#    (Optional) Whether or not Ceilometer is expected to be available
#    Defaults to $::os_service_default
#
#  [*too_slow_to_test*]
#    (Optional) This variable is used as flag to enable notification tests
#    Defaults to $::os_service_default
#
#  [*catalog_type*]
#    (Optional) Catalog type of the Telemetry service.
#    Defaults to $::os_service_default
#
#  [*endpoint_type*]
#    (Optional) The endpoint type to use for the Telemetry service. Allowed
#    values: public, admin, internal, publicURL, adminURL, internalURL
#    Defaults to $::os_service_default
#
#  [*events*]
#    (Optional) Runs Ceilometer event-related tests
#    Defaults to $::os_service_default
#
class tempest::settings::telemetry (
  $service_available = $::os_service_default,
  $catalog_type      = $::os_service_default,
  $endpoint_type     = $::os_service_default,
  $events            = $::os_service_default,
) {

  tempest_config {
    'service_available/ceilometer':     value => $service_available;
    'telemetry/catalog_type':           value => $catalog_type;
    'telemetry/endpoint_type':          value => $endpoint_type;
    'telemetry-feature-enabled/events': value => $events;
  }

}
