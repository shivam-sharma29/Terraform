module "vpc-1" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "3.13.0"

    name = "${local.name}-${var.vpc-name}"
    cidr = var.cidr-var
    azs                 = var.availability-zones    
    private_subnets     = var.vpc-private-subnets
    public_subnets      = var.vpc-public-subnets
    database_subnets    = var.vpc-database-subnets

    enable_dns_hostnames = var.enable_dns_hostnames-var
    enable_dns_support   = var.enable_dns_support-var
    
    enable_nat_gateway = var.enable_nat_gateway-var
    single_nat_gateway = var.single_nat_gateway-var
    
    create_database_nat_gateway_route=var.create_database_nat_gateway_route-var
    create_database_internet_gateway_route=var.create_database_internet_gateway_route-var
    create_database_subnet_group=var.create_database_subnet_group-var
    create_database_subnet_route_table=var.create_database_subnet_route_table-var


    public_subnet_tags={
        name="public-subnets"
    }

    private_subnet_tags={
        name="private-subnets"
    }

    database_subnet_tags={
        name="database-subnets"
    }

    tags=local.common_tags

    vpc_tags=local.common_tags

}