# terraform-kdevops-add-host-ssh-config

This module lets you populate your ssh configuration file, typically
` ~/.ssh/config` automatically from the created hosts.

## Usage

Below is an example usage:

```
locals {
  limit_count = 4
  shorthosts = openstack_compute_instance_v2.fstests_instances.*.name
  ipv4s = openstack_compute_instance_v2.fstests_instances.*.access_ip_v4
}

module "ssh_config_update_host_entries" {
  source = "mcgrof/add-host-ssh-config/kdevops"

  ssh_config = var.ssh_config
  update_ssh_config_enable = local.limit_count > 0 ? "true" : ""
  cmd = "update"
  shorthosts = join(",", slice(local.shorthosts, 0, local.limit_count))
  hostnames = join(",", slice(local.ipv4s, 0, local.limit_count))
  ports = "22"
  user = var.ssh_config_user == "" ? "" : var.ssh_config_user
  id = replace(var.ssh_pubkey_file, ".pub", "")
  strict = var.ssh_config_use_strict_settings != "true" ? "" : "true"
  use_backup = var.ssh_config_backup != "true" || var.ssh_config == "/dev/null" ? "" : "true"
  backup_postfix = "kdevops"
}
```

The ports can also be a comma separted list.

### Author

[Luis Chamberlain](https://www.do-not-panic.com)

### License

This module is released under the GPLv2.
