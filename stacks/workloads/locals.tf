data "local_file" "public_key" {
  filename = "../../files/id_rsa.pub"
}

data "terraform_remote_state" "images" {
  backend = "local"
  config = {
    path = "../images/terraform.tfstate"
  }
}

locals {
  node     = "pve01"
  username = "torres"

  datastores = {
    vm_disks = "data"
    images   = "local"
    snippets = "data"
  }

  network_gateway = "192.168.1.1"

  images = {
    ubuntu_26_container = data.terraform_remote_state.images.outputs.lxc_template_id
    ubuntu_26_vm        = data.terraform_remote_state.images.outputs.ubuntu_cloud_image_id
  }

  vms = {
    vmk8smaster01 = {
      ip        = "192.168.1.211/24"
      cores     = 2
      memory    = 3072 # 3GiB
      disk_size = 40
    }

    vmk8sworker01 = {
      ip        = "192.168.1.221/24"
      cores     = 2
      memory    = 4096 # 4GiB
      disk_size = 40
    }

    vmk8sworker02 = {
      ip        = "192.168.1.222/24"
      cores     = 2
      memory    = 4096 # 4GiB
      disk_size = 40
    }
  }

  containers = {
    "pihole-dns" = {
      ip        = "192.168.1.201/24"
      cores     = 1
      memory    = 512
      disk_size = 4
    }
  }
}