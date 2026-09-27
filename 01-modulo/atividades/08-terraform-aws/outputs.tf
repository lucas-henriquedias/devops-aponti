# Quando o Terraform terminar, ele vai imprimir o nome do Bucket criado
output "nome_do_bucket_criado" {
  description = "O ID (nome) do bucket S3 gerado"
  value       = aws_s3_bucket.bucket_teste.id
}

# Vai imprimir o ARN — Identificador global do recurso da AWS.
output "arn_do_bucket" {
  description = "O ARN do bucket S3 na AWS"
  value       = aws_s3_bucket.bucket_teste.arn
}


