terraform {
  backend "s3" {
    bucket         = "terraform-remote-state-collab-grace-tassi"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-lock-collab"
  }
}

