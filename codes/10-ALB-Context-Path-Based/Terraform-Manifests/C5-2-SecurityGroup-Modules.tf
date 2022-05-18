#creation of security group from terraform available module

module "security-group-public" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  name="public-bastion-sg"
  description="security group with SSH port open for everybody opened, egress ports are all opened"
  vpc_id=module.vpc-1.vpc_id
  ingress_cidr_blocks = [var.vpc-cidr-blocks-1]
  ingress_rules       = ["ssh-tcp"]
  egress_rules = ["all-all"]

  tags=local.common_tags
}

#creation of security group from terraform available module

module "security-group-private" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  name="private-sg"
  description="security group with SSH and HTTPS port open for entire VPC, egress ports are all opened"
  vpc_id=module.vpc-1.vpc_id
  ingress_cidr_blocks = ["${module.vpc-1.vpc_cidr_block}"]
  ingress_rules       = ["ssh-tcp", "http-80-tcp"]
  egress_rules = ["all-all"]

  tags=local.common_tags
}



