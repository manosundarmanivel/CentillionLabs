resource "aws_iam_role" "glue_service_role" {
  name               = "glue-service-role-${var.short_region_name}-${var.environment}"
  assume_role_policy = data.aws_iam_policy_document.glue_policy_document.json
}

resource "aws_iam_role_policy_attachment" "glue_service_role_policy_attachment" {
  role       = aws_iam_role.glue_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_iam_role_policy" "glue_service_role_policy" {
  name   = "glue-service-role-policy-${var.short_region_name}-${var.environment}"
  policy = data.aws_iam_policy_document.s3_policy_document.json
  role   = aws_iam_role.glue_service_role.id
}

resource "aws_glue_job" "blogpost_job" {
  name              = "iptiq-job-${var.short_region_name}-${var.environment}"
  role_arn          = aws_iam_role.glue_service_role.arn
  glue_version      = "3.0"
  number_of_workers = 2
  worker_type       = "G.1X"
  max_retries       = "1"
  timeout           = 2880
  command {
    name            = "glueetl"
    script_location = "s3://${var.job_file}"
  }
  default_arguments = {
    "--enable-auto-scaling"              = "true"
    "--enable-continuous-cloudwatch-log" = "true"
  }
}
