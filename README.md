# **Terraform AWS Module for SNS**
This module can be used to create SNS topic and subscription.

### **Table of Contents**

- [Usage](#usage)
- [Examples](#examples)
- [Requirements](#requirements)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Authors](#authors)

### **Usage**
```
module "sns" {
source = "git::https://gitlab.wuintranet.net/terraform-module-registry/aws/sns?ref=v1.0.1"
# add your inputs here...
}
```

## Examples

- [sns with Basic Configuration](examples/basic-configuration/)


### **Requirements**

| Name | Version |
| ------ | ------| 
| terraform | 0.13.4 | 
| aws       | 4.22.0 |

### **Inputs**

| Name | Description |Type| Default|
| ----- | ----- | ------ |----- | 
| additional_tags                | Mention additional tags if any. Number of additional tags can not exceed a limit of 37.  | map          | { }     |
| description                    | Provide value for the tag: Description                                                   | string       |         |
| function                       | Function/scope of the s3. Same value will be used for tag : Name                         | string       |         |
| increment_code                 | Increment code to append to the instance name.                                           | string       |         |
| common_tags                    | General resource tags                                                                    | map          |         |
| naming_prefix_upper            | Part of name (WANV-0-LAB...)                                                             | string       |         |
| create_sns_topic               | Whether SNS topic to be created                                                          | boolean      |         |
| display_name                   | Name Of SNS Topic                                                                        | string       |         |
| delivery_policy_file_path      | SNS Delivery json policy file path                                                       | string       |         |
| kms_master_key_id              | KMS key for encryption                                                                   | string       |         |
| endpoints                      | SNS Endpoints to be subscribed                                                           | map          |  { }    |
| protocol                       | SNS endpoint protocol                                                                    | string       |         |
| endpoint                       | SNS endpoint                                                                             | string       |         |


## Outputs

| Name        | Description                              |
| ----------- | ---------------------------------------- |
| sns_topic_arn  | Amazon Resource Name (ARN) of the SNS |
| sns_topic_name | Name of the SNS Topic                 |   
| sns_topic_id   | Id of the SNS Topic                   | 

## Authors

- Cloud Platform Engineering
