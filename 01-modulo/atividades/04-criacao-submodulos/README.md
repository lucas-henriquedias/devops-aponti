# Atividade — Aula 9: Bibliotecas em Python e Git Submodules

## Sobre a atividade

Esta atividade tinha três etapas: criar uma biblioteca própria e publicá-la no GitHub, disponibilizá-la para a turma, e depois escolher a biblioteca de um colega para consumir dentro de um mini app de terminal, usando `git submodule` — a forma padrão do Git de incluir um repositório dentro de outro sem copiar o código manualmente.

## Etapa 1 — Biblioteca própria: `shameful-commits`

Minha biblioteca é a **`shameful-commits`**: uma lib boba/de humor em Python que gera mensagens de commit "vergonhosas" (mas plausíveis) para disfarçar correções de erros bobos, sem precisar declarar o erro real no histórico do Git.

- **Função principal:** `gerar_commit()`, em `shameful_commits.py`, que combina aleatoriamente um prefixo (`fix:`, `hotfix:`, `refactor:`, `debug:`, `workaround:`, `chore:`) com uma situação de uma lista de erros clássicos de quem programa em Python (indentação, `ImportError`, `print()` esquecido, loop infinito etc.), usando o módulo `random` da biblioteca padrão.
- **Publicação:** repositório próprio no GitHub, com README explicando instalação (via `git submodule add`) e uso.
- **README da biblioteca:** já documenta como adicioná-la como submódulo, como importar (`sys.path.append` + `import shameful_commits`) e um exemplo de uso.

## Etapa 2 — Compartilhamento com a turma

A biblioteca `shameful-commits` foi disponibilizada no grupo da turma para que outros colegas pudessem consumi-la da mesma forma que eu consumi a de um colega na Etapa 3.

## Etapa 3 — Mini app consumindo a biblioteca de um colega

Para essa etapa, escolhi a biblioteca **`Texto_magico`**, desenvolvida pelo colega Pedro Henrique, e construí em cima dela o **`texto-magico-cli`**: um app de terminal simples com um menu para inverter texto ou "gritar" um texto (deixar em maiúsculas com exclamações).

- **Biblioteca consumida:** `libs/texto_magico/`, trazida via:
  ```bash
  git submodule add https://github.com/ph95583faculdade-maker/Texto_magico.git libs/texto_magico
  ```
  Ela expõe duas funções em `operacoes.py`: `inverter_texto()` e `gritar_texto()`.
- **App consumidor:** `main.py`, na raiz do projeto, que adiciona `libs/texto_magico` ao `sys.path` e importa as funções direto de `operacoes`, exibindo um menu em loop (`1` inverter, `2` gritar, `0` sair).
- **Como rodar (clonando o projeto com o submódulo junto):**
  ```bash
  git clone --recurse-submodules https://github.com/lucas-henriquedias/texto-magico-cli.git
  cd texto-magico-cli
  py main.py
  ```
  Caso o repositório já tenha sido clonado sem a flag `--recurse-submodules`, o submódulo é buscado depois com:
  ```bash
  git submodule update --init --recursive
  ```

## Estrutura do projeto entregue

```
texto-magico-cli/
├── main.py                     # app de terminal (consumidor)
├── README.md                   # como clonar/rodar o mini app
└── libs/
    └── texto_magico/           # submódulo git da biblioteca do colega
        ├── operacoes.py
        └── README.md           # documentação da biblioteca consumida

shameful-commits/                # biblioteca própria, repositório separado
├── shameful_commits.py
└── README.md
```

## Conclusão

A atividade deixou clara a diferença entre **criar** uma biblioteca (pensando em uma API simples e documentada o suficiente para outra pessoa usar sem precisar ler o código-fonte) e **consumir** a biblioteca de outra pessoa via `git submodule` — que mantém o histórico e a autoria da lib intactos no repositório de origem, ao mesmo tempo em que a torna parte do projeto que a utiliza, algo que uma simples cópia de arquivos não conseguiria.
