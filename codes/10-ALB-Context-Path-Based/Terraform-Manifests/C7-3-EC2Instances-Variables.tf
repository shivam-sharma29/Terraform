/*
variable "instance_keypair" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type = string
  default = "ec2-instances-1.pem"
}
*/


variable "instance-count"{
    type=number
    default=1
}


variable "instance-type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}