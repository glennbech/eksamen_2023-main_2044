resource "aws_apprunner_service" "service" {
  service_name = "kjell-is-${var.candidate_prefix}"

  instance_configuration {
    instance_role_arn = aws_iam_role.role_for_apprunner_service.arn
    cpu               = var.instance_cpu
    memory            = var.instance_memory
  }

  source_configuration {
    authentication_configuration {
      access_role_arn = var.access_role_arn
    }
    image_repository {
      image_configuration {
        port = var.app_port
      }
      image_identifier      = "244530008913.dkr.ecr.eu-west-1.amazonaws.com/${var.ecr_repository}:latest"
      image_repository_type = "ECR"
    }
    auto_deployments_enabled = true
  }
}

resource "aws_iam_role" "role_for_apprunner_service" {
  name               = "${var.candidate_prefix}-role-thingy"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["tasks.apprunner.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "policy" {
  statement {
    effect    = "Allow"
    actions   = ["rekognition:*"]
    resources = ["*"]
  }
  
  statement  {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }

  statement  {
    effect    = "Allow"
    actions   = ["cloudwatch:*"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "policy" {
  name        = "${var.candidate_prefix}-apr-policy-thingy"
  description = "Policy for apprunner instance I think"
  policy      = data.aws_iam_policy_document.policy.json
}

resource "aws_iam_role_policy_attachment" "attachment" {
  role       = aws_iam_role.role_for_apprunner_service.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_sns_topic" "user_updates" {
  name = "user-updates-topic"
}

module "alarm" {
  source        = "./alarm"
  sns_topic_arn = aws_sns_topic.user_updates.arn
}