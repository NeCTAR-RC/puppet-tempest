# Class for configuring Tempest alarming settings
#
#  [*service_available*]
#    (Optional) Whether or not Aodh is expected to be available
#    Defaults to $::os_service_default
#
#  [*catalog_type*]
#    (Optional) Catalog type of the Alarming service.
#    Defaults to $::os_service_default
#
#  [*endpoint_type*]
#    (Optional) The endpoint type to use for the alarming service. Allowed
#    values: public, admin, internal, publicURL, adminURL, internalURL
#    Defaults to $::os_service_default
#
class tempest::settings::alarming (
  $service_available = $::os_service_default,
  $catalog_type      = $::os_service_default,
  $endpoint_type     = $::os_service_default,
) {

  tempest_config {
    'service_available/aodh': value => $service_available;
    'alarming/catalog_type':  value => $catalog_type;
    'alarming/endpoint_type': value => $endpoint_type;
  }

}
