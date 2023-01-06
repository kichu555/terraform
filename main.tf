locals {
  sns_topic_name = "${var.naming_prefix_upper}-SNS-${var.function}-${var.increment_code}"
}

## SNS Topic Creation
resource "aws_sns_topic" "main" {
  name = local.sns_topic_name
  display_name = var.display_name
  policy = var.policy_file_path == null? null:file(var.policy_file_path)
  delivery_policy = var.delivery_policy_file_path == null? null:file(var.delivery_policy_file_path)
  kms_master_key_id = var.kms_master_key_id
  tags = merge(
  var.common_tags,
  var.additional_tags,
   tomap({
      "Name"        = local.sns_topic_name
      "Service"     = "Sns Service",
      "Description" = var.description
    })
  )
}

## SNS Topic Subscription
resource "aws_sns_topic_subscription" "email" {
  for_each = var.endpoints
  topic_arn = aws_sns_topic.main.arn
  protocol = each.value.protocol
  endpoint = each.value.endpoint
}

