# Configuração básica do Terraform e exigência do provedor da AWS
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Define o provedor e puxa a região do arquivo de variáveis
provider "aws" {
  region = var.regiao_aws
}

# Serve para criar um Bucket S3 — o serviço de armazenamento de arquivos da AWS.
resource "aws_s3_bucket" "bucket_teste" {
  bucket = var.nome_do_bucket

  # As tags ajudam a organizar os recursos dentro do painel da AWS
  tags = {
    Projeto  = "Pratica AWS Terraform"
    Ambiente = var.ambiente
  }
}









