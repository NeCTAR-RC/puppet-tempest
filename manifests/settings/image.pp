# Class for configuring Tempest Image settings
#
#  [*service_available*]
#    (Optional) Whether or not glance is expected to be available
#    Defaults to $::os_service_default
#
#  [*build_interval*]
#    (Optional) Time in seconds between build status checks. Time in seconds
#    between image operation status checks. Time in seconds between network
#    operation status checks. Time in seconds between build status checks. Time
#    in seconds between volume availability checks.
#    Defaults to $::os_service_default
#
#  [*endpoint_type*]
#    (Optional) The endpoint type to use for the Image service. Allowed
#    values: public, admin, internal, publicURL, adminURL, internalURL
#    Defaults to $::os_service_default
#
#  [*catalog_type*]
#    (Optional) Catalog type of the Image service.
#    Defaults to $::os_service_default
#
#  [*http_image*]
#    Defaults to $::os_service_default
#
#  [*disk_formats*]
#    (Optional) A list of image's disk formats users can specify.
#    Defaults to $::os_service_default
#
#  [*container_formats*]
#    (Optional) A list of image's container formats users can specify.
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
#  [*api_v2*]
#    (Optional) Is the v2 identity API enabled Is the v2 image API enabled Is
#    the v2 volume API enabled
#    Defaults to $::os_service_default
#
#  [*deactivate_image*]
#    (Optional) Is the deactivate-image feature enabled. The feature has been
#    integrated since Kilo.
#    Defaults to $::os_service_default
#
#  [*api_v1*]
#    (Optional) Is the v1 image API enabled Is the v1 volume API enabled
#    Defaults to $::os_service_default
#
class tempest::settings::image (
  $service_available = $::os_service_default,
  $build_interval    = $::os_service_default,
  $endpoint_type     = $::os_service_default,
  $catalog_type      = $::os_service_default,
  $http_image        = $::os_service_default,
  $disk_formats      = $::os_service_default,
  $container_formats = $::os_service_default,
  $build_timeout     = $::os_service_default,
  $api_v2            = $::os_service_default,
  $deactivate_image  = $::os_service_default,
  $api_v1            = $::os_service_default,
) {

  tempest_config {
    'service_available/glance':               value => $service_available;
    'image/build_interval':                   value => $build_interval;
    'image/endpoint_type':                    value => $endpoint_type;
    'image/catalog_type':                     value => $catalog_type;
    'image/http_image':                       value => $http_image;
    'image/disk_formats':                     value => $disk_formats;
    'image/container_formats':                value => $container_formats;
    'image/build_timeout':                    value => $build_timeout;
    'image-feature-enabled/api_v2':           value => $api_v2;
    'image-feature-enabled/deactivate_image': value => $deactivate_image;
    'image-feature-enabled/api_v1':           value => $api_v1;
  }

}
