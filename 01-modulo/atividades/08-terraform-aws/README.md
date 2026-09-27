# Atividade: Provisionamento Automatizado na AWS com Terraform

Este repositório contém os arquivos desenvolvidos para a aula prática de **Infraestrutura como Código (IaC)**, utilizando a ferramenta **Terraform** para o provisionamento automatizado de um serviço na **Amazon Web Services (AWS)** (Amazon S3 Bucket).

---

## 📂 Estrutura do Projeto

* **`main.tf`**: Arquivo principal contendo a configuração do provedor AWS e a declaração do recurso S3.
* **`variables.tf`**: Definição das variáveis de entrada (como região da AWS, nome do bucket e ambiente).
* **`outputs.tf`**: Exibição dos dados do recurso criado (ID e ARN) ao finalizar a execução.
* **`.gitignore`**: Arquivo de configuração para evitar o envio de arquivos temporários, arquivos de estado (`.tfstate`) e dados sensíveis ao GitHub.
* **`README.md`**: Documentação explicativa do projeto e processo de execução.

---

## 🔑 Processo de Conexão com a Cloud (AWS)

Para realizar a autenticação e permitir que o Terraform gerencie recursos na conta da AWS, o seguinte procedimento foi adotado:

1. **Geração das Credenciais**: Obtenção da *Access Key ID* e *Secret Access Key* através do painel de gerenciamento de acessos da AWS (IAM ou ambiente do AWS Academy/Learner Lab).
2. **Configuração via AWS CLI**: Instalação e execução da ferramenta de linha de comando da AWS no terminal local:
   ```bash
   aws configure
   ```
3. **Inserção dos Dados**:
   * **AWS Access Key ID**: `SUA_ACCESS_KEY`
   * **AWS Secret Access Key**: `SUA_SECRET_KEY`
   * **Default region name**: `us-east-1`
   * **Default output format**: `json`

Com isso, o Terraform utiliza as credenciais armazenadas localmente no sistema de forma segura, sem a necessidade de expor senhas ou chaves dentro dos arquivos `.tf`.

---

## 💻 Comandos Utilizados no Terminal

Durante o ciclo de desenvolvimento do projeto, os seguintes comandos do Terraform foram utilizados:

1. **`terraform init`**: Inicializa o diretório de trabalho e baixa o provedor da AWS (`hashicorp/aws`).
2. **`terraform validate`**: Checa se a sintaxe de todos os arquivos `.tf` está correta.
3. **`terraform plan`**: Faz uma simulação e mostra no terminal os recursos que serão criados antes de efetivar.
4. **`terraform apply`**: Executa o provisionamento real dos recursos dentro da infraestrutura da AWS.
5. **`terraform destroy`**: Remove todos os recursos criados para evitar custos indesejados.

---

## 🧠 Anotações do que foi Aprendido em Aula

* **Conceito de IaC (Infraestrutura como Código)**: A importância de declarar e versionar a infraestrutura através de código em vez de criar recursos manualmente pelo console web.
* **Provedores (Providers)**: Entendimento do papel do *Provider* como ponte de comunicação entre o Terraform e as APIs do provedor de nuvem (AWS).
* **Arquivos de Estado (`.tfstate`)**: Aprendizado sobre como o Terraform mapeia os recursos reais existentes na nuvem e o motivo pelo qual este arquivo **não deve** ser subido para o repositório por questões de segurança.
* **Boas Práticas e Organização**: Separação do código em múltiplos arquivos (`main.tf`, `variables.tf`, `outputs.tf`) para manter a legibilidade e reuso de código.
