output "jukes_key_id" {
  value = aws_kms_key.jukes_kms_key.id
}

output "key_arn" {
  value = aws_kms_key.jukes_kms_key.arn
}