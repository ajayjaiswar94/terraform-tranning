resource "google_compute_instance" "instanceVM" {
    count = 2
    machine_type = var.ec2-medium
    zone = var.zone
    name = "webserver-${count.index + 1}"
    

    boot_disk {
      initialize_params {
        image = var.image-ID
      }
    }

    network_interface {
      network = "default"
    }
  
}