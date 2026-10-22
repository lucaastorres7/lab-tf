resource "proxmox_virtual_environment_container" "lxc" {
  node_name    = var.node
  unprivileged = true

  features {
    nesting = true
  }

  initialization {
    hostname = var.name

    ip_config {
      ipv4 {
        address = var.ip
        gateway = var.gateway
      }
    }

    user_account {
      password = var.password
      keys     = var.ssh_keys
    }
  }

  network_interface {
    name   = "eth0"
    bridge = "vmbr0"
  }

  cpu {
    cores = var.cores
    limit = var.cores + 1
  }

  memory {
    dedicated = var.memory
  }

  disk {
    datastore_id = var.datastore
    size         = var.disk_size
  }

  operating_system {
    template_file_id = var.image
    type             = var.os_type
  }
}