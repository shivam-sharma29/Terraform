#EC2 instance - private subnet

module "ec2-instance-private-app-1" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.5.0"
  depends_on=[module.vpc-1]

  name="${var.business-environment}-app-1"
  
  ami=data.aws_ami.amazon-linux-2.id
  instance_type=var.instance-type

  subnet_id=module.vpc-1.private_subnets[0]
  monitoring=true
  vpc_security_group_ids=[module.security-group-private.security_group_id]
  tags=local.common_tags
  user_data=file("${path.module}/server-script.sh")
  count=2
  #key_name= file("Private-Key/${var.instance_keypair}")

}

#EC2 instance - private subnet

module "ec2-instance-private-app-2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.5.0"
  depends_on=[module.vpc-1]

  name="${var.business-environment}-app-2"
  
  ami=data.aws_ami.amazon-linux-2.id
  instance_type=var.instance-type

  subnet_id=module.vpc-1.private_subnets[1]
  monitoring=true
  vpc_security_group_ids=[module.security-group-private.security_group_id]
  tags=local.common_tags
  user_data=file("${path.module}/server-script-app2.sh")
  count=2
  #key_name= file("Private-Key/${var.instance_keypair}")

}