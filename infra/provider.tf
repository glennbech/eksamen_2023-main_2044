terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.33.0"
    }
  }
  backend "s3" {
    bucket = "pgr301-2021-terraform-state"
    key    = "candidate2044/apprunner-lab.state" # You chould change the candidate2044 to you own "name".
    region = "eu-north-1"
  }
}