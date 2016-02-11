# == Class: tempest
#
#  Tempest testing tool
#
# === Parameters
#
# (none)
#
class tempest {

  include ::tempest::install
  include ::tempest::params
  include ::tempest::settings

}
