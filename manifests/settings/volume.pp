# Class for configuring Tempest Volume settings
#
#  [*service_available*]
#    (Optional) Whether or not cinder is expected to be available
#    Defaults to $::os_service_default
#
#  [*availability_zone*]
#    (Optional) The availability zone to use when creating volumes.
#    Defaults to $::os_service_default
#
#  [*endpoint_type*]
#    (Optional) The endpoint type to use for the Volume service. Allowed
#    values: public, admin, internal, publicURL, adminURL, internalURL
#    Defaults to $::os_service_default
#
#  [*storage_protocol*]
#    (Optional) Backend protocol to target when creating volume types
#    Defaults to $::os_service_default
#
#  [*backend_names*]
#    (Optional) A list of backend names separated by comma. The backend name
#    must be declared in cinder.conf
#    Defaults to $::os_service_default
#
#  [*build_timeout*]
#    (Optional) Timeout in seconds to wait for an instance to build. Other
#    services that do not define build_timeout will inherit this value. Timeout
#    in seconds to wait for an image to become available. Timeout in seconds to
#    wait for network operation to complete. Timeout in seconds to wait for a
#    volume to become available.
#    Defaults to $::os_service_default
#
#  [*volume_size*]
#    (Optional) Default size in GB for volumes created by volumes tests
#    Defaults to $::os_service_default
#
#  [*catalog_type*]
#    (Optional) Catalog type of the Volume Service
#    Defaults to $::os_service_default
#
#  [*vendor_name*]
#    (Optional) Backend vendor to target when creating volume types
#    Defaults to $::os_service_default
#
#  [*build_interval*]
#    (Optional) Time in seconds between build status checks. Time in seconds
#    between image operation status checks. Time in seconds between network
#    operation status checks. Time in seconds between build status checks. Time
#    in seconds between volume availability checks.
#    Defaults to $::os_service_default
#
#  [*disk_format*]
#    (Optional) Disk format to use when copying a volume to image
#    Defaults to $::os_service_default
#
#  [*api_v1*]
#    (Optional) Is the v1 image API enabled Is the v1 volume API enabled
#    Defaults to $::os_service_default
#
#  [*snapshot*]
#    (Optional) Does the test environment support creating snapshot images of
#    running instances? Runs Cinder volume snapshot test
#    Defaults to $::os_service_default
#
#  [*api_v2*]
#    (Optional) Is the v2 identity API enabled Is the v2 image API enabled Is
#    the v2 volume API enabled
#    Defaults to $::os_service_default
#
#  [*clone*]
#    (Optional) Runs Cinder volume clone test
#    Defaults to $::os_service_default
#
#  [*api_extensions*]
#    (Optional) A list of enabled volume extensions with a special entry all
#    which indicates every extension is enabled.
#    Defaults to $::os_service_default
#
#  [*backup*]
#    (Optional) Runs Cinder volumes backup test
#    Defaults to $::os_service_default
#
#  [*multi_backend*]
#    (Optional) Runs Cinder multi-backend test (requires 2 backends)
#    Defaults to $::os_service_default
#
class tempest::settings::volume (
  $service_available = $::os_service_default,
  $availability_zone = $::os_service_default,
  $endpoint_type     = $::os_service_default,
  $storage_protocol  = $::os_service_default,
  $backend_names     = $::os_service_default,
  $build_timeout     = $::os_service_default,
  $volume_size       = $::os_service_default,
  $catalog_type      = $::os_service_default,
  $vendor_name       = $::os_service_default,
  $build_interval    = $::os_service_default,
  $disk_format       = $::os_service_default,
  $api_v1            = $::os_service_default,
  $snapshot          = $::os_service_default,
  $api_v2            = $::os_service_default,
  $clone             = $::os_service_default,
  $api_extensions    = $::os_service_default,
  $backup            = $::os_service_default,
  $multi_backend     = $::os_service_default,
) {

  tempest_config {
    'service_available/cinder':              value => $service_available;
    'volume/availability_zone':              value => $availability_zone;
    'volume/endpoint_type':                  value => $endpoint_type;
    'volume/storage_protocol':               value => $storage_protocol;
    'volume/backend_names':                  value => $backend_names;
    'volume/build_timeout':                  value => $build_timeout;
    'volume/volume_size':                    value => $volume_size;
    'volume/catalog_type':                   value => $catalog_type;
    'volume/vendor_name':                    value => $vendor_name;
    'volume/build_interval':                 value => $build_interval;
    'volume/disk_format':                    value => $disk_format;
    'volume-feature-enabled/api_v1':         value => $api_v1;
    'volume-feature-enabled/snapshot':       value => $snapshot;
    'volume-feature-enabled/api_v2':         value => $api_v2;
    'volume-feature-enabled/clone':          value => $clone;
    'volume-feature-enabled/api_extensions': value => $api_extensions;
    'volume-feature-enabled/backup':         value => $backup;
    'volume-feature-enabled/multi_backend':  value => $multi_backend;
  }

}
