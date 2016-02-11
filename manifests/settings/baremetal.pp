# Class for configuring Tempest Baremetal settings
#
#  [*service_available*]
#    (Optional) Whether or not Ironic is expected to be available
#    Defaults to $::os_service_default
#
#  [*catalog_type*]
#    (Optional) Catalog type of the baremetal provisioning service
#    Defaults to $::os_service_default
#
#  [*active_timeout*]
#    (Optional) Timeout for Ironic node to completely provision
#    Defaults to $::os_service_default
#
#  [*association_timeout*]
#    (Optional) Timeout for association of Nova instance and Ironic node
#    Defaults to $::os_service_default
#
#  [*unprovision_timeout*]
#    (Optional) Timeout for unprovisioning an Ironic node. Takes longer since
#    Kilo as Ironic performs an extra step in Node cleaning.
#    Defaults to $::os_service_default
#
#  [*driver*]
#    (Optional) Driver name which Ironic uses
#    Defaults to $::os_service_default
#
#  [*driver_enabled*]
#    (Optional) Whether the Ironic nova-compute driver is enabled
#    Defaults to $::os_service_default
#
#  [*endpoint_type*]
#    (Optional) The endpoint type to use for the baremetal service. Allowed
#    values: public, admin, internal, publicURL, adminURL, internalURL
#    Defaults to $::os_service_default
#
#  [*power_timeout*]
#    (Optional) Timeout for Ironic power transitions.
#    Defaults to $::os_service_default
#
class tempest::settings::baremetal (
  $service_available   = $::os_service_default,
  $catalog_type        = $::os_service_default,
  $active_timeout      = $::os_service_default,
  $association_timeout = $::os_service_default,
  $unprovision_timeout = $::os_service_default,
  $driver              = $::os_service_default,
  $driver_enabled      = $::os_service_default,
  $endpoint_type       = $::os_service_default,
  $power_timeout       = $::os_service_default,
) {

  tempest_config {
    'service_available/ironic':      value => $service_available;
    'baremetal/catalog_type':        value => $catalog_type;
    'baremetal/active_timeout':      value => $active_timeout;
    'baremetal/association_timeout': value => $association_timeout;
    'baremetal/unprovision_timeout': value => $unprovision_timeout;
    'baremetal/driver':              value => $driver;
    'baremetal/driver_enabled':      value => $driver_enabled;
    'baremetal/endpoint_type':       value => $endpoint_type;
    'baremetal/power_timeout':       value => $power_timeout;
  }

}
