module "virtual_machines" {
  source   = "../../modules/vm"
  for_each = local.vms

  name = each.key

  cores       = each.value.cores
  datastore   = local.datastores.vm_disks
  disk_size   = each.value.disk_size
  gateway     = local.network_gateway
  image       = local.images.ubuntu_26_vm
  ip          = each.value.ip
  memory      = each.value.memory
  node        = local.node
  snippets_ds = local.datastores.snippets
  ssh_keys    = [trimspace(data.local_file.public_key.content)]
  username    = local.username
}

module "containers" {
  source = "../../modules/lxc"

  name    = "pihole-dns"
  image   = local.images.ubuntu_26_container
  node    = local.node
  os_type = "ubuntu"

  ip      = "192.168.1.201/24"
  gateway = local.network_gateway


  ssh_keys = [trimspace(data.local_file.public_key.content)]
  password = var.ssh_password

  datastore = local.datastores.vm_disks
  cores     = 1
  disk_size = 4
  memory    = 512
}