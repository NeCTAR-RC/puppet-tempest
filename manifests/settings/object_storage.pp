# Class for configuring Tempest Object Storage settings
#
#  [*service_available*]
#    (Optional) Whether or not swift is expected to be available
#    Defaults to $::os_service_default
#
#  [*operator_role*]
#    (Optional) Role to add to users created for swift tests to enable creating
#    containers
#    Defaults to $::os_service_default
#
#  [*reseller_admin_role*]
#    (Optional) User role that has reseller admin
#    Defaults to $::os_service_default
#
#  [*endpoint_type*]
#    (Optional) The endpoint type to use for the Object-Storage service. Allowed
#    values: public, admin, internal, publicURL, adminURL, internalURL
#    Defaults to $::os_service_default
#
#  [*catalog_type*]
#    (Optional) Catalog type of the Object-Storage service.
#    Defaults to $::os_service_default
#
#  [*container_sync_timeout*]
#    (Optional) Number of seconds to time on waiting for a container to
#    container synchronization complete.
#    Defaults to $::os_service_default
#
#  [*realm_name*]
#    (Optional) Name of sync realm. A sync realm is a set of clusters that have
#    agreed to allow container syncing with each other. Set the same realm name
#    as Swift's container-sync-realms.conf
#    Defaults to $::os_service_default
#
#  [*cluster_name*]
#    (Optional) One name of cluster which is set in the realm whose name is set
#    in 'realm_name' item in this file. Set the same cluster name as Swift's
#    container-sync-realms.conf
#    Defaults to $::os_service_default
#
#  [*container_sync_interval*]
#    (Optional) Number of seconds to wait while looping to check the status of a
#    container to container synchronization
#    Defaults to $::os_service_default
#
#  [*discoverable_apis*]
#    (Optional) A list of the enabled optional discoverable apis. A single
#    entry, all, indicates that all of these features are expected to be enabled
#    Defaults to $::os_service_default
#
#  [*discoverability*]
#    (Optional) Execute discoverability tests
#    Defaults to $::os_service_default
#
#  [*container_sync*]
#    (Optional) Execute (old style) container-sync tests
#    Defaults to $::os_service_default
#
#  [*object_versioning*]
#    (Optional) Execute object-versioning tests
#    Defaults to $::os_service_default
#
class tempest::settings::object_storage (
  $service_available       = $::os_service_default,
  $operator_role           = $::os_service_default,
  $reseller_admin_role     = $::os_service_default,
  $endpoint_type           = $::os_service_default,
  $catalog_type            = $::os_service_default,
  $container_sync_timeout  = $::os_service_default,
  $realm_name              = $::os_service_default,
  $cluster_name            = $::os_service_default,
  $container_sync_interval = $::os_service_default,
  $discoverable_apis       = $::os_service_default,
  $discoverability         = $::os_service_default,
  $container_sync          = $::os_service_default,
  $object_versioning       = $::os_service_default,
) {

  tempest_config {
    'service_available/swift':                          value => $service_available;
    'object-storage/operator_role':                     value => $operator_role;
    'object-storage/reseller_admin_role':               value => $reseller_admin_role;
    'object-storage/endpoint_type':                     value => $endpoint_type;
    'object-storage/catalog_type':                      value => $catalog_type;
    'object-storage/container_sync_timeout':            value => $container_sync_timeout;
    'object-storage/realm_name':                        value => $realm_name;
    'object-storage/cluster_name':                      value => $cluster_name;
    'object-storage/container_sync_interval':           value => $container_sync_interval;
    'object-storage-feature-enabled/discoverable_apis': value => $discoverable_apis;
    'object-storage-feature-enabled/discoverability':   value => $discoverability;
    'object-storage-feature-enabled/container_sync':    value => $container_sync;
    'object-storage-feature-enabled/object_versioning': value => $object_versioning;
  }

}
