# This class installs personal configsuration files 

class configs ( $local_repo = undef ) {

  file { "${env_home}/.vimrc" :
    ensure  => present,
    recurse => true,
    mode    => 0644,
    source  => "puppet:///modules/configs/vimrc/",
    owner   => "${env_user}",
  }

 
  # Entire directory structure to use VIM plugin style 
  # Settings
  file { "${env_home}/.vim" :
    ensure  => directory,
    recurse => true,
    mode    => 0644,
    source  => "puppet:///modules/configs/vim/",
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
    source  => "puppet:///modules/configs/bash_profile",
    owner   => "${env_user}",
    mode    => 0644,
  }

  file {"${env_home}/.bashrc" :
    ensure  => present,
    source  => "puppet:///modules/configs/bashrc",
    owner   => "${env_user}",
    mode    => 0644,
  }

  file {"${env_home}/.gitignore_global" :
    ensure  => present,
    source  => "puppet:///modules/configs/gitignore_global",
    owner   => "${env_user}",
    mode    => 0644,
  }

}
