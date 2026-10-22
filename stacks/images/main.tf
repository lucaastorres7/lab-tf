resource "proxmox_download_file" "ubuntu_cloud_image" {
  content_type   = "import"
  datastore_id   = "local"
  node_name      = "pve01"
  url            = "https://cloud-images.ubuntu.com/resolute/current/resolute-server-cloudimg-amd64.img"
  file_name      = "resolute-server-cloudimg-amd64.qcow2"
  upload_timeout = 1200 # 20min
}

resource "proxmox_download_file" "lxc_image" {
  content_type   = "vztmpl"
  datastore_id   = "local"
  node_name      = "pve01"
  url            = "http://download.proxmox.com/images/system/ubuntu-26.04-standard_26.04-1_amd64.tar.zst"
  upload_timeout = 1200 # 20min
}
