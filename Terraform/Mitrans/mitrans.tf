resource "proxmox_lxc" "docker01_host" {
  cores           = 1
  hostname        = "docker01"
  memory          = 512
  nameserver      = "172.30.1.20 8.8.8.8"
  onboot          = true
  ostemplate      = "mitrans-cephfs:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  ssh_public_keys = var.ct_ssh_public_key
  searchdomain    = "mitrans.gob.cu"
  start           = true
  swap            = 512
  target_node     = "apolo"
  unprivileged    = true
  vmid            = 700
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    ip       = "172.30.0.21/24"
    gw       = "172.30.0.5"
    name     = "eth0"
  }
  rootfs {
    size    = "5G"
    storage = "mitrans-ceph"
  }
}
