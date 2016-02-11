# Class for configuring Tempest Network settings
#
#  [*service_available*]
#    (Optional) Whether or not neutron is expected to be available
#    Defaults to $::os_service_default
#
#  [*dns_servers*]
#    (Optional) List of dns servers which should be used for subnet creation
#    Defaults to $::os_service_default
#
#  [*tenant_network_cidr*]
#    Defaults to $::os_service_default
#
#  [*tenant_network_v6_mask_bits*]
#    (Optional) The mask bits for tenant ipv6 subnets
#    Defaults to $::os_service_default
#
#  [*catalog_type*]
#    (Optional) Catalog type of the Neutron service.
#    Defaults to $::os_service_default
#
#  [*build_interval*]
#    (Optional) Time in seconds between build status checks. Time in seconds
#    between image operation status checks. Time in seconds between network
#    operation status checks. Time in seconds between build status checks. Time
#    in seconds between volume availability checks.
#    Defaults to $::os_service_default
#
#  [*port_vnic_type*]
#    (Optional) vnic_type to use when Launching instances with pre-configured
#    ports. Supported ports are: ['normal','direct','macvtap'] Allowed values:
#    <None>, normal, direct, macvtap
#    Defaults to $::os_service_default
#
#  [*tenant_network_v6_cidr*]
#    Defaults to $::os_service_default
#
#  [*tenant_networks_reachable*]
#    (Optional) Whether tenant networks can be reached directly from the test
#    client. This must be set to True when the 'fixed' ssh_connect_method is
#    selected.
#    Defaults to $::os_service_default
#
#  [*tenant_network_mask_bits*]
#    (Optional) The mask bits for tenant ipv4 subnets
#    Defaults to $::os_service_default
#
#  [*floating_network_name*]
#    (Optional) Default floating network name. Used to allocate floating IPs
#    when neutron is enabled.
#    Defaults to $::os_service_default
#
#  [*endpoint_type*]
#    (Optional) The endpoint type to use for the networking service. Allowed
#    values: public, admin, internal, publicURL, adminURL, internalURL
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
#  [*default_network*]
#    Defaults to $::os_service_default
#
#  [*ipv6_subnet_attributes*]
#    (Optional) Allow the execution of IPv6 subnet tests that use the extended
#    IPv6 attributes ipv6_ra_mode and ipv6_address_mode
#    Defaults to $::os_service_default
#
#  [*port_admin_state_change*]
#    (Optional) Does the test environment support changing port admin state
#    Defaults to $::os_service_default
#
#  [*ipv6*]
#    (Optional) Allow the execution of IPv6 tests
#    Defaults to $::os_service_default
#
#  [*api_extensions*]
#    (Optional) A list of enabled network extensions with a special entry all
#    which indicates every extension is enabled.
#    Defaults to $::os_service_default
#
class tempest::settings::network (
  $service_available           = $::os_service_default,
  $dns_servers                 = $::os_service_default,
  $tenant_network_cidr         = $::os_service_default,
  $tenant_network_v6_mask_bits = $::os_service_default,
  $catalog_type                = $::os_service_default,
  $build_interval              = $::os_service_default,
  $port_vnic_type              = $::os_service_default,
  $tenant_network_v6_cidr      = $::os_service_default,
  $tenant_networks_reachable   = $::os_service_default,
  $tenant_network_mask_bits    = $::os_service_default,
  $floating_network_name       = $::os_service_default,
  $endpoint_type               = $::os_service_default,
  $build_timeout               = $::os_service_default,
  $default_network             = $::os_service_default,
  $ipv6_subnet_attributes      = $::os_service_default,
  $port_admin_state_change     = $::os_service_default,
  $ipv6                        = $::os_service_default,
  $api_extensions              = $::os_service_default,
) {

  tempest_config {
    'service_available/neutron':                       value => $service_available;
    'network/dns_servers':                             value => $dns_servers;
    'network/tenant_network_cidr':                     value => $tenant_network_cidr;
    'network/tenant_network_v6_mask_bits':             value => $tenant_network_v6_mask_bits;
    'network/catalog_type':                            value => $catalog_type;
    'network/build_interval':                          value => $build_interval;
    'network/port_vnic_type':                          value => $port_vnic_type;
    'network/tenant_network_v6_cidr':                  value => $tenant_network_v6_cidr;
    'network/tenant_networks_reachable':               value => $tenant_networks_reachable;
    'network/tenant_network_mask_bits':                value => $tenant_network_mask_bits;
    'network/floating_network_name':                   value => $floating_network_name;
    'network/endpoint_type':                           value => $endpoint_type;
    'network/build_timeout':                           value => $build_timeout;
    'network/default_network':                         value => $default_network;
    'network-feature-enabled/ipv6_subnet_attributes':  value => $ipv6_subnet_attributes;
    'network-feature-enabled/port_admin_state_change': value => $port_admin_state_change;
    'network-feature-enabled/ipv6':                    value => $ipv6;
    'network-feature-enabled/api_extensions':          value => $api_extensions;
  }

}
