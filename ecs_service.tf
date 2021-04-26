resource "aws_ecs_service" "tfer--terraform_ecs_terraform_ecs-002D-service" {
  cluster = "default"

  deployment_circuit_breaker {
    enable   = "false"
    rollback = "false"
  }

  deployment_controller {
    type = "ECS"
  }

  deployment_maximum_percent         = "200"
  deployment_minimum_healthy_percent = "100"
  desired_count                      = "1"
  enable_ecs_managed_tags            = "false"
  enable_execute_command             = "false"
  health_check_grace_period_seconds  = "0"
  launch_type                        = "FARGATE"
  name                               = "terraform_ecs-service"

  network_configuration {
    assign_public_ip = "true"
    security_groups  = ["sg-113ea674"]
    subnets          = ["subnet-2fd9ae63", "subnet-39080951"]
  }

  platform_version    = "LATEST"
  scheduling_strategy = "REPLICA"

  tags = {
    project = "newecs"
  }

  task_definition = "arn:aws:ecs:ap-south-1:077286633283:task-definition/terraform_ecs-task:162"
}
