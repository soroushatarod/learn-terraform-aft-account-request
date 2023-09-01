module "account_import" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "subscriptions+aws.lz.terraform@contino.io"
    AccountName               = "aws-lz-terraform"
    ManagedOrganizationalUnit = "Root"
    SSOUserEmail              = "soroush.atarod@contino.io"
    SSOUserFirstName          = "Soroush"
    SSOUserLastName           = "Atarod"
  }

  account_tags = {
    "Learn Tutorial" = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "HashiCorp Learn"
    change_reason       = "Learn AWS Control Tower Account Factory for Terraform"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "management"
}

variable "default_sso_details" {
  default = {
    SSOUserEmail     = "soroush.atarod@contino.io"
    SSOUserFirstName = "Soroush"
    SSOUserLastName  = "Atarod"
  }
}

module "control_tower_account_audit" {

  source = "./modules/aft-account-request"

  control_tower_parameters = merge({
    AccountEmail              = "subscriptions+aws.lz.terraform.audit@contino.io"
    AccountName               = "Audit"
    ManagedOrganizationalUnit = "Security"
  }, var.default_sso_details)

  account_tags = {
    Category = "Security"
  }

  change_management_parameters = {
    change_requested_by = "Soroush"
    change_reason       = "Import Control Tower Accounts"
  }

  custom_fields = {
    group = "prod"
  }

  account_customizations_name = "landingzone"
}
