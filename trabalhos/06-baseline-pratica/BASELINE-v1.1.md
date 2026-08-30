# Baseline v1.1 – Sistema de Pedidos

## 1. Identificação

Baseline: v1.1.

Sistema: Sistema de Pedidos.

Data de criação: 16 de agosto de 2026.

Responsável pela aprovação: Equipe de Garantia de Qualidade.

Baseline anterior: v1.0, de 14 de agosto de 2026 (preservada como registro histórico
imutável).

Mudança que originou esta baseline: RFC-001 – Atualização do MySQL 8.4 para MySQL 9.0,
aprovada, implementada e verificada.

Status: Aprovada e vigente (estado oficial de referência do sistema, em substituição à
v1.0).

## 2. Objetivo

Esta baseline formaliza o segundo estado estável e testado do Sistema de Pedidos,
resultante da primeira mudança controlada aplicada ao sistema. Ela cumpre as mesmas três
finalidades da v1.0 — servir de ponto de partida para desenvolvimento, de referência para
operações e de evidência para auditoria — mas acrescenta uma quarta, que só existe a
partir da segunda baseline: demonstrar a evolução rastreável da configuração.

A partir desta data, comparar o ambiente real com a v1.0 passa a ser incorreto: a v1.0
continua válida como registro do que estava aprovado entre 14 e 16 de agosto de 2026, mas
deixa de ser o parâmetro de conformidade. Qualquer verificação de drift deve usar os
valores da seção 4 deste documento.

Vale reforçar o mesmo princípio registrado na v1.0: a baseline não é o rótulo "v1.1". Ela
é o conjunto de Itens de Configuração descrito abaixo, tomado em conjunto e aprovado em
bloco. A mudança de um único IC — mesmo que os outros quatro permaneçam corretos — já
coloca o sistema fora da baseline.

## 3. Rastreabilidade da mudança

O caminho percorrido entre a v1.0 e a v1.1 é o que dá validade formal a este documento.
Sem ele, esta baseline seria apenas um registro do que aconteceu com o ambiente, e não do
que foi autorizado a acontecer.

| Data       | Etapa                          | Registro                    |
| ---------- | ------------------------------ | --------------------------- |
| 14/08/2026 | Baseline anterior aprovada     | BASELINE-v1.0.md            |
| 15/08/2026 | Incidente: alteração manual    | README (Desafio 2)          |
| 15/08/2026 | Solicitação formal de mudança  | RFC-001-mysql.md            |
| 15/08/2026 | Avaliação de impacto e riscos  | RFC-001-mysql.md            |
| 15/08/2026 | Aprovação da mudança           | RFC-001-mysql.md            |
| 16/08/2026 | Implementação (dev → produção) | RFC-001-mysql.md            |
| 16/08/2026 | Testes e validação             | Seção 5 deste documento     |
| 16/08/2026 | Verificação e encerramento     | RFC-001-mysql.md            |
| 16/08/2026 | Publicação da nova baseline    | Este documento              |

Observação importante: o incidente de 15/08 não é a origem desta baseline. A atualização
feita diretamente em produção foi uma mudança não controlada e, por si só, jamais geraria
uma baseline — ela apenas produziu Configuration Drift. A baseline v1.1 nasce da RFC-001,
que formalizou, avaliou, aprovou e testou aquela mesma alteração pelo caminho correto.

## 4. Itens de Configuração (ICs)

| Categoria       | Configuração aprovada (v1.1)             | Situação vs. v1.0        |
| --------------- | ---------------------------------------- | ------------------------ |
| Sistema         | Sistema de Pedidos — Versão 1.1          | Alterado (1.0 → 1.1)     |
| Aplicação       | Node.js 22; Express 5.1; Porta 3000      | Inalterado               |
| Banco de Dados  | MySQL 9.0; Banco: pedidos; Porta 3306    | Alterado (8.4 → 9.0)     |
| Infraestrutura  | Ubuntu Server 24.04; 4 GB RAM; 2 vCPUs   | Inalterado               |
| Código          | Branch: main; Commit: def456             | Alterado (abc123 → def456) |

Resumo da mudança: dos cinco ICs da baseline, dois foram alterados por decorrência direta
da RFC-001 (Banco de Dados e Código), um foi incrementado como consequência formal do novo
estado aprovado (Sistema) e dois permaneceram idênticos à v1.0 (Aplicação e
Infraestrutura).

