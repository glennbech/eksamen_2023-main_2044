variable "sns_topic_arn" {
  description = "The ARN of the SNS topic for alarm actions"
  type        = string
}

variable "prefix" {
  type = string
}

variable "alarm_email" {
  type = string
}