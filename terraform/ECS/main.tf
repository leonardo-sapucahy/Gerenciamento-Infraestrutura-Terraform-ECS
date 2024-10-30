############CREATING A ECS CLUSTER#############

data "aws_iam_role" "ecs_task_execution_role"{
  name = "ecsTaskExecutionRole"
}

resource "aws_ecs_cluster" "cluster" {
  name = "coloque aqui o nome do cluster"
}

resource "aws_ecs_task_definition" "teste-dev" {
  family                   = "teste-dev"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "teste-dev",
      "image"     : "11111111111.dkr.ecr.us-east-1.amazonaws.com/teste/teste:latestdev",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "teste-dev" {
  name             = "teste-dev"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.teste-dev.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-teste-1a.id,
      aws_subnet.privatesubnet-teste-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "teste-qa" {
  family                   = "teste-qa"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "custodia-qa",
      "image"     : "11111111111111.dkr.ecr.us-east-1.amazonaws.com/teste/teste:latestqa",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "teste-qa" {
  name             = "teste-qa"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.teste-qa.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-teste-1a.id,
      aws_subnet.privatesubnet-teste-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "teste-hml" {
  family                   = "teste-hml"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "custodia-hml",
      "image"     : "1111111111111.dkr.ecr.us-east-1.amazonaws.com/teste/teste:latesthml",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "teste-hml" {
  name             = "teste-hml"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.teste-hml.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-teste-1a.id,
      aws_subnet.privatesubnet-teste-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}


resource "aws_ecs_task_definition" "teste1-dev" {
  family                   = "teste1-dev"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "teste1-dev",
      "image"     : "111111111111.dkr.ecr.us-east-1.amazonaws.com/teste1:latestdev",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "teste1-dev" {
  name             = "teste1-dev"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.teste1-dev.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-teste1-1a.id,
      aws_subnet.privatesubnet-teste1-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "teste1-qa" {
  family                   = "teste1-qa"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "teste1-qa",
      "image"     : "111111111111.dkr.ecr.us-east-1.amazonaws.com/teste1:latestqa",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "teste1-qa" {
  name             = "teste1-qa"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.teste1-qa.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-teste1-1a.id,
      aws_subnet.privatesubnet-teste1-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "teste1-hml" {
  family                   = "teste1-hml"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "teste1-hml",
      "image"     : "11111111111.dkr.ecr.us-east-1.amazonaws.com/teste1:latesthml",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "teste1-hml" {
  name             = "teste1-hml"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.teste1-hml.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-teste1-1a.id,
      aws_subnet.privatesubnet-teste1-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "teste2-dev" {
  family                   = "teste2-dev"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "teste2-dev",
      "image"     : "11111111111.dkr.ecr.us-east-1.amazonaws.com/teste2:latestdev",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "teste2-dev" {
  name             = "teste2-dev"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.teste2-dev.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-teste2-1a.id,
      aws_subnet.privatesubnet-teste2-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "teste2-qa" {
  family                   = "teste2-qa"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "teste2-qa",
      "image"     : "11111111111.dkr.ecr.us-east-1.amazonaws.com/teste2:latestqa",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "teste2-qa" {
  name             = "teste2-qa"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.teste2-qa.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-teste2-1a.id,
      aws_subnet.privatesubnet-teste2-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "teste2-hml" {
  family                   = "teste2-hml"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "teste2-hml",
      "image"     : "1111111111.dkr.ecr.us-east-1.amazonaws.com/teste2:latesthml",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}


resource "aws_ecs_service" "teste2-hml" {
  name             = "teste2-hml"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.teste2-hml.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-teste2-1a.id,
      aws_subnet.privatesubnet-teste2-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "teste3-dev" {
  family                   = "teste3-dev"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "teste3-dev",
      "image"     : "111111111111.dkr.ecr.us-east-1.amazonaws.com/teste3:latestdev",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}


resource "aws_ecs_service" "teste3-dev" {
  name             = "teste3-dev"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.teste3-dev.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-teste3-1a.id,
      aws_subnet.privatesubnet-teste3-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "teste3-qa" {
  family                   = "teste3-qa"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "teste3-qa",
      "image"     : "1111111111.dkr.ecr.us-east-1.amazonaws.com/teste3:latestqa",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "teste3-qa" {
  name             = "teste3-qa"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.teste3-qa.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-teste3-1a.id,
      aws_subnet.privatesubnet-teste3-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "teste3-hml" {
  family                   = "teste3-hml"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "teste3-hml",
      "image"     : "11111111111.dkr.ecr.us-east-1.amazonaws.com/teste3:latesthml",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "teste3-hml" {
  name             = "teste3-hml"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.teste3-hml.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-teste3-1a.id,
      aws_subnet.privatesubnet-teste3-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}
