# Class for configuring Tempest Identity settings
#
#  [*catalog_type*]
#    (Optional) Catalog type of the Identity service.
#    Defaults to $::os_service_default
#
#  [*disable_ssl_certificate_validation*]
#    (Optional) Set to True if using self-signed SSL certificates.
#    Defaults to $::os_service_default
#
#  [*ca_certificates_file*]
#    (Optional) Specify a CA bundle file to use in verifying a TLS (https)
#    server certificate.
#    Defaults to $::os_service_default
#
#  [*uri*]
#    (Optional) Full URI of the OpenStack Identity API (Keystone), v2
#    Defaults to $::os_service_default
#
#  [*uri_v3*]
#    (Optional) Full URI of the OpenStack Identity API (Keystone), v3
#    Defaults to $::os_service_default
#
#  [*auth_version*]
#    (Optional) Identity API version to be used for authentication for API tests.
#    Defaults to $::os_service_default
#
#  [*region*]
#    (Optional) The identity region name to use. Also used as the other
#    services' region name unless they are set explicitly. If no such region is
#    found in the service catalog, the first found one is used.
#    Defaults to $::os_service_default
#
#  [*v2_admin_endpoint_type*]
#    (Optional) The admin endpoint type to use for OpenStack Identity (Keystone)
#    API v2 Allowed values: public, admin, internal, publicURL, adminURL,
#    internalURL
#    Defaults to $::os_service_default
#
#  [*v2_public_endpoint_type*]
#    (Optional) The public endpoint type to use for OpenStack Identity
#    (Keystone) API v2 Allowed values: public, admin, internal, publicURL,
#    adminURL, internalURL
#    Defaults to $::os_service_default
#
#  [*v3_endpoint_type*]
#    (Optional) The endpoint type to use for OpenStack Identity (Keystone) API
#    v3 Allowed values: public, admin, internal, publicURL, adminURL, internalURL
#    Defaults to $::os_service_default
#
#  [*admin_role*]
#    (Optional) Role required to administrate keystone.
#    Defaults to $::os_service_default
#
#  [*default_domain_id*]
#    (Optional) ID of the default domain
#    Defaults to $::os_service_default
#
#  [*trust*]
#    (Optional) Does the identity service have delegation and impersonation
#    enabled
#    Defaults to $::os_service_default
#
#  [*api_v2*]
#    (Optional) Is the v2 identity API enabled Is the v2 image API enabled Is
#    the v2 volume API enabled
#    Defaults to $::os_service_default
#
#  [*api_v3*]
#    (Optional) Is the v3 identity API enabled
#    Defaults to $::os_service_default
#
#  [*api_extensions*]
#    (Optional) A list of enabled identity extensions with a special entry all
#    which indicates every extension is enabled.
#    Defaults to $::os_service_default
#
class tempest::settings::identity (
  $catalog_type                       = $::os_service_default,
  $disable_ssl_certificate_validation = $::os_service_default,
  $ca_certificates_file               = $::os_service_default,
  $uri                                = $::os_service_default,
  $uri_v3                             = $::os_service_default,
  $auth_version                       = $::os_service_default,
  $region                             = $::os_service_default,
  $v2_admin_endpoint_type             = $::os_service_default,
  $v2_public_endpoint_type            = $::os_service_default,
  $v3_endpoint_type                   = $::os_service_default,
  $admin_role                         = $::os_service_default,
  $default_domain_id                  = $::os_service_default,
  $trust                              = $::os_service_default,
  $api_v2                             = $::os_service_default,
  $api_v3                             = $::os_service_default,
  $api_extensions                     = $::os_service_default,
) {

  tempest_config {
    'identity/region':                             value => $region;
    'identity/uri':                                value => $uri;
    'identity/default_domain_id':                  value => $default_domain_id;
    'identity/disable_ssl_certificate_validation': value => $disable_ssl_certificate_validation;
    'identity/catalog_type':                       value => $catalog_type;
    'identity/v3_endpoint_type':                   value => $v3_endpoint_type;
    'identity/v2_public_endpoint_type':            value => $v2_public_endpoint_type;
    'identity/admin_role':                         value => $admin_role;
    'identity/auth_version':                       value => $auth_version;
    'identity/uri_v3':                             value => $uri_v3;
    'identity/ca_certificates_file':               value => $ca_certificates_file;
    'identity/v2_admin_endpoint_type':             value => $v2_admin_endpoint_type;
    'identity-feature-enabled/trust':              value => $trust;
    'identity-feature-enabled/api_v2':             value => $api_v2;
    'identity-feature-enabled/api_v3':             value => $api_v3;
    'identity-feature-enabled/api_extensions':     value => $api_extensions;
  }

}
