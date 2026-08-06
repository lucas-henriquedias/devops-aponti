# CI/CD com GitHub Actions — Gatilhos (Git Flow)

Pipeline desenvolvida para uma atividade de Integração e Entrega
Contínua (CI/CD), com foco no bloco de **gatilhos (`on`)** do GitHub
Actions, aplicados ao contexto do **Git Flow**.

## 🎯 Objetivo
Demonstrar como o padrão de nomenclatura de branches do Git Flow
(`main`, `developer`, `feature/*`) é usado para escopar os gatilhos de
CI/CD, garantindo que a pipeline reaja apenas ao que interessa em cada
etapa do fluxo — e como isso se relaciona com boas práticas de commits e
branches na automação.

## ⚡ Gatilhos utilizados
| Gatilho | Uso |
|---|---|
| `push` | Dispara em commits nas branches `main`, `developer` e `feature/**` |
| `pull_request` | Dispara ao abrir/atualizar/reabrir PRs contra essas branches |
| `workflow_dispatch` | Permite disparo manual da pipeline, com input de ambiente |
| `schedule` | Executa em horário agendado (cron), útil para builds noturnos |
| `release` | Dispara quando uma release é publicada (Continuous Delivery) |

## 🔎 Outros gatilhos pesquisados (não incluídos na pipeline)
`issues`, `issue_comment`, `create`/`delete`, `fork`, `check_run`/`check_suite`,
`deployment_status`, `repository_dispatch`, `workflow_call`.

📖 Pesquisa baseada em: [Events that trigger workflows — GitHub Docs](https://docs.github.com/actions/using-workflows/events-that-trigger-workflows)

## 🧠 Aprendizados
- YAML é sensível à indentação (espaços, nunca tab).
- Padrões de nomenclatura de branch permitem escopar gatilhos de forma
  previsível, usando `branches` com suporte a wildcards (`feature/**`).
- Múltiplos gatilhos podem coexistir no mesmo bloco `on`.
- `workflow_dispatch` aceita `inputs`, permitindo parametrizar execuções
  manuais.

## 📄 Arquivo
- [`pipeline-gitflow-ci-cd.yaml`](./pipeline-gitflow-ci-cd.yaml)

## 🛠 Como usar
Copie o arquivo `.yaml` para a pasta `.github/workflows/` do repositório
onde a pipeline será executada.