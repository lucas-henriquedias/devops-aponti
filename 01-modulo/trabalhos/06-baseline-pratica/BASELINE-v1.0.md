# Baseline v1.0 – Sistema de Pedidos

## 1. Identificação

- **Baseline:** v1.0.
- **Sistema:** Sistema de Pedidos.
- **Data de criação:** 14 de agosto de 2026.
- **Responsável pela aprovação:** Equipe de Garantia de Qualidade.
- **Status:** Aprovada e vigente (estado oficial de referência do sistema).

## 2. Objetivo

Esta baseline tem como objetivo congelar e formalizar o **primeiro estado estável e testado** do Sistema de Pedidos, servindo como ponto de referência único para três finalidades práticas:

1. **Desenvolvimento** — qualquer nova funcionalidade parte deste estado conhecido, evitando ambiguidade sobre "qual versão está rodando".
2. **Operações** — em caso de incidente, a equipe de infraestrutura sabe exatamente qual deveria ser a configuração do ambiente e pode comparar com o estado real (detecção de drift).
3. **Auditoria** — permite provar, a qualquer momento, o que foi aprovado, quando, e por quem, criando rastreabilidade formal do sistema.

É importante reforçar: a baseline **não é o número "v1.0"**. Ela é o conjunto de Itens de Configuração abaixo, tomados em conjunto. Alterar qualquer um deles sem passar por controle de mudanças invalida a baseline, mesmo que o rótulo "v1.0" continue sendo usado informalmente.

## 3. Itens de Configuração (ICs) e justificativa

| Categoria | Configuração | Por que é um IC crítico |
|-----------|--------------|--------------------------|
| **Sistema** | Sistema de Pedidos — Versão 1.0 | É o identificador macro que amarra todos os demais ICs a um mesmo contexto de negócio/release. |
| **Aplicação** | Node.js 22; Express 5.1; Porta 3000 | O runtime e o framework definem compatibilidade de dependências e comportamento da API. Mudar a versão do Node, por exemplo, pode alterar comportamento de bibliotecas nativas sem que o código-fonte mude. |
| **Banco de Dados** | MySQL 8.4; Banco: pedidos; Porta 3306 | O motor e a versão do banco afetam sintaxe SQL suportada, planos de execução e desempenho. É o IC mais sensível a mudanças não controladas, como visto no Desafio 2. |
| **Infraestrutura** | Ubuntu Server 24.04; 4 GB RAM; 2 vCPUs | Define a capacidade computacional disponível. Alterações aqui (ex.: reduzir RAM) podem causar degradação de desempenho sem qualquer mudança de código ou aplicação. |
| **Código** | Branch: main; Commit: abc123 | É o único IC que garante que o comportamento funcional do sistema é reprodutível — o mesmo commit deve gerar o mesmo comportamento em qualquer ambiente. |

## 4. Critérios de validação que embasaram a aprovação

A configuração acima só foi aceita como baseline após:

- Execução da suíte de testes de integração da aplicação contra o MySQL 8.4, sem falhas.
- Verificação de que a aplicação inicializa corretamente na porta 3000 sob Node.js 22 / Express 5.1.
- Checagem de que a infraestrutura (Ubuntu 24.04, 4 GB RAM, 2 vCPUs) suporta a carga esperada em ambiente de homologação.
- Confirmação de que o commit "abc123" na branch main corresponde exatamente ao artefato testado, sem qualquer alteração posterior não commitada.

## 5. Escopo e governança

- Esta baseline cobre **apenas** os cinco ICs listados na seção 3. Configurações fora desse escopo não fazem parte da baseline formal, ainda que devam ser documentadas separadamente.
- Qualquer divergência entre o estado real do ambiente e os valores desta tabela representa **Configuration Drift** e deve ser tratada como incidente, não como "ajuste de rotina".
- Toda alteração em qualquer um dos ICs acima — planejada ou emergencial — deve seguir o processo formal de controle de mudanças (RFC) antes de ser aplicada em produção.
- Uma mudança aprovada e implementada não altera esta baseline retroativamente: ela gera uma **nova baseline** (ex.: v1.1), preservando este documento como registro histórico imutável do estado v1.0.
