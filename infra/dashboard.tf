//ref: 
//https://github.com/Rebeckaspolander/cloudwatch_alarms_terraform/blob/main/infra/main.tf
resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "cloudwatch-${var.candidate}"
  dashboard_body = <<DASHBOARD
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.candidate}",
            "response_time",
            "service",
            "s3rekognition"
          ]
        ],
        "period": 300,
        "stat": "Average",
        "region": "eu-west-1",
        "title": "Average Response Time"
      }
    },
    {
      "type": "metric",
      "x": 6,
      "y": 0,
      "width": 6,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.candidate}",
            "count_image", "service", "s3rekognition"
          ]
        ],
        "period": 300,
        "stat": "Sum",
        "region": "eu-west-1",
        "title": "Image Count"
      }
    },
    {
      "type": "metric",
      "x": 12,
      "y": 0,
      "width": 6,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.candidate}",
            "total_violation", "service", "s3rekognition"
          ]
        ],
        "period": 300,
        "stat": "Sum",
        "region": "eu-west-1",
        "title": "Total Violations"
      }
    }
  ]
}
DASHBOARD
}