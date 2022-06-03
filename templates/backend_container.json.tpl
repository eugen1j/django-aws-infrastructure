[
  {
    "name": "${name}",
    "image": "${image}",
    "essential": true,
    "links": [],
    "portMappings": [
      {
        "containerPort": 8000,
        "hostPort": 8000,
        "protocol": "tcp"
      }
    ],
    "command": ${jsonencode(command)},
    "environment": [
      {
        "name": "DATABASE_URL",
        "value": "postgresql://${rds_username}:${rds_password}@${rds_hostname}:5432/${rds_db_name}"
      },
      {
        "name": "SECRET_KEY",
        "value": "${secret_key}"
      },
      {
        "name": "DEBUG",
        "value": "off"
      },
      {
        "name": "ALLOWED_HOSTS",
        "value": "${domain}"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${log_group}",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "${log_stream}"
      }
    }
  }
]