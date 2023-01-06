variable "create_sns_topic" {
  description = "Whether to create the SNS topic"
  type = bool
  default = true
}

variable "delivery_policy_file_path" {
  description = "path for the file"
  type = string
  default = null
}

variable "policy_file_path" {
  description = "path for the file"
  type = string
  default = null
}

variable "create_sns_topic_subscription" {
  description = "Whether to create the SNS topic subscription"
  type = bool
  default = false
}

variable increment_code {
  description = "Increment code to append to the instance name. Example: WANV-SHS-9-EC2-WebProxy-<increment_code>"
  validation {
    condition = can(regex("^\\d{3}$", var.increment_code))
    error_message = "Increment code must be a three digit number."
  }
}
variable description {
  description = "Provide a description for the instance. This entry will be populated in Description tag for the instance and the devices created by the instance at launch time"
}

variable naming_prefix_upper {}

variable common_tags {}
variable additional_tags {
  description = "Mention additional tags if any."
  type = map
  default = {}
}

variable function {
  description = "Function/scope of the SNS topic. This value will be used to form the Name tag. Example: WANV-SHS-9-SNS-<function>-001"
  validation {
    condition = can(regex("^[a-zA-Z0-9-]+$", var.function)) 
    error_message = "Function should contain only alphanumeric characters and dash."
  }
}

//variable "email_list" {
//  description = "Email list for SNS notification"
//  type = list(string)
//  default = []
//}

variable "display_name" {
  description = "The display name for the SNS topic"
  type = string
  default = null
}

variable "policy" {
  description = "The fully-formed AWS policy as JSON"
  type = string
  default = null
}

variable "delivery_policy" {
  description = "The SNS delivery policy"
  type = string
  default = null
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK"
  type = string
  default = null
}

variable "endpoints" {
  description = "The endpoint for SNS Topic subscription"
  type = map(object({
    protocol = string
    endpoint = string
  }))
 default = null
}

