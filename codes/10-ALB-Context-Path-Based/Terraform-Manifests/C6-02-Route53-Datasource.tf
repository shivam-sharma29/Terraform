#Get DNS information from Route53 Zone

data "aws_route53_zone" "dns-route-53" {
  name         = "shivam-sharma.com"
  #private_zone = true
}

#Output zone id, Get DNS information from Route53 Zone

output "my-domain-zoneid" {
    description= "The Hosted Zone id of the desired Hosted Zone"
    value=data.aws_route53_zone.dns-route-53.zone_id

}

#Output domain name

output "my-domain-name" {
    description= "The Hosted Zone name of the desired Hosted Zone."
    value=data.aws_route53_zone.dns-route-53.name

}