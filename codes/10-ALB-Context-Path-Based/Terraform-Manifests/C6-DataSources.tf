#Create datasource to fetch data for AMI from Amazon

data "aws_ami" "amazon-linux-2" {
    owners = ["amazon"]
    most_recent = true

    filter {
      name="name"
      values=["amzn2-ami-kernel-5.10-hvm-*-gp2"]
    }

    filter {
      name="virtualization-type"
      values=["hvm"]
    }

    filter {
      name="architecture"
      values=["x86_64"]
    }

    filter {
      name="root-device-type"
      values=["ebs"]
    }
  
}