module "tagsmap" {
  source                = "../../../tagsmap" #"git::https://gitlab.wuintranet.net/terraform-module-registry/aws/tagsmap?ref=v1.0.0"
  application_name      = "Foundation Services"
  application_code      = "FDS"
  application_owner     = "Troy.Lillehoff@wu.com"
  aws_region            = "us-east-1"
  business_unit         = "WesternUnion"
  cost_center           = "1390"
  domain                = "Foundation"
  environment           = "DEV"
  patch_group           = "Foundation"
  product_tower         = "Foundation"
  production_level_code = "Development"
  request_id            = "LZ"
  pci                   = "No"
  support_contact       = "ioc_ccoe@wu.com"
}


module "sns" {
  source              = "../.." #"git::https://gitlab.wuintranet.net/terraform-module-registry/aws/sns?ref=v1.0.1"
  naming_prefix_upper = module.tagsmap.naming_prefix_upper
  common_tags         = module.tagsmap.common_tags
  function            = "Automation"
  increment_code      = "004"
  description         = "Sample SNS created by automation pillar"
  display_name        = "Automation SNS Topic"


  endpoints = {
    endpoint2 = {
      protocol = "https"
      endpoint = "https://www.example.com"
    }
  }
}
