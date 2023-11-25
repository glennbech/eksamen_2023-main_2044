resource "aws_cloudwatch_metric_alarm" "high_response_time_alarm" {
  alarm_name  = "high_response_time"
  namespace   = "cloudwatch-candidate2044"
  metric_name = "response_time"

  comparison_operator = "GreaterThanThreshold"
  threshold           = 2000
  evaluation_periods  = "2"
  period              = "60"
  statistic           = "Maximum"

  alarm_description = "This alarm monitors high response times"
  alarm_actions     = [aws_sns_topic.user_updates.arn]
}

resource "aws_sns_topic" "user_updates" {
  name = "high_response_time-alarm-topic"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = "email"
  endpoint  = "rebeckaspolander@yahoo.se"
}