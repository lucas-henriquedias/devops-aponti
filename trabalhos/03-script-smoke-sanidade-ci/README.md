# 🧪 Testes Automatizados com Node.js

Projeto desenvolvido durante a **Aponti Academy 2026 – Turma 5 de DevOps**, com o objetivo de aplicar conceitos de **Testes Automatizados**, **QA** e **estratégias de testes** em um projeto colaborativo.

A atividade teve como foco a criação de uma suíte de testes automatizados para validar o funcionamento do script `scripts/gerar-readme.js`, responsável pelo processamento dos dados dos alunos e pela geração das informações apresentadas no `README.md`.

## 🎯 Objetivo

Desenvolver testes automatizados capazes de verificar diferentes comportamentos do sistema, garantindo que funcionalidades existentes continuem funcionando corretamente e preparando a suíte para uma futura integração com uma **pipeline de CI/CD**.

Durante a análise do projeto, foram identificados **13 comportamentos esperados**, relacionados a:

* Leitura e validação dos arquivos `.json`;
* Tratamento de arquivos inválidos ou incompletos;
* Remoção de usuários do GitHub duplicados;
* Ordenação dos alunos por nome;
* Tratamento de campos opcionais;
* Geração da tabela de alunos;
* Atualização das estatísticas e do `README.md`.

## 🛠️ Tecnologias utilizadas

* **JavaScript**
* **Node.js**
* **Node.js Test Runner (`node:test`)**
* **Node.js Assert (`node:assert`)**
* **Git / GitHub**
* **Visual Studio Code**

Os testes foram implementados utilizando o **Node.js Test Runner**, uma ferramenta nativa do Node.js, sem a necessidade de dependências externas.

## 📁 Estrutura do projeto

```text
projeto/
├── alunos/
├── scripts/
│   └── gerar-readme.js
├── tests/
│   └── gerar-readme.test.js
├── README.md
└── package.json
```

A estrutura separa o código responsável pela aplicação dos arquivos de teste, facilitando a manutenção e uma futura integração com ferramentas de CI/CD.

## 🧪 Casos de teste

Foram definidos **13 casos de teste**, cobrindo diferentes cenários do sistema:

| ID  | Cenário                      | Resultado esperado                      |
| --- | ---------------------------- | --------------------------------------- |
| T01 | Pasta `alunos` existente     | Script executa normalmente              |
| T02 | Pasta `alunos` inexistente   | Erro é tratado corretamente             |
| T03 | JSON válido                  | Aluno é incluído na tabela              |
| T04 | Nome ausente                 | Registro é ignorado                     |
| T05 | GitHub ausente               | Registro é ignorado                     |
| T06 | Arquivo que não é JSON       | Arquivo é ignorado                      |
| T07 | JSON inválido                | Erro é tratado e execução continua      |
| T08 | GitHub duplicado             | Apenas um registro é mantido            |
| T09 | Alunos fora de ordem         | Registros são ordenados alfabeticamente |
| T10 | LinkedIn ausente             | Coluna exibe `-`                        |
| T11 | Cidade ausente               | Coluna exibe `-`                        |
| T12 | Atualização do README        | Tabela, total e data são atualizados    |
| T13 | Atualização das estatísticas | Total corresponde aos registros válidos |

Os casos foram definidos a partir da análise dos comportamentos esperados do script.

## 🔬 Estratégias de teste

A suíte foi organizada utilizando três estratégias principais:

### 🔥 Smoke Test

**T01 – Pasta `alunos` existente**

Verifica se o sistema consegue acessar a pasta e iniciar o processamento dos arquivos sem apresentar erros.

### 🩺 Teste de Sanidade

**T09 – Ordenação alfabética**

Verifica especificamente se os alunos continuam sendo ordenados corretamente pelo campo `nome`.

### 🔄 Testes de Regressão

Foram utilizados os testes **T02 a T08 e T10 a T13**, verificando se alterações no código não comprometem funcionalidades que já estavam funcionando, como validação dos arquivos, tratamento de erros, remoção de duplicidades e geração do README.

## ⚙️ Execução

Para executar a suíte de testes localmente, utilize:

```bash
node --test
```

Os testes seguem o fluxo:

```text
ENTRADA
   ↓
PROCESSAMENTO
   ↓
RESULTADO ESPERADO
   ↓
ASSERT
```

Os dados de entrada são preparados, a função correspondente é executada e o resultado obtido é comparado com o resultado esperado utilizando `node:assert`.

## 📊 Resultados

A suíte foi executada localmente e apresentou os seguintes resultados:

```text
8 testes executados
8 aprovados
0 reprovados
Tempo de execução: aproximadamente 366 ms
```

Todos os testes foram aprovados com sucesso.

> **Observação:** durante a execução, uma mensagem de erro relacionada a um JSON inválido foi exibida no terminal. Esse comportamento era esperado, pois fazia parte do caso **T07**, que verifica justamente se o sistema consegue tratar um JSON inválido sem interromper a execução dos demais testes.

## 📚 Principais aprendizados

Durante a atividade, foram trabalhados conceitos relacionados a:

* Criação e organização de testes automatizados;
* Identificação de comportamentos esperados;
* Elaboração de casos de teste;
* Testes Smoke, Sanidade e Regressão;
* Validação de entradas e tratamento de erros;
* Uso do `node:test` e `node:assert`;
* Organização de uma suíte de testes;
* Execução de testes pelo terminal;
* Preparação de testes para integração com **CI/CD**;
* Trabalho colaborativo utilizando Git e GitHub.

## 👥 Trabalho em equipe

A atividade foi desenvolvida em grupo, com responsabilidades distribuídas entre análise de QA, automação de testes, estratégia de testes, infraestrutura e documentação.

Minha participação esteve relacionada à **implementação dos testes automatizados em JavaScript/Node.js**, seguindo a lógica:

**Entrada → Processamento → Resultado Esperado**.

## 🚀 Próximos passos

Como evolução do projeto, a suíte de testes pode ser integrada a uma **pipeline de CI/CD**, permitindo que os testes sejam executados automaticamente a cada novo Pull Request ou alteração no projeto. Essa foi definida como uma das próximas etapas da atividade.

---

### 👨‍💻 Autor

**Lucas Henrique Dias de Medeiros**

Projeto desenvolvido durante a **Aponti Academy 2026 – Turma 5 de DevOps**.
