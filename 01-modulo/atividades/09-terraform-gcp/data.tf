# Busca informações sobre a zona de computação ativa no GCP.
data "google_compute_zones" "zonas_disponiveis" {
  region = var.region
  status = "UP"
}

# Puxa informações do projeto GCP configurado.
data "google_client_config" "gcp_atual" {}

