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
#  [*git_clone*]
#    (Optional) Should tempest be installed by a git repository
#    Defaults to true
#
#  [*tempest_repo_uri*]
#    (Optional) Git repository URI to clone from
#    Defaults to 'git://github.com/openstack/tempest.git'
#
#  [*tempest_repo_branch*]
#    (Optional) Git branch of the code to check out
#    Defaults to undef
#
#  [*tempest_clone_path*]
#    (Optional) Filesystem path to clone the repository to
#    Defaults to '/usr/local/src'
#
#  [*tempest_clone_owner*]
#    (Optional) User to clone the source repository from
#    Defaults to 'root'
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
  $git_clone               = true,
  $tempest_repo_uri        = 'git://github.com/openstack/tempest.git',
  $tempest_repo_branch     = undef,
  $tempest_clone_path      = '/usr/local/src',
  $tempest_clone_owner     = 'root',
  $tempest_config_file     = undef,
  $setup_venv              = true,
  $venv_path               = '/opt/tempest',
) {

  include ::tempest::params

  if $install_from_source {
    ensure_packages([
      'git',
      'python-setuptools',
      'python-virtualenv',
    ])
    ensure_packages($tempest::params::dev_packages)

    file { '/etc/tempest':
      ensure => directory,
    }

    if $git_clone {
      # Tempest
      vcsrepo { "${tempest_clone_path}/tempest":
        ensure   => 'present',
        source   => $tempest_repo_uri,
        branch   => $tempest_repo_branch,
        provider => 'git',
        require  => Package['git'],
        user     => $tempest_clone_owner,
      }

      Vcsrepo<||> -> Tempest_config<||>
    }

    if $setup_venv {

      exec { 'setup-venv':
        command => "virtualenv ${venv_path}",
        path    => '/usr/bin',
        creates => "${venv_path}/bin/activate",
      }

      # Install tempest to venv
      exec { 'pip-install-tempest':
        command => "${venv_path}/bin/pip install -e .",
        cwd     => "${tempest_clone_path}/tempest",
        unless  => "${venv_path}/bin/pip list | grep -E '^tempest ' ",
        timeout => 3600,
        require => [
            Exec['setup-venv'],
            Vcsrepo["${tempest_clone_path}/tempest"],
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

      # Copy config
      exec { 'copy-config':
        command => "/bin/cp -r ${tempest_clone_path}/tempest/etc/* ${venv_path}/etc/tempest",
        creates => "${venv_path}/etc/tempest/config-generator.tempest.conf",
        require => [
          File["${venv_path}/etc/tempest"],
          Exec['pip-install-tempest'],
        ]
      }

      # Generate config
      exec { 'generate-config':
        command => "${venv_path}/bin/oslo-config-generator --config-file ${tempest_clone_path}/tempest/etc/config-generator.tempest.conf --output-file /etc/tempest/tempest.conf",
        creates => '/etc/tempest/tempest.conf',
        require => [
          Vcsrepo["${tempest_clone_path}/tempest"],
          Exec['pip-install-tempest'],
          File['/etc/tempest'],
        ]
      } -> Tempest_config<||>

      if $git_clone {
        Vcsrepo<||> -> Exec['setup-venv']
      }

    }
  }
}
