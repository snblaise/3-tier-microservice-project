# securing the state file in S3
terraform {
  backend "s3" {
    bucket = "sn-aeon-terraform-remote-state"
    key = "aeon-website-ecs.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}