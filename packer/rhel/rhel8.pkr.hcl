packer {
  required_version = "~> 1.8.0"
}

source "qemu" "rhel8" {
  qemu_binary           = "/usr/libexec/qemu-kvm"
  iso_url 		= "https://iso-store/rhel-8.6-x86_64-dvd.iso"
  iso_checksum 		= "sha256:c324f3b07283f9393168f0a4ad2167ebbf7e4699d65c9670e0d9e58ba4e2a9a8"
  output_directory 	= "/workspace/output/rhel-8.6-base"
  disk_size		= "10G"
  format		= "qcow2"
  accelerator		= "kvm"
  ssh_username		= "root"
  ssh_password		= "r3dh4t1!"
  ssh_timeout		= "20m"
  vm_name		= "rhel8.6-kvm.qcow2"
  net_device		= "virtio-net"
  disk_interface	= "virtio"
  boot_wait		= "20s"
  boot_command		= ["<tab> text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/rhel8-ks.cfg<enter><wait>"]
  http_directory	= "http_files"
  headless		= "true"
  memory		= "2048"
  insecure_connection	= "true"
}

build {
  sources		= ["source.qemu.rhel8"]
}
