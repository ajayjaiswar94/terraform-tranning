
provider "google" {
    credentials  =   file("C:/Users/ajay.jaiswar/Desktop/Restricted/Learning/Terraform Trainings/GCP_VPC/credential.json")
    project     =  "optimal-brand-372411"
    region      =   "us-west2" 
}

### Creation of VPC ############

resource "google_compute_network" "VPC2" {
    name = "new-vpc2"
    auto_create_subnetworks = false
    
}

###### Creation of public subnet 
 resource "google_compute_subnetwork" "public" {
    name = "public"
    ip_cidr_range = "10.0.0.0/24"
    region = "us-west2"
    network = google_compute_network.VPC2.id
 }


 resource "google_compute_subnetwork" "private" {
    name = "private"
    ip_cidr_range = "10.0.1.0/24"
    region = "us-west2"
    network = google_compute_network.VPC2.id
 }

 ####### adding cloud router to VPC

resource "google_compute_router" "router" {
    name = "router"
    network = google_compute_network.VPC2.id
    bgp {
      asn   =   64514
      advertise_mode = "CUSTOM"
    }   
  
}

###### adding NAT Gateway ###############

resource "google_compute_router_nat" "nat" {
    name = "nat"
    router = google_compute_router.router.name
    region = google_compute_router.router.region
    nat_ip_allocate_option = "AUTO_ONLY"
    source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

    
subnetwork {
  name  =   "private"
  source_ip_ranges_to_nat = ["ALL_IP_RANGES"]

}

  
}