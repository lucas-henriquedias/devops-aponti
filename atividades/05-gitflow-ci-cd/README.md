# Atividade — Git Flow aplicado a CI/CD com GitHub Actions

## Sobre a atividade

Esta atividade, desenvolvida em sala, teve como objetivo demonstrar na prática por que o **padrão de nomenclatura de branches e commits** é importante na hora de construir automações de **Continuous Integration (CI)** e **Continuous Delivery (CD)**.

Para isso, construímos uma pipeline no GitHub Actions (`pipeline-gitflow.yaml`) focada no bloco `on`, que é o responsável por definir **quando** a pipeline dispara. A ideia central é que, seguindo o modelo **Git Flow**, cada branch tem um papel bem definido — e a pipeline reage de forma diferente dependendo de qual branch (ou tipo de evento) originou a mudança:

| Branch | Papel no Git Flow |
|---|---|
| `main` | Produção — código estável e já testado |
| `developer` | Integração — onde as features se juntam antes de ir para produção |
| `feature/**` | Branches de trabalho individuais dos desenvolvedores |

Sem esse padrão de nomenclatura, seria impossível para a pipeline "saber" automaticamente se um push é uma mudança de produção, uma integração ou apenas um trabalho em andamento — e é exatamente esse reconhecimento automático que o `on` do GitHub Actions torna possível, filtrando por nome de branch (`branches:`) e por padrões com curinga (`feature/**`).

## Gatilhos implementados na pipeline

- **`push`** — dispara a cada commit enviado para `main`, `developer` ou `feature/**`, rodando testes automaticamente a cada mudança de código.
- **`pull_request`** (`opened`, `synchronize`, `reopened`) — valida o código de um PR *antes* dele ser mergeado em `main`/`developer`, evitando que código quebrado avance no fluxo.
- **`workflow_dispatch`** — permite disparar a pipeline manualmente, com um input para escolher o ambiente de deploy (`homologacao` ou `producao`).
- **`schedule`** — roda a pipeline automaticamente de segunda a sexta, às 03h (UTC), útil para builds noturnos e verificações periódicas.
- **`release`** — dispara quando uma release é publicada, marcando o momento de gerar artefatos da versão oficial do software.

## Pesquisa adicional (documentação do GitHub Actions)

Além dos gatilhos construídos em sala, pesquisei na [documentação oficial](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows) outros eventos que fazem sentido dentro do próprio tema da atividade — o ciclo de vida das branches do Git Flow — e escolhi dois:

- **`create`** — dispara quando alguém cria uma branch ou tag no repositório. No Git Flow, é o momento em que nascem branches como `release/*` ou `hotfix/*`, então dá pra usar esse gatilho para avisar a equipe automaticamente assim que uma dessas branches é criada.
- **`delete`** — dispara quando uma branch ou tag é apagada. Fecha o ciclo: quando uma `feature/*` é finalizada e apagada após o merge, esse gatilho permite automatizar uma limpeza (por exemplo, derrubar um ambiente de preview daquela feature).

Uma descoberta importante da pesquisa: diferente de `push` e `pull_request`, os eventos `create` e `delete` **não aceitam filtro de branch/tag diretamente no `on:`** — essa é uma limitação documentada da própria plataforma. Por isso, para reaproveitar o padrão de nomenclatura do Git Flow com esses gatilhos, o filtro por nome (`release/*`, `hotfix/*`, `feature/*`) precisa ser feito **dentro do job**, usando uma condição `if:` com os contexts `github.ref_name` e `github.ref_type`.

## Conclusão

A atividade deixou claro que um bom padrão de nomenclatura de branches não é só uma questão de organização — ele é o que permite que a pipeline tome decisões automáticas (o que testar, quando notificar, quando limpar recursos) sem intervenção manual. Quanto mais consistente o padrão do Git Flow é seguido pela equipe, mais confiável e previsível a automação se torna.

O arquivo com a pipeline completa e comentada está em `pipeline-gitflow.yaml`.