### 4.1. Por que cada item é um IC crítico

**Sistema — Sistema de Pedidos, Versão 1.1.** É o identificador macro do release. O
incremento de versão é o que amarra os demais ICs a este novo contexto aprovado e evita
que dois estados distintos do sistema circulem sob o mesmo nome.

**Aplicação — Node.js 22, Express 5.1, porta 3000.** Runtime e framework permanecem os
mesmos, o que reduz o risco da mudança: qualquer erro observado após o upgrade pode ser
atribuído ao banco, e não à camada de aplicação.

**Banco de Dados — MySQL 9.0, banco pedidos, porta 3306.** É o IC objeto da RFC-001. A
troca do motor altera sintaxe SQL suportada, planos de execução e desempenho — exatamente
o motivo pelo qual a mudança exigiu aprovação formal e bateria completa de testes antes de
chegar à produção. O nome do banco e a porta foram mantidos justamente para limitar a
superfície da mudança a um único fator.

**Infraestrutura — Ubuntu Server 24.04, 4 GB RAM, 2 vCPUs.** Capacidade computacional
mantida deliberadamente. Alterar hardware e banco na mesma janela impediria isolar a causa
de uma eventual variação de desempenho.

**Código — branch main, commit def456.** Garante a reprodutibilidade do comportamento
funcional. O novo commit contém o ajuste do driver MySQL e das consultas afetadas pelos
recursos depreciados no 9.0 — ou seja, o código precisou acompanhar a mudança de banco
para que o sistema voltasse a operar corretamente.

## 5. Critérios de validação que embasaram a aprovação

A configuração acima só foi aceita como baseline após:

Execução da verificação de compatibilidade pré-upgrade, confirmando quais objetos e
sintaxes seriam afetados pelos recursos depreciados no MySQL 9.0.

Backup completo do banco pedidos executado antes da janela de manutenção, com restauração
testada em ambiente separado — condição estabelecida na aprovação da RFC-001.

Conferência da integridade dos dados após a migração, por contagem de registros e
comparação de checksums das tabelas antes e depois do upgrade.

Execução da suíte de testes de integração da aplicação contra o MySQL 9.0, sem falhas,
incluindo especificamente as consultas que haviam apresentado erro durante a alteração não
autorizada de 15/08.

Execução da suíte de regressão completa, garantindo que o ajuste feito nas consultas não
introduziu efeito colateral em outras funcionalidades.

Verificação de que a aplicação continua inicializando corretamente na porta 3000 sob
Node.js 22 / Express 5.1 e conectando ao banco na porta 3306.

Comparação das métricas de desempenho das consultas críticas antes e depois da mudança,
confirmando a melhoria que motivou a RFC-001 — critério sem o qual a mudança teria sido
revertida, ainda que funcionasse.

Confirmação de que o commit def456 na branch main corresponde exatamente ao artefato
testado, sem qualquer alteração posterior não commitada.

## 6. Escopo e governança

Esta baseline cobre apenas os cinco ICs listados na seção 4, mantendo o mesmo escopo
definido na v1.0. Ampliar ou reduzir o escopo da baseline é, em si, uma mudança que
exigiria RFC própria.

A baseline v1.0 não foi editada nem substituída em conteúdo: ela permanece arquivada como
registro histórico imutável do estado aprovado entre 14 e 16 de agosto de 2026. Uma
baseline nunca é corrigida retroativamente — ela é sucedida.

A partir da publicação deste documento, qualquer divergência entre o estado real do
ambiente e os valores da seção 4 representa Configuration Drift e deve ser tratada como
incidente. Isso vale inclusive para um eventual retorno ao MySQL 8.4 feito manualmente:
reverter sem RFC é tão descontrolado quanto atualizar sem RFC.

Toda alteração em qualquer um dos ICs acima — planejada ou emergencial — continua sujeita
ao fluxo formal de controle de mudanças: solicitar, avaliar impacto, aprovar ou rejeitar,
implementar e testar, verificar e encerrar.

A próxima mudança aprovada e implementada gerará a baseline v1.2, preservando este
documento como registro histórico do estado v1.1.

---

Documento elaborado por Rafael Albuquerque — Grupo 6.

Atividade Prática – Baseline | Gerência de Configuração e Controle de Mudanças |
DevOps – Turma 5.
