// Ref:
//https://github.com/glennbechdevops/cloudwatch_alarms_terraform/blob/main/infra/main.tf
resource "aws_cloudwatch_metric_alarm" "high_response_time_alarm" {
  alarm_name  = "high_response_time-alarm"
  namespace   = "cloudwatch-candidate2044"
  metric_name = "response_time"

  comparison_operator = "GreaterThanThreshold"
  threshold           = 2000
  evaluation_periods  = "2"
  period              = "60"
  statistic           = "Average"

  alarm_description = "This alarm monitors high response times"
  alarm_actions     = [var.sns_topic_arn]
  ok_actions        = [var.sns_topic_arn]
  insufficient_data_actions = []
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = var.sns_topic_arn
  protocol  = "email"
  endpoint  = "rebeckaspolander@yahoo.se"
}