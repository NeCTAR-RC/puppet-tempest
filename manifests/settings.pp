# == Class: tempest::settings
#
#  Tempest configuration settings
#
# === Parameters
#
#  [*tempest_config_file*]
#    (Optional) Path to the tempest config file
#    Defaults to undef
#
#  [*resources_prefix*]
#    (Optional) Prefix to be added when generating the name for test resources.
#    It can be used to discover all resources associated with a specific test
#    run when running tempest on a real-life cloud
#    Defaults to $::os_service_default
#
#  [*admin_tenant_name*]
#    (Optional) Tenant name to use for an administrative user. This is needed
#    for authenticating requests made by tenant isolation to create users and
#    projects
#    Defaults to $::os_service_default
#
#  [*default_credentials_domain_name*]
#    (Optional) Default domain used when getting v3 credentials. This is the
#    name keystone uses for v2 compatibility.
#    Defaults to $::os_service_default
#
#  [*create_isolated_networks*]
#    (Optional) If use_dynamic_credentials is set to True and Neutron is enabled
#    Tempest will try to create a usable network, subnet, and router when needed
#    for each tenant it creates. However in some neutron configurations, like
#    with VLAN provider networks, this doesn't work. So if set to False the
#    isolated networks will not be created
#    Defaults to $::os_service_default
#
#  [*admin_password*]
#    (Optional) Password to use for an  administrative user. This is needed for
#    authenticating requests made by tenant isolation to create users and
#    projects
#    Defaults to $::os_service_default
#
#  [*admin_username*]
#    (Optional) Username for an administrative user. This is needed for
#    authenticating requests made by tenant isolation to create users and
#    projects
#    Defaults to $::os_service_default
#
#  [*admin_domain_name*]
#    (Optional) Admin domain name for authentication (Keystone V3).The same
#    domain applies to user and project
#    Defaults to $::os_service_default
#
#  [*use_dynamic_credentials*]
#    (Optional) Allows test cases to create/destroy tenants and users. This
#    option requires that OpenStack Identity API admin credentials are known. If
#    false, isolated test cases and parallel execution, can still be achieved
#    configuring a list of test accounts
#    Defaults to $::os_service_default
#
#  [*test_accounts_file*]
#    (Optional) Path to the yaml file that contains the list of credentials to
#    use for running tests.
#    Defaults to undef
#
#  [*oslo_concurrency_lock_path*]
#    (Optional) Directory to use for lock files.
#    Defaults to $::os_service_default
#
#  [*oslo_concurrency_disable_process_locking*]
#    (Optional) Enables or disables inter-process locks.
#    Defaults to $::os_service_default
#
class tempest::settings (
  $tempest_config_file                       = undef,
  $resources_prefix                          = $::os_service_default,
  $admin_tenant_name                         = $::os_service_default,
  $default_credentials_domain_name           = $::os_service_default,
  $create_isolated_networks                  = $::os_service_default,
  $admin_password                            = $::os_service_default,
  $admin_username                            = $::os_service_default,
  $admin_domain_name                         = $::os_service_default,
  $use_dynamic_credentials                   = $::os_service_default,
  $test_accounts_file                        = $::os_service_default,
  $oslo_concurrency_lock_path                = $::os_service_default,
  $oslo_concurrency_disable_process_locking  = $::os_service_default,
) {

  include ::tempest::settings::alarming
  include ::tempest::settings::baremetal
  include ::tempest::settings::compute
  include ::tempest::settings::dashboard
  include ::tempest::settings::database
  include ::tempest::settings::data_processing
  include ::tempest::settings::identity
  include ::tempest::settings::image
  include ::tempest::settings::messaging
  include ::tempest::settings::network
  include ::tempest::settings::object_storage
  include ::tempest::settings::orchestration
  include ::tempest::settings::scenario
  include ::tempest::settings::stress
  include ::tempest::settings::telemetry
  include ::tempest::settings::validation
  include ::tempest::settings::volume

  if $tempest_config_file {
    $_tempest_config_file = $tempest_config_file
  }
  elsif $::rally::install::install_from_source {
    $_tempest_config_file = "${::rally::install::tempest_clone_path}/etc/tempest.conf"
  }
  else {
    $_tempest_config_file = '/etc/tempest/tempest.conf'
  }

  Tempest_config { path => $_tempest_config_file }

  tempest_config {
    'DEFAULT/resources_prefix':                                   value => $resources_prefix;
    'auth/admin_domain_name':                                     value => $admin_domain_name;
    'auth/admin_password':                                        value => $admin_password;
    'auth/admin_username':                                        value => $admin_username;
    'auth/admin_tenant_name':                                     value => $admin_tenant_name;
    'auth/default_credentials_domain_name':                       value => $default_credentials_domain_name;
    'auth/create_isolated_networks':                              value => $create_isolated_networks;
    'auth/use_dynamic_credentials':                               value => $use_dynamic_credentials;
    'auth/test_accounts_file':                                    value => $test_accounts_file;
    'oslo_concurrency/lock_path':                                 value => $oslo_concurrency_lock_path;
    'oslo_concurrency/disable_process_locking':                   value => $oslo_concurrency_disable_process_locking;
  }

}
