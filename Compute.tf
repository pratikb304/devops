resource "google_compute_instance" "server1" {
    name = "server1"
    machine_type = "e2-medium"
    zone = var.zone

    tags = ["windows-server"]

    boot_disk {
        initialize_params {
            image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20240307b"
            size = 20
 } 
} 

    network_interface {
        network = "devops-vpc"
        access_config {}
}
}


resource "google_compute_instance" "vmloop" {
    for_each = {
      "vm1" = { vm_size= "e2-medium"}
      "vm2" = { vm_size= "f1-micro"} 
    }
  
  name = each.key
  machine_type = each.value.vm_size
  zone = var.zone
  allow_stopping_for_update = true

    boot_disk {
     initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20240307b"
      size = 20
  }
    }

    network_interface {
      network = "devops-vpc"
}

}
