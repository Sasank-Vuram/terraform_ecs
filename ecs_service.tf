resource "aws_ecs_service" "tfer--pog_connector_middleware_pog_connector_middleware-002D-service" {
  cluster = "pog_connector_middleware"

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
  name                               = "pog_connector_middleware-service"

  network_configuration {
    assign_public_ip = "true"
    security_groups  = ["sg-48b6a92d"]
    subnets          = ["subnet-cd6e9194", "subnet-35ad7142"]
  }

  platform_version    = "LATEST"
  scheduling_strategy = "REPLICA"

  tags = {
    project = "newecs"
  }

  task_definition = "arn:aws:ecs:us-east-1:167934968472:task-definition/pog_connector_middleware-task:162"
}
