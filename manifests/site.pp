node "default" {

  notify { 'FqdnTest': 
    withpath => true,
    name     => "my fqdn is $fqdn, homedir is $env_home",
  }
}
