# 🛠️ Atividade 02 - Estudo de Caso DevOps

> **Curso:** DevOps - Aponti  
> **Professor:** Carlos  
> **Aluno:** Lucas Henrique Dias de Medeiros

---

## 📖 Sobre

O objetivo desta atividade é analisar problemas comuns encontrados em empresas
de desenvolvimento de software e propor soluções utilizando os princípios da cultura
DevOps, simulando que você é um consultor de DevOps. Para cada problema, responda às
perguntas abaixo:

- Qual é o principal problema?
- Quais são as possíveis causas?
- Como a cultura DevOps pode ajudar?
- Qual prática, ferramenta ou conceito DevOps poderia ser aplicado?
- Quais benefícios essa solução traria para a empresa?

---  

## 🚀 Problema 1 – Deploy Manual

### Cenário

Toda sexta-feira a equipe de infraestrutura precisa acessar manualmente os servidores para copiar os arquivos da nova versão do sistema. O processo leva cerca de duas horas e frequentemente ocorrem erros, exigindo correções emergenciais.

- 🔎 **Problema identificado**: Deploys manuais, processo lento (cerca de 2 horas) e propenso a falhas, sendo necessário reuniões de correção.
- ⚠️ **Possíveis causas**: Falta de automação dos processos, dependendo de pessoas para trabalhos repetitivos, e a falta de padronização dos passos de publicação.
- ✅ **Como o DevOps resolveria**: Automatizando todo o processo de entrega, eliminando etapas manuais repetitivas e reduzindo os possíveis erros humanos, permitindo deploys mais frequentes e confiáveis.
- 🛠️ **Ferramenta ou prática aplicada**: CI/CD (Jenkins, GitLab CI, GitHub Actions) com pipelines de deploy automatizado.
- 🎯 **Benefícios esperados**:Redução do tempo de deploy, menos erros e menor estresse da equipe às sextas-feiras.

---

## 🤝 Problema 2 – Falta de Comunicação

### Cenário

Os desenvolvedores concluem novas funcionalidades, porém não avisam a equipe de infraestrutura sobre mudanças necessárias no ambiente. Quando a aplicação é publicada, diversos serviços deixam de funcionar.

- 🔎 **Problema identificado**: Falta de comunicação entre Desenvolvimento e Infraestrutura, causando falhas na produção.
- ⚠️ **Possíveis causas**: As equipes trabalham de forma isolada e não se comunicam sobre os processos.
- ✅ **Como o DevOps resolveria**: Promovendo a colaboração entre Dev e Ops como um time único, com responsabilidade compartilhada pelo ciclo de vida da aplicação.
- 🛠️ **Ferramenta ou prática aplicada**: Reuniões conjuntas, documentação compartilhada e checklists de deploy conjuntos.
- 🎯 **Benefícios esperados**: Menos incidentes na produção e aplicações de novos serviços, entregas mais previsíveis e maior confiança entre equipes.

---

## 🔀 Problema 3 – Integração de Código

### Cenário

Cinco desenvolvedores trabalham no mesmo projeto. Cada um mantém alterações locais durante vários dias antes de enviar para o repositório. Quando finalmente fazem a integração, surgem inúmeros conflitos.

- 🔎 **Problema identificado**: Conflitos no código devido a falta de commits, comunicação e organização da equipe.
- ⚠️ **Possíveis causas**: Os Devs trabalham isoladamente por longos períodos sem sincronizar com o repositório principal.
- ✅ **Como o DevOps resolveria**: Aplicando Integração Contínua (CI), incentivando commits pequenos e frequentes.
- 🛠️ **Ferramenta ou prática aplicada**: Envio de códigos com mais frequência, utilização de repositório compartilhado com Git (Github e GitLab) e a implementação de CI, com testes automáticos.
- 🎯 **Benefícios esperados**:Menos conflitos, detecção precoce de problemas, integração mais rápida e previsível.

---

## ✅ Problema 4 – Testes Manuais

### Cenário

Antes de publicar uma nova versão, um funcionário precisa realizar dezenas de testes manualmente. Além de demorado, alguns erros passam despercebidos.

- 🔎 **Problema identificado**: Testes manuais demorados e sujeitos a falhas não detectadas.
- ⚠️ **Possíveis causas**: Falta de automação sobre os testes das aplicações, sendo dependente de trabalho manual.
- ✅ **Como o DevOps resolveria**: Implementando testes automatizados dentro do pipeline de CI/CD, garantindo qualidade contínua.
- 🛠️ **Ferramenta ou prática aplicada**: Frameworks de testes automatizados (Selenium, JUnit, Cypress, Jest) , executando testes a cada build.
- 🎯 **Benefícios esperados**: Mais rapidez e maior qualidade de testes, menos bugs em produção, liberação de tempo da equipe para tarefas estratégicas.

---

## 🖥️ Problema 5 – Ambiente Diferente

### Cenário

O sistema funciona perfeitamente no computador do desenvolvedor. Ao chegar no servidor de produção, diversos erros aparecem devido às diferenças de configuração.

- 🔎 Problema identificado: Inconsistência entre ambiente de desenvolvimento e produção.
- ⚠️ Possíveis causas: Falta de padronização de ambientes; dependências e configurações diferentes entre máquinas.
- ✅ Como o DevOps resolveria: Usando containerização e infraestrutura como código para garantir ambientes idênticos em todas as etapas.
- 🛠️ Ferramenta ou prática aplicada: Docker (containers), Kubernetes (orquestração), Terraform/Ansible (IaC).
- 🎯 Benefícios esperados: Eliminação de erros de ambiente, maior previsibilidade, facilidade de escalar e replicar ambientes.

---

## 🎯 Desafio Final

### Problema escolhido

**Problema 1 – Deploy Manual**

#### 🔴 Fluxo tradicional (Antes do DevOps)

```text
Cliente -> Desenvolvimento -> Testes Manuais -> Deploy Manual -> Produção
```

---

#### 🟢 Fluxo utilizando DevOps

```text
Cliente -> Planejamento -> Desenvolvimento -> Commit no Git -> CI (Build + Testes Automatizados) -> CD (Deploy Automatizado) -> Produção -> Monitoramento -> Feedback Contínuo
```

#### 🏛️ Pilares CAMS utilizados

| Pilar | Aplicação |
|--------|-----------|
| 🤝 **Culture** | Colaboração entre Desenvolvimento e Operações. |
| ⚙️ **Automation** | Automação de testes, builds e deploys através de pipelines CI/CD. |
| 📊 **Measurement** | Monitoramento da aplicação e coleta de métricas para avaliação do ambiente. |
| 📤 **Sharing** | Compartilhamento contínuo de conhecimento, documentação e feedback entre as equipes. |

---

### 💡 Conclusão

A cultura DevOps busca integrar pessoas, processos e tecnologias para tornar o desenvolvimento de software mais colaborativo, automatizado e eficiente. A aplicação de práticas como CI/CD, testes automatizados, containerização e Infraestrutura como Código reduz falhas, acelera entregas e aumenta a confiabilidade das aplicações, proporcionando benefícios tanto para as equipes quanto para o negócio.
