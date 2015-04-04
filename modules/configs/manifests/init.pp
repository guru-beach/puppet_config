# This class installs personal configuration files 

class config {
  
  file {"${env_home}/.vimrc" :
    ensure  => present,
    source  => "puppet:///modules/config/vimrc_${osfamily}",
    owner   => "${env_user}",
    mode    => 0644,
  }

  file {"${env_home}/.bash_profile" :
    ensure  => present,
    source  => "puppet:///modules/config/bash_profile_${osfamily}",
    owner   => "${env_user}",
    mode    => 0644,
  }

  file {"${env_home}/.bashrc" :
    ensure  => present,
    source  => "puppet:///modules/config/bashrc_${osfamily}",
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
