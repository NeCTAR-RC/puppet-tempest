# == Class: tempest::install
#
#  Tempest installation
#
# === Parameters
#
#  [*install_from_source*]
#    (Optional) Should tempest be installed from source
#    Defaults to true
#
#  [*tempest_repo_uri*]
#    (Optional) Git repository URI to clone from
#    Defaults to 'git://github.com/openstack/tempest.git'
#
#  [*tempest_config_file*]
#    (Optional) Path to the temptest config file
#    Default is undef
#
#  [*setup_venv*]
#    (Optional) Set up a virtualenv environment
#    Defaults to true
#
#  [*venv_path*]
#    (Optional) Directory to use for the virtualenv
#    Defaults to '/opt/tempest'
#
class tempest::install (
  $install_from_source     = true,
  $tempest_repo_uri        = 'https://github.com/openstack/tempest.git',
  $tempest_config_file     = undef,
  $setup_venv              = true,
  $venv_path               = '/opt/tempest',
) {

  include ::tempest::params

  if $install_from_source {
    $virtualenv_pkg = $::lsbdistcodename ? {
      'trusty' => 'python-virtualenv',
      default  => 'virtualenv',
    }
    ensure_packages([
      'git',
      'python-setuptools',
      $virtualenv_pkg,
    ])
    ensure_packages($tempest::params::dev_packages)

    file { '/etc/tempest':
      ensure => directory,
    }

    if $setup_venv {

      exec { 'setup-venv':
        command => "virtualenv ${venv_path}",
        path    => '/usr/bin',
        creates => "${venv_path}/bin/activate",
      }

      # Install tempest to venv
      exec { 'pip-install-tempest':
        command => "${venv_path}/bin/pip install git+${tempest_repo_uri}",
        unless  => "${venv_path}/bin/pip list | grep -E '^tempest ' ",
        timeout => 3600,
        require => [
            Exec['setup-venv'],
            Package[$tempest::params::dev_packages],
        ]
      }

      # Make tempest config dir
      file { ["${venv_path}/etc", "${venv_path}/etc/tempest"]:
        ensure  => directory,
        require => [
          Exec['setup-venv'],
          Exec['pip-install-tempest'],
        ],
      }

      # Generate config
      exec { 'generate-config':
        command => "${venv_path}/bin/oslo-config-generator --config-file ${venv_path}/etc/tempest/config-generator.tempest.conf --output-file /etc/tempest/tempest.conf",
        creates => '/etc/tempest/tempest.conf',
        require => [
          Exec['pip-install-tempest'],
          File['/etc/tempest'],
        ]
      } -> Tempest_config<||>
    }
  }
}
