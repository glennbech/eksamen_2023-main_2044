variable "sns_topic_arn" {
  description = "The ARN of the SNS topic for alarm actions"
  type        = string
}

variable "candidate_prefix"{
  description = "The common prefix used in resource names"
  type = string
  //default = "candidate2044" //Change this value. This value is used in multiple places
}

variable "alarm_email" {
  type = string
}

