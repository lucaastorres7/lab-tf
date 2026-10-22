output "ubuntu_cloud_image_id" {
  value = proxmox_download_file.ubuntu_cloud_image.id
}
output "lxc_template_id" {
  value = proxmox_download_file.lxc_image.id
}