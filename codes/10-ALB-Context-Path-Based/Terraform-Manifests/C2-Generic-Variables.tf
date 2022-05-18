#Variable for Region

variable "aws-region" {
    type=string
    default="ca-central-1"
  
}

#Variable for environment

variable "business-environment" {
    type=string
    default="dev"
  
}

#Variable for business department

variable "business-department" {
    type=string
    default="CDS"
  
}
