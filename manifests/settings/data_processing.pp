# Class for configuring Tempest data processing settings
#
#  [*service_available*]
#    (Optional) Whether or not Sahara is expected to be available
#    Defaults to $::os_service_default
#
#  [*endpoint_type*]
#    (Optional) The endpoint type to use for the data processing service.
#    Allowed values: public, admin, internal, publicURL, adminURL, internalURL
#    Defaults to $::os_service_default
#
#  [*catalog_type*]
#    (Optional) Catalog type of the data processing service.
#    Defaults to $::os_service_default
#
#  [*plugins*]
#    (Optional) List of enabled data processing plugins
#    Defaults to $::os_service_default
#
class tempest::settings::data_processing (
  $service_available = $::os_service_default,
  $endpoint_type     = $::os_service_default,
  $catalog_type      = $::os_service_default,
  $plugins           = $::os_service_default,
) {

  tempest_config {
    'service_available/sahara':                value => $service_available;
    'data-processing/endpoint_type':           value => $endpoint_type;
    'data-processing/catalog_type':            value => $catalog_type;
    'data-processing-feature-enabled/plugins': value => $plugins;
  }

}
