# Class for configuring Tempest orchestration settings
#
#  [*service_available*]
#    (Optional) Whether or not Heat is expected to be available
#    Defaults to $::os_service_default
#
#  [*endpoint_type*]
#    (Optional) The endpoint type to use for the Orchestration service. Allowed
#    values: public, admin, internal, publicURL, adminURL, internalURL
#    Defaults to $::os_service_default
#
#  [*keypair_name*]
#    (Optional) Name of existing keypair to launch servers with.
#    Defaults to $::os_service_default
#
#  [*build_interval*]
#    (Optional) Time in seconds between build status checks. Time in seconds
#    between image operation status checks. Time in seconds between network
#    operation status checks. Time in seconds between build status checks. Time
#    in seconds between volume availability checks.
#    Defaults to $::os_service_default
#
#  [*stack_owner_role*]
#    (Optional) Role required for users to be able to manage stacks
#    Defaults to $::os_service_default
#
#  [*max_resources_per_stack*]
#    (Optional) Value must match heat configuration of the same name.
#    Defaults to $::os_service_default
#
#  [*catalog_type*]
#    (Optional) Catalog type of the Orchestration service.
#    Defaults to $::os_service_default
#
#  [*instance_type*]
#    (Optional) Instance type for tests. Needs to be big enough for a full OS
#    plus the test workload
#    Defaults to $::os_service_default
#
#  [*build_timeout*]
#    (Optional) Timeout in seconds to wait for a stack to build.
#    Defaults to $::os_service_default
#
#  [*max_template_size*]
#    (Optional) Value must match heat configuration of the same name.
#    Defaults to $::os_service_default
#
class tempest::settings::orchestration (
  $service_available         = $::os_service_default,
  $endpoint_type             = $::os_service_default,
  $keypair_name              = $::os_service_default,
  $build_interval            = $::os_service_default,
  $stack_owner_role          = $::os_service_default,
  $max_resources_per_stack   = $::os_service_default,
  $catalog_type              = $::os_service_default,
  $instance_type             = $::os_service_default,
  $build_timeout             = $::os_service_default,
  $max_template_size         = $::os_service_default,
) {

  tempest_config {
    'service_available/heat':                 value => $service_available;
    'orchestration/endpoint_type':            value => $endpoint_type;
    'orchestration/keypair_name':             value => $keypair_name;
    'orchestration/build_interval':           value => $build_interval;
    'orchestration/stack_owner_role':         value => $stack_owner_role;
    'orchestration/max_resources_per_stack':  value => $max_resources_per_stack;
    'orchestration/catalog_type':             value => $catalog_type;
    'orchestration/instance_type':            value => $instance_type;
    'orchestration/build_timeout':            value => $build_timeout;
    'orchestration/max_template_size':        value => $max_template_size;
  }

}
