variable "name" {
  description = "Name of the Container"
  type        = string
}

variable "node" {
  description = "Proxmox node to run the Container"
  type        = string
}

variable "password" {
  description = "Password to access the Container"
  type        = string
  sensitive   = true
}

variable "ssh_keys" {
  description = "SSH Keys to acess the Container"
  type        = list(string)
}

variable "ip" {
  description = "IP Address of the Container (ex: 192.168.1.1/24)"
  type        = string
}

variable "gateway" {
  description = "IP Address of the Network Gateway"
  type        = string
}

variable "datastore" {
  description = "Datastore of the Disk of the Container"
  type        = string
}

variable "image" {
  description = "Image of the operating system"
  type        = string
}

variable "os_type" {
  description = "Type of the operating system"
}

variable "cores" {
  description = "Core amount of the Container"
  type        = number
}

variable "memory" {
  description = "Amount of memory of the Container"
  type        = number
}

variable "disk_size" {
  description = "Amount of disk space of the Container"
}