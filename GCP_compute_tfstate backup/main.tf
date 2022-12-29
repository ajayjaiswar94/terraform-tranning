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

