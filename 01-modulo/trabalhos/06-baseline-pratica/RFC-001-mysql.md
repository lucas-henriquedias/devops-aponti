# Solicitação de Mudança – RFC-001

- *IC afetado:* Banco de Dados MySQL
- *Versão atual:* 8.4
- *Versão proposta:* 9.0
- *Motivo da mudança:* O MySQL 8.4 apresenta problemas de desempenho em consultas complexas, impactando o tempo de resposta do Sistema de Pedidos.
- *Riscos:* Possível incompatibilidade de sintaxe SQL; necessidade de ajustes em consultas ou configurações; risco de indisponibilidade durante a atualização.
- *Impacto na aplicação:* Algumas consultas podem apresentar erros se não forem compatíveis com a nova versão. A aplicação precisa ser testada exaustivamente com MySQL 9.0.
- *Ambientes afetados:* Produção (e, se aplicável, homologação/desenvolvimento).
- *Testes necessários:*
  - Executar toda a suíte de testes de integração com MySQL 9.0.
  - Validar manualmente as consultas críticas.
  - Testar desempenho e estabilidade em ambiente de homologação.
- *Plano de implementação:*
  1. Fazer backup completo do banco de dados.
  2. Atualizar o ambiente de homologação para MySQL 9.0 e executar os testes.
  3. Agendar janela de manutenção em produção.
  4. Executar a atualização em produção, monitorando logs e métricas.
  5. Verificar o funcionamento da aplicação e das consultas.
- *Plano de rollback:* Restaurar o backup e reverter para MySQL 8.4, caso ocorram erros críticos.
- *Responsável:* Administrador de Banco de Dados – Carlos Souza
- *Aprovação:* (preenchido após análise) – Aprovado em 14/08/2026 pela equipe de arquitetura.


*Fluxo seguido:* Solicitar → Avaliar impacto → Aprovar → Implementar/Testar → Verificar/Encerrar.
