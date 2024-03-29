resource "aws_security_group" "sg_demo" {
  name = "allow_http"
  vpc_id = "${aws_vpc.vpc_demo.id}"

  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = "0"
    to_port = "65535"
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}


resource "aws_security_group" "sg_elb" {
  name = "allow_http_to_elb"
  vpc_id = "${aws_vpc.vpc_demo.id}"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 65000
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
