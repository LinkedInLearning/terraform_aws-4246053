resource "aws_db_instance" "database" {
  allocated_storage   = 5
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  username            = var.username
  password            = var.password
  skip_final_snapshot = true
}
