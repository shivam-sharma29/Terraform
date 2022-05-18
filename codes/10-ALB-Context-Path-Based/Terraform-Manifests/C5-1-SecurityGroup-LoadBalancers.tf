#Security Group for public Load Balancer


#creation of security group from terraform available module

module "security-group-load-balancer" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  name="load-balancers-sg"
  description="security group with HTTP port open for everybody opened, egress ports are all opened"
  vpc_id=module.vpc-1.vpc_id
  ingress_cidr_blocks = [var.vpc-cidr-blocks-1]
  ingress_rules       = ["http-80-tcp","https-443-tcp"]
  egress_rules = ["all-all"]
  
  tags=local.common_tags
  ingress_with_cidr_blocks = [
    {
      from_port=81
      to_port=81
      protocol=6
      description="allow port 81 from internet"
      cidr_blocks="${var.vpc-cidr-blocks-1}"
    }
  ]
}







