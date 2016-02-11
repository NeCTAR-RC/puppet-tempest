# Class for configuring Tempest stress settings
#
#  [*log_check_interval*]
#    (Optional) time (in seconds) between log file error checks.
#    Defaults to $::os_service_default
#
#  [*nova_logdir*]
#    (Optional) Directory containing log files on the compute nodes
#    Defaults to $::os_service_default
#
#  [*leave_dirty_stack*]
#    (Optional) Prevent the cleaning (tearDownClass()) between each stress test
#    run if an exception occurs during this run.
#    Defaults to $::os_service_default
#
#  [*target_ssh_user*]
#    (Optional) ssh user.
#    Defaults to $::os_service_default
#
#  [*max_instances*]
#    (Optional) Maximum number of instances to create during test.
#    Defaults to $::os_service_default
#
#  [*target_private_key_path*]
#    (Optional) Path to private key.
#    Defaults to $::os_service_default
#
#  [*controller*]
#    (Optional) Controller host. Controller host. #target_controller = <None>
#    Defaults to $::os_service_default
#
#  [*default_thread_number_per_action*]
#    (Optional) The number of threads created while stress test.
#    Defaults to $::os_service_default
#
#  [*target_logfiles*]
#    (Optional) regexp for list of log files.
#    Defaults to $::os_service_default
#
#  [*full_clean_stack*]
#    (Optional) Allows a full cleaning process after a stress test. Caution :
#    this cleanup will remove every objects of every tenant.
#    Defaults to $::os_service_default
#
#  [*target_controller*]
#    (Optional) Controller host.
#    Defaults to $::os_service_default
#
class tempest::settings::stress (
  $log_check_interval               = $::os_service_default,
  $nova_logdir                      = $::os_service_default,
  $leave_dirty_stack                = $::os_service_default,
  $target_ssh_user                  = $::os_service_default,
  $max_instances                    = $::os_service_default,
  $target_private_key_path          = $::os_service_default,
  $controller                       = $::os_service_default,
  $default_thread_number_per_action = $::os_service_default,
  $target_logfiles                  = $::os_service_default,
  $full_clean_stack                 = $::os_service_default,
  $target_controller                = $::os_service_default,
) {

  tempest_config {
    'stress/log_check_interval':               value => $log_check_interval;
    'stress/nova_logdir':                      value => $nova_logdir;
    'stress/leave_dirty_stack':                value => $leave_dirty_stack;
    'stress/target_ssh_user':                  value => $target_ssh_user;
    'stress/max_instances':                    value => $max_instances;
    'stress/target_private_key_path':          value => $target_private_key_path;
    'stress/controller':                       value => $controller;
    'stress/default_thread_number_per_action': value => $default_thread_number_per_action;
    'stress/target_logfiles':                  value => $target_logfiles;
    'stress/full_clean_stack':                 value => $full_clean_stack;
    'stress/target_controller':                value => $target_controller;
  }

}
