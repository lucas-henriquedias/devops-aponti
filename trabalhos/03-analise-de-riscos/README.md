# Análise de Riscos na Integração de Sistemas Legados — Caso FinanceTech

Atividade acadêmica da disciplina de DevOps (Turma 5 — Aponti FAP), com foco em análise de riscos de segurança na integração entre um sistema legado e aplicações modernas, incluindo identificação, classificação, mitigação e recomendações no formato de consultoria DevSecOps.

## 📌 Sobre o cenário

A empresa fictícia **FinanceTech** possui um sistema com mais de 25 anos, responsável pelo controle de contas de clientes. Com o lançamento de um novo aplicativo móvel, esse sistema legado precisa ser integrado à internet — apesar de apresentar diversas fragilidades típicas de sistemas legados:

- Protocolo de comunicação sem criptografia
- Ausência de atualizações de segurança há vários anos
- Autenticação limitada a usuário e senha (sem MFA)
- Logs incompletos (apenas data e hora)
- Nenhum monitoramento em tempo real
- Exposição via APIs públicas
- Inexistência de plano de contingência

O objetivo do trabalho foi avaliar os riscos dessa integração e propor estratégias de mitigação com base nos conceitos de segurança e DevSecOps estudados em aula.

## 🧩 Estrutura do documento

| Parte | Conteúdo | Responsável |
|---|---|---|
| 1 | Identificação dos Riscos | Lucas |
| 2 | Classificação do Risco (Probabilidade × Impacto) | Lucas |
| 3 | Estratégias de Mitigação | Otávio |
| 4 | Workflow Seguro (ordem de implementação) | Otávio |
| 5 | Estudo de Caso — publicação sem Gateway/Wrapper | Pedro |
| 6 | Consultoria DevSecOps (priorização de recomendações) | Pedro |
| 7 | Conclusão individual de cada integrante | Todos |

## 🔑 Principais decisões técnicas

**Classificação de risco (Parte 2):** riscos que atuam como vetores diretos de ataque (sistema sem patches, comunicação insegura, autenticação fraca, APIs expostas, ausência de monitoramento) foram classificados como **Críticos**, por combinarem alta probabilidade de exploração com alto impacto. Já riscos que atuam como amplificadores de dano — e não como ponto de entrada de um ataque — (logs incompletos, falta de contingência) foram classificados como **Altos**, com probabilidade reduzida a Média, já que só se tornam problema depois que outro risco se materializa.

**Workflow seguro (Parte 4):** a ordem escolhida — Avaliar → Definir Contingência → Isolar Rede → Wrapper Seguro → Monitorar — parte do princípio de que nenhuma intervenção em infraestrutura de produção (isolamento, wrapper) deveria ocorrer sem um plano de reversão/recuperação já definido, priorizando a segurança da própria mudança antes de alterá-la.

**Consultoria DevSecOps (Parte 6):** aqui a lógica é diferente da Parte 4 — a priorização segue o **benefício de segurança por esforço investido**, e não a ordem técnica de implementação, o que explica por que Wrapper/Gateway aparece em 1º lugar (maior redução de risco imediata) enquanto o isolamento de rede aparece em 4º.

## 🛠️ Conceitos aplicados

- **Tríade CIA** (Confidencialidade, Integridade, Disponibilidade)
- **Não-repúdio** e observabilidade via logs
- **EOL (End of Life)** — riscos de sistemas sem suporte do fabricante
- **Superfície de ataque** e exposição via APIs públicas
- **Zero Trust**, **API Gateway** e **Wrapper Seguro** como camadas de proteção para sistemas legados
- **RTO/RPO** e planos de continuidade de negócio (BCP/DRP)

## 👥 Equipe e metodologia

- **Lucas Henrique Dias de Medeiros** — Partes 1 e 2; Conclusão individual
- **Otavio Sousa Leão de Barros** — Partes 3 e 4; Conclusão individual
- **Pedro Henrique Gomes de Lima** — Partes 5 e 6; Conclusão individual; revisão geral, estruturação e formatação final

A divisão de tarefas foi organizada de forma colaborativa via discussões e enquetes, com blocos lógicos escolhidos por cada integrante. A conclusão pessoal (Parte 7) foi mantida como etapa individual obrigatória para todos.

## 📄 Entregável

Documento final em PDF: `AnaliseRiscos_IntegracaoLegados-grupoA-turma5-Aponti.pdf`

---

*Trabalho acadêmico produzido para fins de avaliação e debate em sala — Aponti FAP, Turma 5 (DevOps), Julho/2026.*
