# Class for configuring Tempest Compute settings
#
#  [*service_available*]
#    (Optional) Whether or not nova is expected to be available
#    Defaults to $::os_service_default
#
#  [*availability_zone*]
#    (Optional) The availability zone to use for the compute service,
#    Defaults to $::os_service_default
#
#  [*endpoint_type*]
#    (Optional) The endpoint type to use for the compute service.
#    Defaults to $::os_service_default
#
#  [*ready_wait*]
#    (Optional) Additional wait time for clean state, when there is no
#    OS-EXT-STS extension available
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
#  [*catalog_type*]
#    (Optional) Catalog type of the Compute service.
#    Defaults to $::os_service_default
#
#  [*shelved_offload_time*]
#    (Optional) Time in seconds before a shelved instance is eligible for
#    removing from a host.  -1 never offload, 0 offload when shelved. This time
#    should be the same as the time of nova.conf, and some tests will run for as
#    long as the time.
#    Defaults to $::os_service_default
#
#  [*flavor_ref*]
#    (Optional) Valid primary flavor to use in tests. Valid primary flavor to
#    use in database tests. #db_flavor_ref = 1
#    Defaults to $::os_service_default
#
#  [*image_ref*]
#    (Optional) Valid primary image reference to be used in tests. This is a
#    required option
#    Defaults to $::os_service_default
#
#  [*min_compute_nodes*]
#    (Optional) The minimum number of compute nodes expected. This will be
#    utilized by some multinode specific tests to ensure that requests match the
#    expected size of the cluster you are testing with.
#    Defaults to $::os_service_default
#
#  [*fixed_network_name*]
#    (Optional) Name of the fixed network that is visible to all test tenants.
#    If multiple networks are available for a tenant this is the network which
#    will be used for creating servers if tempest does not create a network or a
#    network is not specified elsewhere. It may be used for ssh validation only
#    if floating IPs are disabled.
#    Defaults to $::os_service_default
#
#  [*flavor_ref_alt*]
#    (Optional) Valid secondary flavor to be used in tests.
#    Defaults to $::os_service_default
#
#  [*volume_device_name*]
#    (Optional) Expected device name when a volume is attached to an instance
#    Defaults to $::os_service_default
#
#  [*build_interval*]
#    (Optional) Time in seconds between build status checks. Time in seconds
#    between image operation status checks. Time in seconds between network
#    operation status checks. Time in seconds between build status checks. Time
#    in seconds between volume availability checks.
#    Defaults to $::os_service_default
#
#  [*image_ref_alt*]
#    (Optional) Valid secondary image reference to be used in tests. This is a
#    required option, but if only one image is available duplicate the value of
#    image_ref above
#    Defaults to $::os_service_default
#
#  [*attach_encrypted_volume*]
#    (Optional) Does the test environment support attaching an encrypted volume
#    to a running server instance? This may depend on the combination of
#    compute_driver in nova and the volume_driver(s) in cinder.
#    Defaults to $::os_service_default
#
#  [*rdp_console*]
#    (Optional) Enable RDP console. This configuration value should be same as
#    [nova.rdp]->enabled in nova.conf
#    Defaults to $::os_service_default
#
#  [*live_migration*]
#    (Optional) Does the test environment support live migration available?
#    Defaults to $::os_service_default
#
#  [*metadata_service*]
#    (Optional) Does the test environment support metadata service? Ignored
#    unless validation.run_validation=true.
#    Defaults to $::os_service_default
#
#  [*block_migration_for_live_migration*]
#    (Optional) Does the test environment use block devices for live migration
#    Defaults to $::os_service_default
#
#  [*allow_duplicate_networks*]
#    (Optional) Does the test environment support creating instances with
#    multiple ports on the same network? This is only valid when using Neutron.
#    Defaults to $::os_service_default
#
#  [*block_migrate_cinder_iscsi*]
#    (Optional) Does the test environment block migration support cinder iSCSI
#    volumes. Note, libvirt doesn't support this, see
#    https://bugs.launchpad.net/nova/+bug/1398999
#    Defaults to $::os_service_default
#
#  [*min_microversion*]
#    (Optional) Lower version of the test target microversion range. The format
#    is 'X.Y', where 'X' and 'Y' are int values. Tempest selects tests based on
#    the range between min_microversion and max_microversion. If both values are
#    not specified, Tempest avoids tests which require a microversion. Valid
#    values are string with format 'X.Y' or string 'latest'
#    Defaults to $::os_service_default
#
#  [*live_migrate_paused_instances*]
#    (Optional) Does the test system allow live-migration of paused instances?
#    Note, this is more than just the ANDing of paused and live_migrate, but all
#    3 should be set to True to run those tests
#    Defaults to $::os_service_default
#
#  [*vnc_console*]
#    (Optional) Enable VNC console. This configuration value should be same as
#    [nova.vnc]->vnc_enabled in nova.conf
#    Defaults to $::os_service_default
#
#  [*rescue*]
#    (Optional) Does the test environment support instance rescue mode?
#    Defaults to $::os_service_default
#
#  [*max_microversion*]
#    (Optional) Upper version of the test target microversion range. The format
#    is 'X.Y', where 'X' and 'Y' are int values. Tempest selects tests based on
#    the range between min_microversion and max_microversion. If both values are
#    not specified, Tempest avoids tests which require a microversion. Valid
#    values are string with format 'X.Y' or string 'latest'
#    Defaults to $::os_service_default
#
#  [*disk_config*]
#    (Optional) If false, skip disk config tests
#    Defaults to $::os_service_default
#
#  [*api_extensions*]
#    (Optional) A list of enabled compute extensions with a special entry all
#    which indicates every extension is enabled.
#    Defaults to $::os_service_default
#
#  [*enable_instance_password*]
#    (Optional) Enables returning of the instance password by the relevant
#    server API calls such as create, rebuild or rescue.
#    Defaults to $::os_service_default
#
#  [*change_password*]
#    (Optional) Does the test environment support changing the admin password?
#    Defaults to $::os_service_default
#
#  [*spice_console*]
#    (Optional) Enable Spice console. This configuration value should be same as
#    [nova.spice]->enabled in nova.conf
#    Defaults to $::os_service_default
#
#  [*interface_attach*]
#    (Optional) Does the test environment support dynamic network interface
#    attachment?
#    Defaults to $::os_service_default
#
#  [*console_output*]
#    (Optional) Does the test environment support obtaining instance serial
#    console output?
#    Defaults to $::os_service_default
#
#  [*snapshot*]
#    (Optional) Does the test environment support creating snapshot images of
#    running instances? Runs Cinder volume snapshot test
#    Defaults to $::os_service_default
#
#  [*resize*]
#    (Optional) Does the test environment support resizing?
#    Defaults to $::os_service_default
#
#  [*config_drive*]
#    (Optional) Enable special configuration drive with metadata.
#    Defaults to $::os_service_default
#
#  [*nova_cert*]
#    (Optional) Does the test environment have the nova cert running?
#    Defaults to $::os_service_default
#
#  [*pause*]
#    (Optional) Does the test environment support pausing?
#    Defaults to $::os_service_default
#
#  [*personality*]
#    (Optional) Does the test environment support server personality
#    Defaults to $::os_service_default
#
#  [*shelve*]
#    (Optional) Does the test environment support shelving/unshelving?
#    Defaults to $::os_service_default
#
#  [*preserve_ports*]
#    (Optional) Does Nova preserve preexisting ports from Neutron when deleting
#    an instance? This should be set to True if testing Kilo+ Nova.
#    Defaults to $::os_service_default
#
#  [*suspend*]
#    (Optional) Does the test environment support suspend/resume?
#    Defaults to $::os_service_default
#
class tempest::settings::compute (
  $service_available                   = $::os_service_default,
  $availability_zone                   = $::os_service_default,
  $endpoint_type                       = $::os_service_default,
  $ready_wait                          = $::os_service_default,
  $build_timeout                       = $::os_service_default,
  $catalog_type                        = $::os_service_default,
  $shelved_offload_time                = $::os_service_default,
  $flavor_ref                          = $::os_service_default,
  $image_ref                           = $::os_service_default,
  $min_compute_nodes                   = $::os_service_default,
  $fixed_network_name                  = $::os_service_default,
  $flavor_ref_alt                      = $::os_service_default,
  $volume_device_name                  = $::os_service_default,
  $build_interval                      = $::os_service_default,
  $image_ref_alt                       = $::os_service_default,
  $attach_encrypted_volume             = $::os_service_default,
  $rdp_console                         = $::os_service_default,
  $live_migration                      = $::os_service_default,
  $metadata_service                    = $::os_service_default,
  $block_migration_for_live_migration  = $::os_service_default,
  $allow_duplicate_networks            = $::os_service_default,
  $block_migrate_cinder_iscsi          = $::os_service_default,
  $min_microversion                    = $::os_service_default,
  $live_migrate_paused_instances       = $::os_service_default,
  $vnc_console                         = $::os_service_default,
  $rescue                              = $::os_service_default,
  $max_microversion                    = $::os_service_default,
  $disk_config                         = $::os_service_default,
  $api_extensions                      = $::os_service_default,
  $enable_instance_password            = $::os_service_default,
  $change_password                     = $::os_service_default,
  $spice_console                       = $::os_service_default,
  $interface_attach                    = $::os_service_default,
  $console_output                      = $::os_service_default,
  $snapshot                            = $::os_service_default,
  $resize                              = $::os_service_default,
  $config_drive                        = $::os_service_default,
  $nova_cert                           = $::os_service_default,
  $pause                               = $::os_service_default,
  $personality                         = $::os_service_default,
  $shelve                              = $::os_service_default,
  $preserve_ports                      = $::os_service_default,
  $suspend                             = $::os_service_default,
) {

  tempest_config {
    'service_available/nova':                                     value => $service_available;
    'compute/endpoint_type':                                      value => $endpoint_type;
    'compute/ready_wait':                                         value => $ready_wait;
    'compute/availability_zone':                                  value => $availability_zone;
    'compute/build_timeout':                                      value => $build_timeout;
    'compute/catalog_type':                                       value => $catalog_type;
    'compute/shelved_offload_time':                               value => $shelved_offload_time;
    'compute/flavor_ref':                                         value => $flavor_ref;
    'compute/image_ref':                                          value => $image_ref;
    'compute/min_compute_nodes':                                  value => $min_compute_nodes;
    'compute/fixed_network_name':                                 value => $fixed_network_name;
    'compute/flavor_ref_alt':                                     value => $flavor_ref_alt;
    'compute/volume_device_name':                                 value => $volume_device_name;
    'compute/build_interval':                                     value => $build_interval;
    'compute/image_ref_alt':                                      value => $image_ref_alt;
    'compute-feature-enabled/attach_encrypted_volume':            value => $attach_encrypted_volume;
    'compute-feature-enabled/rdp_console':                        value => $rdp_console;
    'compute-feature-enabled/live_migration':                     value => $live_migration;
    'compute-feature-enabled/metadata_service':                   value => $metadata_service;
    'compute-feature-enabled/block_migration_for_live_migration': value => $block_migration_for_live_migration;
    'compute-feature-enabled/allow_duplicate_networks':           value => $allow_duplicate_networks;
    'compute-feature-enabled/block_migrate_cinder_iscsi':         value => $block_migrate_cinder_iscsi;
    'compute-feature-enabled/min_microversion':                   value => $min_microversion;
    'compute-feature-enabled/live_migrate_paused_instances':      value => $live_migrate_paused_instances;
    'compute-feature-enabled/vnc_console':                        value => $vnc_console;
    'compute-feature-enabled/rescue':                             value => $rescue;
    'compute-feature-enabled/max_microversion':                   value => $max_microversion;
    'compute-feature-enabled/disk_config':                        value => $disk_config;
    'compute-feature-enabled/api_extensions':                     value => $api_extensions;
    'compute-feature-enabled/enable_instance_password':           value => $enable_instance_password;
    'compute-feature-enabled/change_password':                    value => $change_password;
    'compute-feature-enabled/spice_console':                      value => $spice_console;
    'compute-feature-enabled/interface_attach':                   value => $interface_attach;
    'compute-feature-enabled/console_output':                     value => $console_output;
    'compute-feature-enabled/snapshot':                           value => $snapshot;
    'compute-feature-enabled/resize':                             value => $resize;
    'compute-feature-enabled/config_drive':                       value => $config_drive;
    'compute-feature-enabled/nova_cert':                          value => $nova_cert;
    'compute-feature-enabled/pause':                              value => $pause;
    'compute-feature-enabled/personality':                        value => $personality;
    'compute-feature-enabled/shelve':                             value => $shelve;
    'compute-feature-enabled/preserve_ports':                     value => $preserve_ports;
    'compute-feature-enabled/suspend':                            value => $suspend;
  }
}
