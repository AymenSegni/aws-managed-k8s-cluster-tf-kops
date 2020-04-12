// DB Subnet Group
resource "aws_db_subnet_group" "postgresql" {
  name       = "postgres-main"
  subnet_ids = aws_subnet.private.*.id

  tags = {
    Name = "Postgres"
  }
}

// RDS Subnet
resource "aws_subnet" "private" {
  vpc_id            = var.vpc_id
  cidr_block        = var.rds_cidr
  availability_zone = var.rds_az

  tags = {
    Description = "RDS Private Subnet"
    Terraform   = "True"
  }
}

// RDS Security Group

resource "aws_security_group" "rds-postgres" {
  name        = "main_rds_sg"
  description = "Allow all inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "TCP"
    cidr_blocks = [var.rds_cidr_blocks]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Description = "RDS Security Group"
    Terraform   = "True"
  }
}

resource "aws_db_instance" "postgresql" {
  allocated_storage          = "10"
  engine                     = "postgres"
  engine_version             = "10.6"
  identifier                 = "krypton-db"
  instance_class             = "db.t2.micro"
  storage_type               = "gp2"
  name                       = "krypton"
  password                   = var.db_pass
  username                   = "root"
  backup_retention_period    = "5"
  backup_window              = "02:00-04:30"
  maintenance_window         = "sun:00:30-sun:01:30"
  auto_minor_version_upgrade = true

  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds-postgres.id]
  db_subnet_group_name   = aws_db_subnet_group.postgresql.name
  parameter_group_name   = "default.postgres10"
  storage_encrypted      = false

  tags = {
    Name = "Postgres"
  }
}

