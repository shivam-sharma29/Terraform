locals {
    owners=var.business-department
    environment=var.business-environment
    name = "${var.business-department}-${var.business-environment}"

    common_tags={
        owners=local.owners
        environment=local.environment
    }
}