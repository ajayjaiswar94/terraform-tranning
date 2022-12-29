resource "google_compute_instance" "vm_instance" {
    name = "webserver"
    machine_type = "${var.ec2-medium}"
    zone = "us-west1-a"
    tags = ["test"]

    boot_disk {
      initialize_params {
        image = "${var.image}"
      }
    }

    network_interface {
      network = "default"
    }
   	
}