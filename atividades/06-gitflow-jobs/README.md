 # Pipeline CI/CD — JOBS (GitHub Actions)

Atividade sobre a utilização dos **JOBS** do GitHub Actions aplicados a **Continuous Integration (CI)** e **Continuous Delivery (CD)**, desenvolvida em sala.

O arquivo `pipeline-jobs-ci-cd.yaml` contém a pipeline construída em sala, comentada linha a linha (utilidade de cada bloco, regras de sintaxe YAML como indentação e `chave: valor`), acrescida de outros jobs pesquisados na documentação oficial e no GitHub Marketplace.

## 🔔 Gatilhos (`on`)

| Gatilho | Quando dispara |
|---|---|
| `push` | Em `main`, `developer` e branches `feature/**` |
| `pull_request` | Em `main`, `developer` e branches `feature/**` |
| `workflow_dispatch` | Manualmente, pelo botão "Run workflow" |
| `schedule` | Toda segunda-feira às 03:00 UTC (usado pelo job de issues inativas) |

## ⚙️ Jobs

### Jobs construídos em sala

| Job | Função |
|---|---|
| `build-e-testes` | Instala dependências e roda os testes, em matriz (Node 18/20/22) |
| `lint` | Verifica o padrão de estilo do código |
| `analise-seguranca` | Análise estática de vulnerabilidades com CodeQL |
| `build-docker` | Gera e publica a imagem Docker no GitHub Container Registry (só em push na `main`) |
| `deploy` | Publica a aplicação no ambiente `producao` |
| `notificar-equipe` | Notifica o Slack com o resultado final da pipeline (sempre roda, via `if: always()`) |

### Jobs adicionados (pesquisa na doc/Marketplace)

| Job | Action usada | Função |
|---|---|---|
| `dependency-review` | `actions/dependency-review-action` | Bloqueia PRs que introduzem dependências vulneráveis ou com licença não permitida |
| `cobertura-codigo` | `codecov/codecov-action` | Publica o relatório de cobertura de testes no Codecov |
| `publicar-release` | `softprops/action-gh-release` | Cria uma Release no GitHub com notas geradas automaticamente após o deploy |
| `gerenciar-issues-inativas` | `actions/stale` | Marca e fecha issues/PRs sem atividade recente (rodagem agendada) |

## 🔗 Ordem de execução (`needs`)

```
build-e-testes ──┬─→ build-docker ─→ deploy ─→ publicar-release ─┐
lint ─────────────┤                                              │
dependency-review ┘                                              │
                                                                   ▼
build-e-testes ─→ cobertura-codigo                        notificar-equipe
analise-seguranca ─────────────────────────────────────────────────┘
```

`build-docker` só roda após `build-e-testes`, `lint` e `dependency-review` passarem. `deploy` depende de `build-docker`. `publicar-release` depende de `deploy`. `notificar-equipe` depende de todos os jobs e sempre executa, para avisar tanto sucesso quanto falha.

## 📁 Estrutura

```
pipeline-jobs-ci-cd/
└── pipeline-jobs-ci-cd.yaml
```