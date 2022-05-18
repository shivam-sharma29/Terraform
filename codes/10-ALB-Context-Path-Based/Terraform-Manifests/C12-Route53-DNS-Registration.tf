resource "aws_route53_record" "apps-dns" {
    zone_id = data.aws_route53_zone.dns-route-53.zone_id
    name    = "apps.shivam-sharma.com"
    type    = "A"

    alias {
        name                   = module.alb-demo.lb_dns_name
        zone_id                = module.alb-demo.lb_zone_id
        evaluate_target_health = true
    }
}