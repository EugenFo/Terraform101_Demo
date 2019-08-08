resource "aws_instance" "instance_demo" {
  count = "${var.instance_count}"

  ami = "ami-0cd855c8009cb26ef"
  availability_zone = "eu-central-1a"
  instance_type = "t2.micro"
  key_name = "${var.keypair}"
  associate_public_ip_address = true
  subnet_id = "${aws_subnet.subnet_demo.id}"
  vpc_security_group_ids = [ "${aws_security_group.sg_demo.id}" ]

  tags = {
    Name = "Webserver-${count.index + 1}"
  }

  user_data = "${file("init.sh")}"
}

output "aws_ec2_public-ip" {
  value = "${aws_instance.instance_demo.*.public_ip}"
}
