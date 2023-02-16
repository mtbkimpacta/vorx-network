resource "aws_vpc" "vorx-vpc-prod" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Vorx-PROD"
  }
}

resource "aws_subnet" "vorx-subnet-pub-1a" {
  vpc_id            = aws_vpc.vorx-vpc-prod.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "prod-public-subnet-1a"
  }
}

resource "aws_subnet" "vorx-subnet-priv-1a" {
  vpc_id            = aws_vpc.vorx-vpc-prod.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "prod-private-subnet-1a"
  }
}

resource "aws_subnet" "vorx-subnet-pub-1b" {
  vpc_id     = aws_vpc.vorx-vpc-prod.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "prod-public-subnet-1b"
  }
}

resource "aws_subnet" "vorx-subnet-priv-1b" {
  vpc_id     = aws_vpc.vorx-vpc-prod.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "prod-private-subnet-1b"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vorx-vpc-prod.id

  tags = {
    Name = "igw-prod-vorx-vpc"
  }
}

output "vpc_vorx_prod_id" {
  value = aws_vpc.vorx-vpc-prod.id
}

output "vpc_vorx_prod_arn" {
  value = aws_vpc.vorx-vpc-prod.arn
}

output "vorx_prod_subnet_pub-1a" {
  value = aws_subnet.vorx-subnet-pub-1a.id
}

output "vorx_prod_subnet_priv-1a" {
  value = aws_subnet.vorx-subnet-priv-1a.id
}
