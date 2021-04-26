resource "aws_ecs_cluster" "default" {
  name = "default"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  tags = {
    env     = "dev"
    project = "terraform_ecs"
  }
}
