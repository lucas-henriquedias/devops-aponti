# Define a região onde o recurso vai rodar fisicamente
variable "regiao_aws" {
  description = "Região da AWS escolhida para o projeto"
  type        = string
  default     = "us-east-1" # Norte da Virgínia
}

# Define o nome do bucket S3
variable "nome_do_bucket" {
  description = "Nome único do bucket S3"
  type        = string
  default     = "atividade-aws-terraform-lucashenrique" 
}

# Define o ambiente em que o recurso será implantado
variable "ambiente" {
  description = "Ambiente de execução do projeto"
  type        = string
  default     = "Desenvolvimento"
}