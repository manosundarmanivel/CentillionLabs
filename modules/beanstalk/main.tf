resource "aws_elastic_beanstalk_application" "myelasticapp" {
  name = var.elb_name
  description = "My App"
}

resource "aws_elastic_beanstalk_environment" "elbappenv" {
  name = var.elb_env
  application = aws_elastic_beanstalk_application.myelasticapp.name
  solution_stack_name = var.solution_stack_name
  tier = var.tier

  setting {
    namespace = "aws:ec2:vpc"
    name = "VPCID"
    value = var.vpc_id
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name = "AssociatePublicIpAddress"
    value = "True"
  }

  setting {
    namespace  = "aws:ec2:vpc"
    name       = "Subnets"
    value      = var.pub_subnet_id
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "MatcherHTTPCode"
    value     = "200"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.medium"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "internet facing"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = 1
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = 2
  }
  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = "enhanced"
  }
}