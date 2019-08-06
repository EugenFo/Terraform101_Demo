resource "aws_vpc" "vpc_demo" {
  cidr_block = "192.168.0.0/16"
}

resource "aws_subnet" "subnet_demo" {
  vpc_id = "${aws_vpc.vpc_demo.id}"
  cidr_block = "192.168.10.0/24"
  availability_zone = "eu-central-1a"
}
resource "aws_internet_gateway" "ig_demo" {
  vpc_id = "${aws_vpc.vpc_demo.id}"
}

resource "aws_route_table" "route_demo" {
  vpc_id = "${aws_vpc.vpc_demo.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig_demo.id}"
  }
}

resource "aws_route_table_association" "rt_association_demo" {
  subnet_id = "${aws_subnet.subnet_demo.id}"
  route_table_id = "${aws_route_table.route_demo.id}"
}