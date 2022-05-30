terraform {
  backend "s3"{
      bucket = "eventsdava-bucket"
      key = "vpc/terraform.state"
      region = "us-east-1"
  }
}