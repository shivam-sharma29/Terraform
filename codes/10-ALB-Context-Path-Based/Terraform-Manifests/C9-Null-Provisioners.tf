/*
resource "null_resource" "name" {
    #Connection block for provisioners to connect to EC2 Instance
    depends_on=[module.ec2-instance-bastion, module.vpc-1]
    connection {
        type     = "ssh"
        user     = "ec2-user"
        
        host     = module.ec2-instance-bastion.public_ip
        private_key = file("Private-Key/ec2-instances-1.pem")
    }  

    provisioner "file" {
        source      = "Private-Key/ec2-instances-1.pem"
        destination = "/tmp/ec2-instances-1.pem"
        }

    provisioner "remote-exec" {
        inline = ["sudo chmod 400 /tmp/ec2-instances-1.pem"]
    }

    provisioner "local-exec" {
        command = "echo VPC ID date and VPC ID on: ${module.vpc-1.vpc_id} >> creation-time-vpc-id.txt"
        working_dir="Local-exec-output-files/"

    }
   
}
*/
