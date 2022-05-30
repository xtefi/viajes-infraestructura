terraform {
  backend "s3" {
      bucket = "eventsdava-bucket"
      key = "vpc.tfstate"
      region = "us-east-1"
  }
}

data "terraform_remote_state" "eventsdava-vpc" {
    backend = "s3"
    config = {
        bucket = "eventsdava-bucket"
        key = "vpc/terraform.state"
        region = "us-east-1"
    }
}