resource "google_compute_instance" "myvm"{
    name            =   "myvm"
    machine_type    =   "e2-micro"
    zone            =   "us-central1-a"
    #tags            =   ["new virtual machine"]
    allow_stopping_for_update   =   true

    labels = {
        name    =   "newvm"
        os      =   "centos-machine"
    }

    boot_disk {
        initialize_params {
            image = "centos-cloud/centos-7"
        }
    }

    network_interface {
        network = "default"

        access_config {
            // Ephemeral IP

        }
    }


}

