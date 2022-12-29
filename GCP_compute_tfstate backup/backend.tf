terraform {
  backend "gcs" {
    bucket = "ajeyjaiswar"
    prefix = "terraform/tfstate"    
 }
 }
