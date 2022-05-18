#Ouput for App-1

output "ec2-instance-private-id-App-1" {
  
  description = "The id assigned to the instance"
  value       = module.ec2-instance-private-app-1.*.id
}


output "private_ip-App-1" {

description = "The private IP address assigned to the instance."
value       = module.ec2-instance-private-app-1.*.private_ip
}


#Ouput for App-2

output "ec2-instance-private-id-App-2" {
  
  description = "The id assigned to the instance"
  value       = module.ec2-instance-private-app-2.*.id
}


output "private_ip-App-2" {

description = "The private IP address assigned to the instance."
value       = module.ec2-instance-private-app-2.*.private_ip
}