resource "google_storage_bucket" "ajeyjaiswar" {
    count = 1
    name = "ajeyjaiswar"
    location = "us-west2"
    storage_class = "REGIONAL"
  
}