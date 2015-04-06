# This class installs personal configuration files 

class configs ( $local_repo = undef ) {

  file { "${env_home}/.vimrc" :
    ensure  => present,
    recurse => true,
    mode    => 0644,
    source  => "puppet:///modules/config/vimrc/",
    owner   => "${env_user}",
  }

 
  # Entire directory structure to use VIM plugin style 
  # Settings
  file { "${env_home}/.vim" :
    ensure  => directory,
    recurse => true,
    mode    => 0644,
    source  => "puppet:///modules/config/vim/",
    owner   => "${env_user}",
  }

  # Extra environment variables, functions, aliases, etc
  # that are location specific.  Probably differs by company
  if $local_repo {
    vcsrepo { "${env_home}/local_config" :
      ensure   => latest,
      provider => git,
      owner    => "${env_user}",
      user     => "${env_user}",
      source   => "${local_repo}",
    }
  }

  file {"${env_home}/.bash_profile" :
    ensure  => present,
    source  => "puppet:///modules/config/bash_profile",
    owner   => "${env_user}",
    mode    => 0644,
  }

  file {"${env_home}/.bashrc" :
    ensure  => present,
    source  => "puppet:///modules/config/bashrc",
    owner   => "${env_user}",
    mode    => 0644,
  }

  file {"${env_home}/.gitignore_global" :
    ensure  => present,
    source  => "puppet:///modules/config/gitignore_global",
    owner   => "${env_user}",
    mode    => 0644,
  }

}
