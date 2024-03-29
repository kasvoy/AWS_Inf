resource "aws_vpc" "website_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "websiteVPC"
  }
}

resource "aws_subnet" "primary_subnet" {
  vpc_id = aws_vpc.website_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    name = "primary-subnet"
  }

  availability_zone = var.availability_zone_names[0]
}

resource "aws_subnet" "secondary_subnet" {
  vpc_id = aws_vpc.website_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    name = "secondary-subnet"
  }

  availability_zone = var.availability_zone_names[1]
}

resource "aws_internet_gateway" "website_gw" {
  vpc_id = aws_vpc.website_vpc.id
}

resource "aws_route_table" "web_rt" {
  vpc_id = aws_vpc.website_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.website_gw.id
  }

  tags = {
    Name = "website-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.primary_subnet.id
  route_table_id = aws_route_table.web_rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.secondary_subnet.id
  route_table_id = aws_route_table.web_rt.id
}