provider "google" {
    credentials = file("C:/Users/ajay.jaiswar/Desktop/Restricted/Learning/Terraform Trainings/variable_example/credential.json")
    project = "${var.project}"
    region = "${var.region}"
  
}