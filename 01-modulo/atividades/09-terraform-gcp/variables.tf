# Variável para o ID do Projeto na GCP
variable "project_id" {
  description = "ID do projeto cadastrado no Google Cloud Console"
  type        = string
}

# Variável para a região da GCP
variable "region" {
  description = "Região principal do GCP para implantação dos recursos"
  type        = string
  default     = "us-central1"
}

# Variável para o nome único do Bucket (deve ser único globalmente na GCP)
variable "bucket_name" {
  description = "Nome único global do Cloud Storage Bucket"
  type        = string
}

# Variável de ambiente do sistema
variable "ambiente" {
  description = "Ambiente de implantação da aplicação"
  type        = string
  default     = "desenvolvimento"
}

