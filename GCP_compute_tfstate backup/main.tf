#terraform {
#  backend "gcs" {
#    bucket = "ajeyjaiswar"
#    prefix = "terraform/tfstate"
#    #credentials = file("C:/Users/ajay.jaiswar/Desktop/Restricted/Learning/Terraform Trainings/GCP_compute_tfstate backup/credential.json")
#  }
#}


resource "google_compute_instance" "vm_instance" {
    name = "webserver"
    machine_type = "e2-medium"
    zone = "us-west1-a"
    tags = ["test"]

    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-11"
      }
    }

    network_interface {
      network = "default"
    }
  
}

