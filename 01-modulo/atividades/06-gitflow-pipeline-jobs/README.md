# CI/CD com GitHub Actions — Jobs

Pipeline desenvolvida em sala para a disciplina de Integração e Entrega
Contínua (CI/CD), com foco no bloco de **jobs** do GitHub Actions.

## 🎯 Objetivo
Demonstrar os jobs mais usados e úteis atualmente em pipelines reais de
CI/CD, desde build/teste básico até segurança, empacotamento em Docker,
deploy condicional e notificação da equipe.

## ⚙️ Jobs utilizados
| Job | Função |
|---|---|
| `build-e-testes` | Instala dependências e roda testes, com `strategy.matrix` para múltiplas versões do Node.js |
| `lint` | Analisa o padrão/estilo do código |
| `analise-seguranca` | Usa o **CodeQL** para detectar vulnerabilidades (DevSecOps) |
| `build-docker` | Builda e publica uma imagem Docker no GitHub Container Registry |
| `deploy` | Publica a aplicação em produção, usando `environment` para aprovação/secrets |
| `notificar-equipe` | Notifica a equipe no Slack ao final da pipeline (`if: always()`) |

## 📦 Actions do GitHub Marketplace usadas
`actions/checkout`, `actions/setup-node`, `github/codeql-action`,
`docker/login-action`, `docker/build-push-action`,
`slackapi/slack-github-action`.

📖 Pesquisa baseada em: [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions) e no [GitHub Marketplace](https://github.com/marketplace?type=actions).

## 🧠 Aprendizados
- Por padrão, todos os jobs de uma pipeline rodam **em paralelo**;
  `needs` cria dependência (execução sequencial) entre eles.
- `strategy.matrix` evita duplicar o mesmo job só pra variar um
  parâmetro (ex: versão de linguagem/SO).
- `if` condiciona a execução de um job (branch, evento, resultado de
  jobs anteriores); `if: always()` é o padrão para jobs de notificação.
- `permissions` segue o princípio do menor privilégio: cada job só deve
  ter acesso ao que realmente precisa.
- `environment` adiciona aprovação manual, secrets exclusivos e
  histórico de deploys a jobs de CD.

## 📄 Arquivo
- [`pipeline-jobs-ci-cd.yaml`](./pipeline-jobs-ci-cd.yaml)

## 🛠 Como usar
Copie o arquivo `.yaml` para a pasta `.github/workflows/` do repositório
onde a pipeline será executada.