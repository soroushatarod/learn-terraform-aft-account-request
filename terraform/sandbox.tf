module "sandbox" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "soroush.atarod+contino12@contino.io"
    AccountName               = "sandbox-aft"
    ManagedOrganizationalUnit = "Sandbox"
    SSOUserEmail              = "soroush.atarod+contino12@contino.io"
    SSOUserFirstName          = "Sandbox"
    SSOUserLastName           = "AFT"
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

  account_customizations_name = "sandbox"
}

variable "sandbox_users" {
  #["nickolas-hunt", "ming-yang"]
  description = "List of sandbox users"
  default = [
    {
      id      = 1,
      name    = "john-snow",
      enabled = true
    }
  ]
}

module "sandbox_list" {
  source = "./modules/aft-account-request"
  for_each = {
    for cj in var.sandbox_users : cj.id => cj
  }

  control_tower_parameters = {
    AccountEmail              = "soroush.atarod+${each.value.name}@contino.io"
    AccountName               = "sandbox-aft-${each.value.name}"
    ManagedOrganizationalUnit = "Sandbox"
    SSOUserEmail              = "soroush.atarod@contino.io"
    SSOUserFirstName          = "Sandbox"
    SSOUserLastName           = "AFT"
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

  account_customizations_name = "sandbox"
}
