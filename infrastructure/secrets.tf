resource "aws_secretsmanager_secret" "neon_oltp" {
  name        = "${var.project_name}/${var.environment}/neon-oltp"
  description = "Connection credentials for Neon retail OLTP"

  recovery_window_in_days = 7
}

resource "aws_secretsmanager_secret" "neon_dw" {
  name        = "${var.project_name}/${var.environment}/neon-dw"
  description = "Connection credentials for Neon Data Warehouse"

  recovery_window_in_days = 7
}
