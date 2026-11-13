resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/${var.project_name}-${var.environment}"
  retention_in_days = 7

  tags = {
    Name        = "${var.project_name}-log-group"
    Environment = var.environment
  }
}

resource "aws_ecs_task_definition" "main" {
  family                   = "${var.project_name}-${var.environment}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.container_cpu
  memory                   = var.container_memory
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([{
    name      = "${var.project_name}-container"
    image     = "${aws_ecr_repository.app.repository_url}:latest"
    essential = true
    portMappings = [{
      containerPort = var.container_port
      hostPort      = var.container_port
      protocol      = "tcp"
    }]

    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = aws_cloudwatch_log_group.ecs.name
        "awslogs-region"        = var.aws_region
        "awslogs-stream-prefix" = "ecs"
      }
    }

    environment = [
      {
        name  = "ENVIRONMENT"
        value = var.environment
      }
    ]
  }])

  tags = {
    Name        = "${var.project_name}-task-def"
    Environment = var.environment
  }
}
