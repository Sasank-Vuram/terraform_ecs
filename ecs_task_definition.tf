 resource "aws_ecs_task_definition" "tfer--task-002D-definition-002F-terraform_ecs-002D-task" {
  container_definitions    = "[{\"cpu\":1024,\"environment\":[{\"name\":\"AWS_REGION\",\"value\":\"ap-south-1\"},\"portMappings\":[{\"containerPort\":7001,\"hostPort\":8001,\"protocol\":\"tcp\"}],\"volumesFrom\":[]}]"
  cpu                      = "1024"
  execution_role_arn       = "arn:aws:iam::077286633283:role/ecsTaskExecutionRole"
  family                   = "terraform_ecs-task"
  memory                   = "2048"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  tags = {
    project = "terraform_ecs"
  }

  task_role_arn = "arn:aws:ecs:ap-south-1:077286633283:cluster/default/terraform_ecs"
}
