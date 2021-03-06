packer {
  required_version = "~> 1.8.0"
}

source "qemu" "win2019" {
  qemu_binary           = "/usr/libexec/qemu-kvm"
  iso_url               = "http://iso-store/WindowsServer2019.iso"
  iso_checksum          = "md5:70fec2cb1d6759108820130c2b5496da"
  output_directory      = "/workspace/output/win2k19-base"
  disk_size             = "50G"
  format                = "qcow2"
  accelerator           = "kvm"
  vm_name               = "win2019-kvm.qcow2"
  net_device            = "e1000"
  disk_interface        = "ide"
  boot_wait             = "20s"
  headless              = "true"
  memory                = "2048"
  cpus                  = "2"
  floppy_files          = ["./answer_files/autounattend.xml"]
  communicator          = "winrm"
  winrm_username        = "builduser"
  winrm_password        = "r3dh4t1!"
  shutdown_command      = "shutdown /s /t 10 /f /d p:4:1 /c \"Packer Shutdown\""
  vnc_bind_address	= "0.0.0.0"
}

build {
  sources               = ["source.qemu.win2019"]
}
