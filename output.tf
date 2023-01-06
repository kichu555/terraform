output "sns_topic_arn" {
  description = "ARN of SNS topic"
  value = aws_sns_topic.main.arn
}
output "sns_topic_name" {
  description = "NAME of SNS topic"
  value       = aws_sns_topic.main.name
}

output "sns_topic_id" {
  description = "ID of SNS topic"
  value       = aws_sns_topic.main.id
}
