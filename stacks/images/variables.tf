variable "endpoint" {
  description = "Endpoint of the Proxmox server"
  type        = string
}

variable "api_token" {
  description = "API Token to access the Proxmox server"
  type        = string
  sensitive   = true
}

variable "ssh_user" {
  description = "User used to SSH into the Proxmox server"
  type        = string
}

variable "ssh_password" {
  description = "Password used to SSH into the Proxmox server"
  type        = string
  sensitive   = true
}