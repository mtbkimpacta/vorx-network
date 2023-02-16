terraform {
  backend "s3" {
    bucket = "mtbkimpacta-vorx-terraform"
    key    = "vorx-network.tfstate"
    region = "us-east-1"
  }
}
