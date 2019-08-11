variable "keypair" {
  description = "Keypair used for ec2 instance."
  type = "string"
}

variable "instance_count" {
  description = "Number of ec2 instances."
  type = number
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
  type = "string"
}
