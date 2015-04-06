# Hiera configs

For a basic system, having a hierarchy is probably overkill, but it's here to allow for users to easily configure their classes without having to modify site.pp.   

Since common.yaml is the only file actually defined in the hierarchy, create it and fill it with stuff.   

e.g.

```
---
# This probably won't do what you want...
configs::local_repo: 'https://github.com/guru-beach/puppet_config.git'
```
