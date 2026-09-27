# Configuração dos provedores necessários no Terraform
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

# Configuração do provedor da Google Cloud Platform (GCP)
provider "google" {
  project = var.project_id
  region  = var.region
}

# Criação do Bucket de Armazenamento (Cloud Storage)
resource "google_storage_bucket" "bucket_gcp" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true            # Permite deletar o bucket pelo Terraform mesmo com arquivos dentro

  # Configuração de rótulos (labels) para organização de custos e recursos
  labels = {
    ambiente   = var.ambiente
    criado_por = "lucas_henrique"
  }
}


