resource "aws_codedeploy_app" "terraform_ecs" {
  compute_platform = "ECS"
  name             = "default"
}

resource "aws_codedeploy_deployment_group" "terraform_ecs_workhall" {
  app_name               = aws_codedeploy_app.terraform_ecs.workhall
  deployment_config_name = "CodeDeployDefault.ECSAllAtOnce"
  deployment_group_name  = "terraform_ecs_workhall"
  service_role_arn       = arn:aws:iam::077286633283:role/aws-code-deploy-terraform

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout = "CONTINUE_DEPLOYMENT"
    }

    terminate_blue_instances_on_deployment_success {
      action                           = "TERMINATE"
      termination_wait_time_in_minutes = 5
    }
  }

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  ecs_service {
    cluster_name = arn:aws:ecs:ap-south-1:077286633283:cluster/default
    service_name = terraform_ecs
  }

network_configuration {
    assign_public_ip = "true"
    security_groups  = ["sg-113ea674"]
    subnets          = ["subnet-2fd9ae63", "subnet-39080951"]
  }

  platform_version    = "LATEST"
  scheduling_strategy = "REPLICA"

  load_balancer_info {
    target_group_pair_info {
      prod_traffic_route {
        listener_arns = [arn:aws:elasticloadbalancing:ap-south-1:077286633283:loadbalancer/app/my-lbs/c7d3c194fbdc5839]
      }

      target_group {
        name = rule1.blue.name
      }

      target_group {
        name = rule2.green.name
      }
    }
  }
}
