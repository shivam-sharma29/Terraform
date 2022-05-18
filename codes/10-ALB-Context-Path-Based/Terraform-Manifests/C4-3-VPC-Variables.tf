# Input Variables

variable "create_database_nat_gateway_route-var" {
  type = bool
  default = true
}


variable "create_database_internet_gateway_route-var" {
  type = bool
  default = true
}

variable "create_database_subnet_group-var" {
  type = bool
  default = true
}


variable "create_database_subnet_route_table-var" {
  type = bool
  default = true
}


variable "cidr-var" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc-name" {
  type = string
  default = "my-vpc"
}

variable "availability-zones" {
  type = list(string)
  default =["ca-central-1a","ca-central-1b"]
}


variable "vpc-private-subnets" {
  type = list(string)
  default =["10.0.1.0/24","10.0.2.0/24"]
}

variable "vpc-public-subnets" {
  type = list(string)
  default =["10.0.101.0/24","10.0.102.0/24"]
}

variable "vpc-database-subnets" {
  type = list(string)
  default =["10.0.151.0/24","10.0.152.0/24"]
}


variable "enable_nat_gateway-var"{
  type=bool
  default=true
}

variable "single_nat_gateway-var"{
  type=bool
  default=true
}

variable "enable_dns_hostnames-var"{
  type=bool
  default=true
}

variable "enable_dns_support-var"{
  type=bool
  default=true
}






