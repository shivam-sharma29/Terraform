module "acm" {
    source  = "terraform-aws-modules/acm/aws"
    version = "3.4.0"
    domain_name  = trimsuffix(data.aws_route53_zone.dns-route-53.name,".")
    zone_id      = data.aws_route53_zone.dns-route-53.zone_id
    subject_alternative_names = [
        "*.${data.aws_route53_zone.dns-route-53.name}"
    ]
    wait_for_validation = true

}

#Output ACM certificate ARN
output "acm_certificate_arn" {
    description = "The ARN of the certificate"
    value       = module.acm.acm_certificate_arn
}