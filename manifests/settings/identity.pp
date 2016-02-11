# Class for configuring Tempest Identity settings
#
#  [*identity_region*]
#    (Optional) The identity region name to use. Also used as the other
#    services' region name unless they are set explicitly. If no such region is
#    found in the service catalog, the first found one is used.
#    Defaults to $::os_service_default
#
#  [*identity_uri*]
#    (Optional) Full URI of the OpenStack Identity API (Keystone), v2
#    Defaults to $::os_service_default
#
#  [*identity_default_domain_id*]
#    (Optional) ID of the default domain
#    Defaults to $::os_service_default
#
#  [*identity_disable_ssl_certificate_validation*]
#    (Optional) Set to True if using self-signed SSL certificates.
#    Defaults to $::os_service_default
#
#  [*identity_catalog_type*]
#    (Optional) Catalog type of the Identity service.
#    Defaults to $::os_service_default
#
#  [*identity_v3_endpoint_type*]
#    (Optional) The endpoint type to use for OpenStack Identity (Keystone) API
#    v3 Allowed values: public, admin, internal, publicURL, adminURL, internalURL
#    Defaults to $::os_service_default
#
#  [*identity_v2_public_endpoint_type*]
#    (Optional) The public endpoint type to use for OpenStack Identity
#    (Keystone) API v2 Allowed values: public, admin, internal, publicURL,
#    adminURL, internalURL
#    Defaults to $::os_service_default
#
#  [*identity_admin_role*]
#    (Optional) Role required to administrate keystone.
#    Defaults to $::os_service_default
#
#  [*identity_auth_version*]
#    (Optional) Identity API version to be used for authentication for API tests.
#    Defaults to $::os_service_default
#
#  [*identity_uri_v3*]
#    (Optional) Full URI of the OpenStack Identity API (Keystone), v3
#    Defaults to $::os_service_default
#
#  [*identity_ca_certificates_file*]
#    (Optional) Specify a CA bundle file to use in verifying a TLS (https)
#    server certificate.
#    Defaults to $::os_service_default
#
#  [*identity_v2_admin_endpoint_type*]
#    (Optional) The admin endpoint type to use for OpenStack Identity (Keystone)
#    API v2 Allowed values: public, admin, internal, publicURL, adminURL,
#    internalURL
#    Defaults to $::os_service_default
#
#  [*identity_api_v3*]
#    (Optional) Is the v3 identity API enabled
#    Defaults to $::os_service_default
#
#  [*identity_api_extensions*]
#    (Optional) A list of enabled identity extensions with a special entry all
#    which indicates every extension is enabled.
#    Defaults to $::os_service_default
#
#  [*identity_trust*]
#    (Optional) Does the identity service have delegation and impersonation
#    enabled
#    Defaults to $::os_service_default
#
#  [*identity_username*]
#    (Optional) Username for an administrative user.
#    Defaults to $::os_service_default
#
#  [*identity_password*]
#    (Optional) Password to use for an administrative user.
#    Defaults to $::os_service_default
#
#  [*identity_tenant_name*]
#    (Optional) Tenant name to use for an administrative user.
#    Defaults to $::os_service_default
#
#  [*identity_domain_name*]
#    (Optional) Admin domain name for authentication (Keystone V3).
#    Defaults to $::os_service_default
#
#  [*identity_alt_username*]
#    (Optional) Username of alternate user to use for Nova API requests.
#    Defaults to $::os_service_default
#
#  [*identity_alt_password*]
#    (Optional) API key to use when authenticating as alternate user. Its value
#    may be silently ignored in the future.
#    Defaults to $::os_service_default
#
#  [*identity_alt_tenant_name*]
#    (Optional) Alternate user's Tenant name to use for Nova API requests.
#    Defaults to $::os_service_default
#
#  [*identity_alt_domain_name*]
#    (Optional) Alternate domain name for authentication (Keystone V3).
#    Defaults to $::os_service_default
#
#  [*identity_api_v2*]
#    (Optional) Is the v2 identity API enabled Is the v2 image API enabled Is
#    the v2 volume API enabled
#    Defaults to $::os_service_default
#
class tempest::settings::identity (
  $identity_region                             = $::os_service_default,
  $identity_uri                                = $::os_service_default,
  $identity_default_domain_id                  = $::os_service_default,
  $identity_disable_ssl_certificate_validation = $::os_service_default,
  $identity_catalog_type                       = $::os_service_default,
  $identity_v3_endpoint_type                   = $::os_service_default,
  $identity_v2_public_endpoint_type            = $::os_service_default,
  $identity_admin_role                         = $::os_service_default,
  $identity_auth_version                       = $::os_service_default,
  $identity_uri_v3                             = $::os_service_default,
  $identity_ca_certificates_file               = $::os_service_default,
  $identity_v2_admin_endpoint_type             = $::os_service_default,
  $identity_username                           = $::os_service_default,
  $identity_password                           = $::os_service_default,
  $identity_tenant_name                        = $::os_service_default,
  $identity_domain_name                        = $::os_service_default,
  $identity_alt_username                       = $::os_service_default,
  $identity_alt_password                       = $::os_service_default,
  $identity_alt_tenant_name                    = $::os_service_default,
  $identity_alt_domain_name                    = $::os_service_default,
  $identity_api_v3                             = $::os_service_default,
  $identity_api_extensions                     = $::os_service_default,
  $identity_trust                              = $::os_service_default,
  $identity_api_v2                             = $::os_service_default,
) {

  tempest_config {
    'identity/region':                             value => $identity_region;
    'identity/uri':                                value => $identity_uri;
    'identity/default_domain_id':                  value => $identity_default_domain_id;
    'identity/disable_ssl_certificate_validation': value => $identity_disable_ssl_certificate_validation;
    'identity/catalog_type':                       value => $identity_catalog_type;
    'identity/v3_endpoint_type':                   value => $identity_v3_endpoint_type;
    'identity/v2_public_endpoint_type':            value => $identity_v2_public_endpoint_type;
    'identity/admin_role':                         value => $identity_admin_role;
    'identity/auth_version':                       value => $identity_auth_version;
    'identity/uri_v3':                             value => $identity_uri_v3;
    'identity/ca_certificates_file':               value => $identity_ca_certificates_file;
    'identity/v2_admin_endpoint_type':             value => $identity_v2_admin_endpoint_type;
    'identity-feature-enabled/api_v3':             value => $identity_api_v3;
    'identity-feature-enabled/api_extensions':     value => $identity_api_extensions;
    'identity-feature-enabled/trust':              value => $identity_trust;
    'identity-feature-enabled/api_v2':             value => $identity_api_v2;
    'identity/username':                           value => $identity_username;
    'identity/password':                           value => $identity_password;
    'identity/tenant_name':                        value => $identity_tenant_name;
    'identity/domain_name':                        value => $identity_domain_name;
    'identity/alt_username':                       value => $identity_alt_username;
    'identity/alt_password':                       value => $identity_alt_password;
    'identity/alt_tenant_name':                    value => $identity_alt_tenant_name;
    'identity/alt_domain_name':                    value => $identity_alt_domain_name;
  }

}
