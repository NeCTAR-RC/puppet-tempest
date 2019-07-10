# == Class: tempest::settings
#
#  Tempest configuration settings
#
# === Parameters
#
#  [*tempest_config_file*]
#    (Optional) Path to the tempest config file
#    Defaults to '/etc/tempest/tempest.conf'
#
#  [*test_accounts*]
#    (Optional) Create test accounts configuration file.
#    The value is an array of user accounts, in yaml format. Example:
#    test_accounts:
#      - username: test1
#        password: pass1
#        tenant_name: tenant1
#      - username: test2
#        password: pass2
#        tenant_name: tenant2
#    Defaults to undef
#
#  [*resources_prefix*]
#    (Optional) Prefix to be added when generating the name for test resources.
#    It can be used to discover all resources associated with a specific test
#    run when running tempest on a real-life cloud
#    Defaults to $::os_service_default
#
#  [*test_accounts_file*]
#    (Optional) Path to the yaml file that contains the list of credentials to
#    use for running tests.
#    Defaults to $::os_service_default
#
#  [*use_dynamic_credentials*]
#    (Optional) Allows test cases to create/destroy tenants and users. This
#    option requires that OpenStack Identity API admin credentials are known.
#    If false, isolated test cases and parallel execution, can still be
#    achieved configuring a list of test accounts
#    Defaults to $::os_service_default
#
#  [*tempest_roles*]
#    (Optional) Roles to assign to all users created by tempest
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
#  [*admin_username*]
#    (Optional) Username for an administrative user. This is needed for
#    authenticating requests made by tenant isolation to create users and
#    projects
#    Defaults to $::os_service_default
#
#  [*admin_project_name*]
#    (Optional) Project name to use for an administrative user. This is needed
#    for authenticating requests made by project isolation to create users and
#    projects
#    Defaults to $::os_service_default
#
#  [*admin_password*]
#    (Optional) Password to use for an administrative user. This is needed for
#    authenticating requests made by tenant isolation to create users and
#    projects
#    Defaults to $::os_service_default
#
#  [*admin_domain_name*]
#    (Optional) Admin domain name for authentication (Keystone V3). The same
#    domain applies to user and project
#    Defaults to $::os_service_default
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
  $tempest_config_file                       = '/etc/tempest/tempest.conf',
  $test_accounts                             = undef,
  $resources_prefix                          = $::os_service_default,
  $test_accounts_file                        = $::os_service_default,
  $use_dynamic_credentials                   = $::os_service_default,
  $tempest_roles                             = $::os_service_default,
  $default_credentials_domain_name           = $::os_service_default,
  $create_isolated_networks                  = $::os_service_default,
  $admin_username                            = $::os_service_default,
  $admin_project_name                        = $::os_service_default,
  $admin_password                            = $::os_service_default,
  $admin_domain_name                         = $::os_service_default,
  $oslo_concurrency_lock_path                = $::os_service_default,
  $oslo_concurrency_disable_process_locking  = $::os_service_default,
) {

  Tempest_config { path => $tempest_config_file }

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

  if $test_accounts {
    if $test_accounts_file != $::os_service_default {
      $_test_accounts_file = $test_accounts_file
    }
    else {
      $_test_accounts_file = '/etc/tempest/accounts.yaml'
    }

    file { $_test_accounts_file:
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => inline_template("<%= @test_accounts.to_yaml %>"),
    }
  }
  else {
    $_test_accounts_file = $test_accounts_file
  }

  tempest_config {
    'DEFAULT/resources_prefix':                 value => $resources_prefix;
    'auth/test_accounts_file':                  value => $_test_accounts_file;
    'auth/use_dynamic_credentials':             value => $use_dynamic_credentials;
    'auth/default_credentials_domain_name':     value => $default_credentials_domain_name;
    'auth/create_isolated_networks':            value => $create_isolated_networks;
    'auth/admin_username':                      value => $admin_username;
    'auth/admin_project_name':                  value => $admin_project_name;
    'auth/admin_password':                      value => $admin_password, secret => true;
    'auth/admin_domain_name':                   value => $admin_domain_name;
    'oslo_concurrency/lock_path':               value => $oslo_concurrency_lock_path;
    'oslo_concurrency/disable_process_locking': value => $oslo_concurrency_disable_process_locking;
  }

  file { '/etc/tempest/logging.conf':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => "puppet:///modules/tempest/logging.conf",
  }


}
