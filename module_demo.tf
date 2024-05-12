module "vm_module" {
    source = "./modules"
    name = "test1"
    machine_type = "e2-medium"
    zone = "us-east1-c"
    image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20240307b"
    network = "devops-vpc"
  
}