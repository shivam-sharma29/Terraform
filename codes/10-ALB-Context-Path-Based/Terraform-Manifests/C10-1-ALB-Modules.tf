module "alb-demo" {
    
    source  = "terraform-aws-modules/alb/aws"
    version = "6.4.0"
    vpc_id=module.vpc-1.vpc_id
    name="${local.name}-alb"
    load_balancer_type="application"
    subnets=[module.vpc-1.public_subnets]
    security_groups=["${module.security-group-load-balancer.security_group_id}"]

    #Listeners
    # HTTP to HTTPS Redirect
    http_tcp_listeners = [

        {
            port     = 80
            protocol = "HTTP"
            action_type = "redirect"
            redirect={
                port=443
                protocol="HTTPS"
                status_code="HTTP_301"
            }

        }

    ]
    target_groups = [
        {
            name_prefix          = "app1-"
            backend_protocol     = "HTTP"
            backend_port         = 80
            target_type          = "instance"
            deregistration_delay = 10
            health_check = {
                enabled             = true
                interval            = 30
                path                = "/app1/index.html"
                port                = "traffic-port"
                healthy_threshold   = 3
                unhealthy_threshold = 3
                timeout             = 6
                protocol            = "HTTP"
                matcher             = "200-399"
            }
        
        
        protocol_version = "HTTP1"
        targets = {
            
            my_app1_vm1 = {
                
                target_id = tostring(module.ec2-instance-private-app-1[0].id)
                port      = 80
            },
            my_app1_vm2 = {
                target_id = tostring(module.ec2-instance-private-app-1[1].id)
                port      = 80
            }
        }
    
        tags = local.common_tags

        },

        #Target Group for App-2

        {
            name_prefix          = "app2-"
            backend_protocol     = "HTTP"
            backend_port         = 80
            target_type          = "instance"
            deregistration_delay = 10
            health_check = {
                enabled             = true
                interval            = 30
                path                = "/app2/index.html"
                port                = "traffic-port"
                healthy_threshold   = 3
                unhealthy_threshold = 3
                timeout             = 6
                protocol            = "HTTP"
                matcher             = "200-399"
            }
        
        
        protocol_version = "HTTP1"
        targets = {
            
            my_app2_vm1 = {
                
                target_id = tostring(module.ec2-instance-private-app-2[0].id)
                port      = 80
            },
            my_app2_vm2 = {
                target_id = tostring(module.ec2-instance-private-app-2[1].id)
                port      = 80
            }
        }
    
        tags = local.common_tags

        }

    ]
    #HTTPS Listener

    https_listeners = [
        #HTTPS Listener Index = 0 for HTTPS 443 port

        {
    
            port     = 443
            protocol = "HTTPS"
            certificate_arn=module.acm.acm_certificate_arn
            action_type="fixed-response"
            
            fixed_response={

                content_type="text/plain"
                message_body="Fixed Static message - for Root context"
                status_code="200"
            }

        }
    ]

    #Listener rules for App-1

    https_listener_rules = [
        #Rule-1: / app1* should go to App1 ec2 instance
        {
            https_listener_index = 0
            actions = [
                {
                    type               = "forward"
                    target_group_index = 0
                }
            ]    
            
            conditions = [
                {
                    path_patterns = ["/app1*"]
                
                }
            ]
        
        },

        {
            #Rule-2: / app2* should go to App1 ec2 instance
            https_listener_index = 0
            actions = [
                {
                    type               = "forward"
                    target_group_index = 1
                }
            ]    
            
            conditions = [
                {
                    path_patterns = ["/app2*"]
                
                }
            ]
        
        }

    ]
}
