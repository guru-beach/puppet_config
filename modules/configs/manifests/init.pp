# This class installs personal configuration files 

class config {
  
  file {"${env_home}/.vim" :
    ensure  => directory,
    recurse => true,
    mode    => 0644,
    source  => "puppet:///modules/config/vim/",
    owner   => "${env_user}",
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
