resource "aws_elb" "elb_demo" {
  name = "ElasticLoadBalancer"
  subnets = [ "${aws_subnet.subnet_demo.id}"]
  security_groups = [ "${aws_security_group.sg_elb.id}" ]

  listener {
      instance_port = 80
      instance_protocol = "HTTP"
      lb_port =  80
      lb_protocol = "HTTP"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances = "${aws_instance.instance_demo.*.id}"
}

output "aws_elb_dns" {
  value = "${aws_elb.elb_demo.dns_name}"
}
