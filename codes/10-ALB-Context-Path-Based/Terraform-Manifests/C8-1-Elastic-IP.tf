/*
resource "aws_eip" "bastion-host-eip" {
    depends_on = [module.vpc-1,module.ec2-instance-bastion]
    instance = module.ec2-instance-bastion.id
    vpc      = true
}
*/
