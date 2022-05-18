#EC2 instance - Bastion for public subnet

module "ec2-instance-bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.5.0"

  name="${local.name}-bastion-host"
  
  ami=data.aws_ami.amazon-linux-2.id
  instance_type=var.instance-type
  subnet_id=module.vpc-1.public_subnets[0]
  monitoring=true
  vpc_security_group_ids=[module.security-group-public.security_group_id]
  tags=local.common_tags

}