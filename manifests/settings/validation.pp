# Class for configuring Tempest validation settings
#
#  [*ping_count*]
#    (Optional) The number of ping packets originating from remote linux hosts
#    Defaults to $::os_service_default
#
#  [*network_for_ssh*]
#    (Optional) Network used for SSH connections. Ignored if
#    use_floatingip_for_ssh=true or run_validation=false.
#    Defaults to $::os_service_default
#
#  [*ssh_shell_prologue*]
#    Defaults to $::os_service_default
#
#  [*ip_version_for_ssh*]
#    (Optional) Default IP version for ssh connections.
#    Defaults to $::os_service_default
#
#  [*image_ssh_password*]
#    (Optional) Password used to authenticate to an instance.
#    Defaults to $::os_service_default
#
#  [*connect_method*]
#    (Optional) Default IP type used for validation: -fixed: uses the first IP
#    belonging to the fixed network -floating: creates and uses a floating IP
#    Allowed values: fixed, floating
#    Defaults to $::os_service_default
#
#  [*run_validation*]
#    (Optional) Enable ssh on created servers and creation of additional
#    validation resources to enable remote access
#    Defaults to $::os_service_default
#
#  [*image_ssh_user*]
#    (Optional) User name used to authenticate to an instance.
#    Defaults to $::os_service_default
#
#  [*auth_method*]
#    (Optional) Default authentication method to the instance. Only ssh via
#    keypair is supported for now. Additional methods will be handled in a
#    separate spec. Allowed values: keypair
#    Defaults to $::os_service_default
#
#  [*security_group*]
#    (Optional) Enable/disable security groups.
#    Defaults to $::os_service_default
#
#  [*ping_timeout*]
#    (Optional) Timeout in seconds to wait for ping to succeed.
#    Defaults to $::os_service_default
#
#  [*ping_size*]
#    (Optional) The packet size for ping packets originating from remote linux
#    hosts
#    Defaults to $::os_service_default
#
#  [*ssh_timeout*]
#    (Optional) Timeout in seconds to wait for the ssh banner.
#    Defaults to $::os_service_default
#
#  [*floating_ip_range*]
#    Defaults to $::os_service_default
#
#  [*security_group_rules*]
#    (Optional) Enable/disable security group rules.
#    Defaults to $::os_service_default
#
#  [*connect_timeout*]
#    (Optional) Timeout in seconds to wait for the TCP connection to be
#    successful.
#    Defaults to $::os_service_default
#
class tempest::settings::validation (
  $ping_count           = $::os_service_default,
  $network_for_ssh      = $::os_service_default,
  $ssh_shell_prologue   = $::os_service_default,
  $ip_version_for_ssh   = $::os_service_default,
  $image_ssh_password   = $::os_service_default,
  $connect_method       = $::os_service_default,
  $run_validation       = $::os_service_default,
  $image_ssh_user       = $::os_service_default,
  $auth_method          = $::os_service_default,
  $security_group       = $::os_service_default,
  $ping_timeout         = $::os_service_default,
  $ping_size            = $::os_service_default,
  $ssh_timeout          = $::os_service_default,
  $floating_ip_range    = $::os_service_default,
  $security_group_rules = $::os_service_default,
  $connect_timeout      = $::os_service_default,
) {

  tempest_config {
    'validation/ping_count':           value => $ping_count;
    'validation/network_for_ssh':      value => $network_for_ssh;
    'validation/ssh_shell_prologue':   value => $ssh_shell_prologue;
    'validation/ip_version_for_ssh':   value => $ip_version_for_ssh;
    'validation/image_ssh_password':   value => $image_ssh_password;
    'validation/connect_method':       value => $connect_method;
    'validation/run_validation':       value => $run_validation;
    'validation/image_ssh_user':       value => $image_ssh_user;
    'validation/auth_method':          value => $auth_method;
    'validation/security_group':       value => $security_group;
    'validation/ping_timeout':         value => $ping_timeout;
    'validation/ping_size':            value => $ping_size;
    'validation/ssh_timeout':          value => $ssh_timeout;
    'validation/floating_ip_range':    value => $floating_ip_range;
    'validation/security_group_rules': value => $security_group_rules;
    'validation/connect_timeout':      value => $connect_timeout;
  }

}
