# Class for configuring Tempest settings
#
#  [*service_available*]
#    (Optional) Whether or not Trove is expected to be available
#    Defaults to $::os_service_default
#
#  [*catalog_type*]
#    (Optional) Catalog type of the Database service.
#    Defaults to $::os_service_default
#
#  [*db_current_version*]
#    (Optional) Current database version to use in database tests.
#    Defaults to $::os_service_default
#
#  [*db_flavor_ref*]
#    (Optional) Valid primary flavor to use in database tests.
#    Defaults to $::os_service_default
#

class tempest::settings::database (
  $service_available  = $::os_service_default,
  $catalog_type       = $::os_service_default,
  $db_current_version = $::os_service_default,
  $db_flavor_ref      = $::os_service_default,
) {

  tempest_config {
    'service_available/trove':      value => $service_available;
    'database/catalog_type':        value => $catalog_type;
    'database/db_current_version':  value => $db_current_version;
    'database/db_flavor_ref':       value => $db_flavor_ref;
  }

}
