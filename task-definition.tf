data "aws_ecs_task_definition" "nginx" {
  task_definition = "${aws_ecs_task_definition.nginx.family}"
}

resource "aws_ecs_task_definition" "nginx" {
    family                = "hello_world"
    container_definitions = <<DEFINITION
[
  {
    "name": "nginx",
     "image": "721834156908.dkr.ecr.us-east-1.amazonaws.com/demo:%BUILD_NUMBER%",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "memory": 500,
    "cpu": 10
  }
]
DEFINITION
}
