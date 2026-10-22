terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~>0.117.0"
    }
  }
}

provider "proxmox" {
  endpoint  = var.endpoint
  api_token = var.api_token
  insecure  = true

  ssh {
    username = var.ssh_user
    password = var.ssh_password
  }
}