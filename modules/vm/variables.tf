variable "name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "node" {
  description = "Proxmox node to run the virtual machine"
  type        = string
}

variable "username" {
  description = "User to access the virtual machine"
  type        = string
  default     = "proxmox-user"
}

variable "ssh_keys" {
  description = "SSH Keys to acess the virtual machine"
  type        = list(string)
}

variable "ip" {
  description = "IP Address of the virtual machine (ex: 192.168.1.1/24)"
  type        = string
}

variable "gateway" {
  description = "IP Address of the Network Gateway"
  type        = string
}

variable "datastore" {
  description = "Datastore of the Disk of the Virtual Machine"
  type        = string
}

variable "snippets_ds" {
  description = "Datastore of the user-data"
  type        = string
}

variable "image" {
  description = "Image of the operating system"
  type        = string
}

variable "cores" {
  description = "Core amount of the Virtual Machine"
  type        = number
}

variable "memory" {
  description = "Amount of memory of the Virtual Machine"
  type        = number
}

variable "disk_size" {
  description = "Amount of disk space of the Virtual Machine"
}