packer {
  required_version = "~> 1.8.0"
}

source "qemu" "rhel8" {
  iso_url 		= "/Users/vfarias/Downloads/rhel-8.5-x86_64-dvd.iso"
  iso_checksum 		= "md5:9c70f1acea48377b01da8066764805f9"
  output_directory 	= "output_dir"
  disk_size		= "10G"
  format		= "qcow2"
  accelerator		= "hvf"
  ssh_username		= "root"
  ssh_password		= "r3dh4t1!"
  ssh_timeout		= "20m"
  vm_name		= "rhel8.2-kvm.qcow2"
  net_device		= "virtio-net"
  disk_interface	= "virtio"
  boot_wait		= "20s"
  boot_command		= ["<tab> text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/rhel8-ks.cfg<enter><wait>"]
  http_directory	= "http_files"
  headless		= "true"
  memory		= "2048"
}

build {
  sources		= ["source.qemu.rhel8"]
}
