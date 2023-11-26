resource "aws_cloudwatch_metric_alarm" "high_response_time_alarm" {
  alarm_name  = "high_response_time-alarm"
  namespace   = "cloudwatch-${var.candidate_prefix}"
  metric_name = "response_time"

  comparison_operator = "GreaterThanThreshold"
  threshold           = 2000
  evaluation_periods  = "2"
  period              = "60"
  statistic           = "Average"

  alarm_description = "This alarm monitors high response times"
  alarm_actions     = [aws_sns_topic.user_updates.arn]
  ok_actions                = [aws_sns_topic.user_updates.arn]
  insufficient_data_actions = []
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  
  topic_arn = var.sns_topic_arn
  protocol  = "email"
  endpoint  = var.alarm_email
}