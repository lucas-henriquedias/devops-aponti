# Atividade: Provisionamento Automatizado na GCP com Terraform

**Aluno:** Lucas Henrique  
**Projeto:** Infraestrutura como Código (IaC) com Google Cloud Storage (GCP)  

Este repositório contém o código desenvolvido para a prática de **Infraestrutura como Código (IaC)** utilizando **Terraform** para provisionar recursos no **Google Cloud Platform (GCP)**.

---

## 📂 Estrutura do Projeto

* **`main.tf`**: Configuração do provedor GCP (`google`) e criação do recurso `google_storage_bucket`.
* **`data.tf`**: Consultas de informações existentes na GCP (`google_compute_zones` e `google_client_config`).
* **`variables.tf`**: Declaração de variáveis de entrada (`project_id`, `region`, `bucket_name`, etc).
* **`terraform.tfvars`**: Definição dos valores das variáveis locais (protegido contra commits sensíveis).
* **`outputs.tf`**: Exibição da URL do bucket e ID do projeto ao final da execução.
* **`.gitignore`**: Proteção contra envio de arquivos de estado (`.tfstate`), cache e variáveis sensíveis ao Git.
* **`README.md`**: Guia de documentação e aprendizado.

---

## 🔑 Processo de Conexão com a Cloud (Google Cloud Platform)

Conforme a documentação oficial da HashiCorp/GCP, a autenticação ocorre através dos seguintes passos:

1. **Criação do Projeto**: Acesso ao console da GCP e obtenção do `PROJECT_ID`.
2. **Conta de Serviço (Service Account)**: Criação de uma Service Account no IAM com papel de *Storage Admin*.
3. **Chave JSON**: Download da chave em formato `.json` fornecida pelo Google Cloud Console.
4. **Variável de Ambiente**: Configuração da variável de ambiente no terminal para apontar para o arquivo baixado:
   ```bash
   export GOOGLE_APPLICATION_CREDENTIALS="caminho/para/chave-sua-conta.json"

(Nota: A execução foi simulada com base nas documentações oficiais).

## 💻 Comandos Utilizados

1. **`terraform init`**: Baixa o provedor `hashicorp/google` e prepara o ambiente local.
2. **`terraform validate`**: Valida a sintaxe dos arquivos `.tf`.
3. **`terraform plan`**: Simula o provisionamento do bucket no GCP.
4. **`terraform apply`**: Cria o recurso na GCP.
5. **`terraform destroy`**: Remove os recursos criados para liberar cota.

---

## 🧠 Anotações e Aprendizados

* **Diferença entre Provedores**: O GCP utiliza estruturas como `google_storage_bucket` em vez de `aws_s3_bucket`, com rótulos (`labels`) no lugar de `tags`.
* **Uso de Data Sources (`data.tf`)**: Permite consultar infraestruturas e configurações pré-existentes na nuvem sem precisar recriá-las.
* **Uso de `terraform.tfvars`**: Facilita a reutilização de código mantendo os arquivos `.tf` genéricos e isolando as variáveis específicas do ambiente num arquivo separado.

