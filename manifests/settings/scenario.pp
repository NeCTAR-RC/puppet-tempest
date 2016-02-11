# Class for configuring Tempest scenario settings
#
#  [*img_dir*]
#    (Optional) Image directory
#    Defaults to $::os_service_default
#
#  [*img_file*]
#    (Optional) Image file name
#    Defaults to $::os_service_default
#
#  [*img_disk_format*]
#    (Optional) Image disk format
#    Defaults to $::os_service_default
#
#  [*img_container_format*]
#    (Optional) Image container format
#    Defaults to $::os_service_default
#
#  [*img_properties*]
#    (Optional) Glance image properties. Use for custom images which require
#    them
#    Defaults to $::os_service_default
#
#  [*img_file*]
#    (Optional) Image file name
#    Defaults to $::os_service_default
#
#  [*large_ops_number*]
#    (Optional) specifies how many resources to request at once. Used for large
#    operations testing.
#    Defaults to $::os_service_default
#
#  [*dhcp_client*]
#    (Optional) DHCP client used by images to renew DCHP lease. If left empty,
#    update operation will be skipped.
#    Allowed values: udhcpc, dhclient, ''
#    Defaults to $::os_service_default
#
#  [*ssh_user_regex*]
#    Defaults to $::os_service_default
#
#  [*non_ssh_image_regex*]
#    Defaults to $::os_service_default
#
#  [*image_regex*]
#    Defaults to $::os_service_default
#
#  [*flavor_regex*]
#    Defaults to $::os_service_default
#
class tempest::settings::scenario (
  $img_dir              = $::os_service_default,
  $img_file             = $::os_service_default,
  $img_container_format = $::os_service_default,
  $img_properties       = $::os_service_default,
  $large_ops_number     = $::os_service_default,
  $dhcp_client          = $::os_service_default,
  $img_disk_format      = $::os_service_default,
  $ssh_user_regex       = $::os_service_default,
  $non_ssh_image_regex  = $::os_service_default,
  $image_regex          = $::os_service_default,
  $flavor_regex         = $::os_service_default,
) {

  tempest_config {
    'scenario/img_dir':                   value => $img_dir;
    'scenario/img_file':                  value => $img_file;
    'scenario/img_container_format':      value => $img_container_format;
    'scenario/img_properties':            value => $img_properties;
    'scenario/large_ops_number':          value => $large_ops_number;
    'scenario/dhcp_client':               value => $dhcp_client;
    'scenario/img_disk_format':           value => $img_disk_format;
    'input-scenario/ssh_user_regex':      value => $ssh_user_regex;
    'input-scenario/non_ssh_image_regex': value => $non_ssh_image_regex;
    'input-scenario/image_regex':         value => $image_regex;
    'input-scenario/flavor_regex':        value => $flavor_regex;
  }

}
