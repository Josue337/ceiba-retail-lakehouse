module "storage" {
  source = "./modules/storage"

  name_prefix = local.name_prefix
  account_id  = data.aws_caller_identity.current.account_id
}
