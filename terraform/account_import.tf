module "aft_import_root" {
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
  }

  change_management_parameters = {
    change_requested_by = "Account_Infra"
    change_reason       = "Import a Sandbox account in AFT"
  }

}
# aws organizations list-organizational-units-for-parent --parent-id=r-z0w6