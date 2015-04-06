# puppet_config
Using puppet to distribute user Linux/OSX configs. 

Sets up:
~/.bashrc
~/.bash_profile
~/.vimrc
Vim plugins

I get this going by:
```
cd ~
git clone https://github.com/guru-beach/puppet_config.git .puppet
puppet apply .puppet/manifests/site.pp
```
