module "virtual_machines" {
  source   = "../../modules/vm"
  for_each = local.vms

  name    = each.key
  ip      = each.value.ip
  gateway = local.network_gateway
  image   = local.images.ubuntu_26_vm
  node    = local.node

  username = local.username
  ssh_keys = [trimspace(data.local_file.public_key.content)]

  cores     = each.value.cores
  memory    = each.value.memory
  disk_size = each.value.disk_size

  datastore   = local.datastores.vm_disks
  snippets_ds = local.datastores.snippets
}

module "containers" {
  source   = "../../modules/lxc"
  for_each = local.containers

  name    = each.key
  ip      = each.value.ip
  gateway = local.network_gateway
  image   = local.images.ubuntu_26_container
  os_type = "ubuntu"
  node    = local.node

  ssh_keys = [trimspace(data.local_file.public_key.content)]
  password = var.ssh_password

  cores     = each.value.cores
  memory    = each.value.memory
  disk_size = each.value.disk_size

  datastore = local.datastores.vm_disks
}