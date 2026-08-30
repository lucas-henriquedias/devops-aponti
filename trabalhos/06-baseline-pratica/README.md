# Atividade – Gerência de Configuração e Automação (DevOps)

*Repositório:* aponti-FAP-grupo6-pratica-baseline  
*Projeto:* Sistema de Pedidos  
*Integrantes:* Emanuel de Andrade Gondim Junior, Lucas Henrique Dias de Medeiros, Nayara Karla Medeiros da Silva e Rafael Albuquerque dos Santos

---

## 1. Histórico da Evolução da Configuração

1. *v1.0* – Baseline inicial aprovada contendo a configuração oficial do Sistema de Pedidos (Node.js 22, Express 5.1, MySQL 8.4, Ubuntu 24.04, Commit abc123).
2. *RFC-001* – Abertura e formalização da solicitação de mudança para atualizar o MySQL de 8.4 para 9.0 devido a problemas de desempenho.
3. *Alteração do MySQL* – Implementação da atualização em ambiente controlado, seguindo o plano de execução aprovado.
4. *Testes* – Bateria de testes de integração e validação das consultas SQL executada com sucesso.
5. *Aprovação* – Validação formal e aceite da mudança pela equipe técnica/arquitetura.
6. *v1.1* – Publicação da nova baseline formalizando o MySQL 9.0 como o novo estado oficial do sistema.

---

## 2. Respostas – Desafio 2 (Mudança não autorizada)

1. *A baseline foi alterada? Por quê?*  
   Não. O documento da baseline permaneceu inalterado. O que ocorreu foi uma modificação direta no ambiente real sem autorização, fazendo com que o servidor divergisse da documentação oficial (Configuration Drift). Portanto, a baseline deixou de representar o estado oficial.
2. *Qual Item de Configuração (IC) foi modificado?*  
   O IC de *Banco de Dados* (versão do MySQL, que passou de 8.4 para 9.0).
3. *Essa alteração deveria ter sido realizada diretamente em produção?*  
   Não. Nenhuma alteração deve ser feita diretamente em produção sem planejamento, testes prévios e aprovação formal.
4. *Qual processo deveria ter sido executado antes da alteração?*  
   O processo formal de *Gerência de Mudanças (RFC)*, seguindo o fluxo: *Solicitar → Avaliar impacto → Aprovar/Rejeitar → Implementar/Testar → Verificar/Encerrar.
5. *O que deve acontecer com a baseline após uma mudança aprovada?*  
   A baseline deve ser atualizada para uma nova versão (v1.1) refletindo as novas configurações oficiais, enquanto a v1.0 é mantida no histórico para rastreabilidade.

---

## 3. Desafio 5 – Configuration Drift

### Análise das Situações

| Situação | É mudança controlada? | Está na baseline? |
| :--- | :--- | :--- |
| *Desenvolvedor altera o código e realiza um novo commit.* | *Não* (a menos que passe por PR/RFC) | *Não* (as baselines v1.0 e v1.1 apontam para o commit abc123) |
| *Administrador altera manualmente uma configuração em produção.* | *Não* | *Não* (ação não autorizada / desvio) |
| *Mudança aprovada e documentada gera a baseline v1.1.* | *Sim* | *Sim* (é o estado oficial registrado) |

### O que acontece se o servidor for alterado manualmente após a v1.1?
Ocorre o *Configuration Drift* (Deriva de Configuração). O ambiente real de produção deixa de corresponder ao estado documentado e homologado, o que compromete a rastreabilidade, dificulta o diagnóstico de erros (troubleshooting) e impede automações ou recuperações rápidas em caso de falhas (disaster recovery).

---

## 4. Pergunta Final – Importância da Baseline para DevOps

A baseline estabelece uma referência oficial, estável e auditável para o sistema, garantindo alinhamento entre desenvolvimento, testes e operações. Sem o controle de configuração, alterações não documentadas geram divergências entre ambientes, aumentam o risco de falhas em produção, complicam a identificação de causas raízes e impossibilitam o rollback seguro.