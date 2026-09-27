# Retorna a URL completa de acesso ao bucket via GCP
output "bucket_url" {
  description = "URL do bucket de armazenamento gerado no GCP"
  value       = google_storage_bucket.bucket_gcp.url
}

# Retorna o ID do projeto GCP ativo consultado via data.tf
output "projeto_gcp_id" {
  description = "ID do projeto GCP em execução"
  value       = data.google_client_config.gcp_atual.project
}

