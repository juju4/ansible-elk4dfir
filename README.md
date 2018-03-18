[![Build Status - Master](https://travis-ci.org/juju4/ansible-elk4dfir.svg?branch=master)](https://travis-ci.org/juju4/ansible-elk4dfir)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-elk4dfir.svg?branch=devel)](https://travis-ci.org/juju4/ansible-elk4dfir/branches)
# ELK for DFIR ansible role

Ansible role to setup ELK (v5.x) in Data Forensics Incident Response mode.
Preloaded multiple configurations with sometimes adaptations or not:
* https://github.com/harrytruman/logstash-vmware.git
* https://github.com/cvandeplas/ELK-forensics.git
* https://github.com/sysforensics/LogstashConfigs.git
* https://github.com/philhagen/sof-elk.git

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.2

### Operating systems

Ubuntu 16.04.
ELK v5 requires Java 8 minimum which is only available on xenial.

## Example Playbook

Just include this role in your list.
For example

```
- hosts: all
  roles:
    - juju4.elk4dfir
```

## Variables

Nothing specific for now.

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/juju4.elk4dfir
$ sudo sysctl -w vm.max_map_count=262144
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.elk4dfir/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues

* Remember to give logstash user read permissions when copying files to archives directory.
* To check elasticsearch contents
```
$ curl http://localhost:9200/_aliases?pretty=1
$ curl http://localhost:9200/_cat/indices?pretty=1
$ curl http://localhost:9200/_stats/indexing?pretty=1

```

## License

BSD 2-clause

