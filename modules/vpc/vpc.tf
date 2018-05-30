resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr_block}"

  tags {
    Name        = "${terraform.workspace}_vpc"
    Environment = "${terraform.workspace}"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${terraform.workspace}_igw"
    Environment = "${terraform.workspace}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.public_subnet_cidr_block}"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

  tags {
    Name        = "${terraform.workspace}_pub_subnet"
    Environment = "${terraform.workspace}"
  }
}

resource "aws_security_group" "public_subnet_sg" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${terraform.workspace}_pub_sg"
    Environment = "${terraform.workspace}"
  }

  // Only need ingress as SGs are stateless
  ingress {
    cidr_blocks = [
      // Accept all traffic to the public subnet's Jenkins port
      "0.0.0.0/0"
    ]
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = [
      // Accept all traffic to the public subnet's HTTPS port
      "0.0.0.0/0"
    ]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = [
      // Accept all traffic to the public subnet's HTTP port
      "0.0.0.0/0"
    ]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = [
      // Accept all traffic to the public subnet's SSH port
      "0.0.0.0/0"
    ]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
}

resource "aws_route_table" "public_subnet_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }

  tags {
    Name        = "${terraform.workspace}_route_table"
    Environment = "${terraform.workspace}"
  }
}

resource "aws_route_table_association" "public_subnet_route_table_assoc" {
  subnet_id      = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.public_subnet_route_table.id}"
}