# Portal Web

Projeto utilizado nas aulas de GitHub Actions, com o objetivo de implementar pipelines de CI/CD (Integração e Entrega Contínua) para um site institucional simples.

## 📋 Sobre o projeto

O **Portal Web** é um site estático composto por páginas HTML, estilos CSS e scripts JavaScript, além de scripts Node.js auxiliares para automação de tarefas (build, geração de sitemap, geração de relatórios e estatísticas).

Este repositório foi escolhido pelo grupo dentro da atividade de pipelines, que consistia em implementar workflows do GitHub Actions para automatizar tarefas de integração contínua, manutenção e geração de artefatos.

## 🗂️ Estrutura do projeto

```
portal-web/
├── index.html
├── cursos.html
├── contato.html
├── css/
│   ├── style.css
│   └── responsive.css
├── js/
│   ├── main.js
│   └── menu.js
├── scripts/
│   ├── compactar.js          # gera dist/site.zip
│   ├── gerar-sitemap.js       # gera sitemap.xml
│   ├── gerar-relatorio.js     # gera reports/relatorio.html
│   └── gerar-estatisticas.js  # gera reports/estatisticas.json
├── assets/
│   ├── banner.jpg
│   └── logo.png
├── eslint.config.js
├── package.json
└── README.md
```

## ⚙️ Instalação

```bash
npm install
```

## 🚀 Scripts disponíveis

| Comando | Descrição |
|---|---|
| `npm run lint` | Executa o ESLint sobre a pasta `js/` |
| `npm run format` | Verifica a formatação do projeto com o Prettier |
| `npm run build` | Executa `scripts/compactar.js`, gerando `dist/site.zip` |
| `npm run sitemap` | Executa `scripts/gerar-sitemap.js`, gerando `sitemap.xml` |
| `npm run stats` | Executa `scripts/gerar-estatisticas.js`, gerando `reports/estatisticas.json` |

## 🔄 Pipelines (GitHub Actions)

O projeto conta com 4 workflows, implementados na pasta `.github/workflows/`:

### 1️⃣ CI — Integração Contínua
Disparada em `push` e `pull_request`. Responsável por validar a qualidade do código a cada alteração.

- `actions/checkout`
- `actions/setup-node`
- Cache de dependências do npm
- `npm install`
- `npm run lint` (ESLint)
- `npm run format` (Prettier)
- `npm run build`

### 2️⃣ Atualização automática do Sitemap
Disparada diariamente às **23h** (`cron`). Mantém o `sitemap.xml` sempre atualizado.

- Executa `scripts/gerar-sitemap.js`
- Adiciona, commita e faz push das alterações automaticamente no repositório

### 3️⃣ Triagem automática de Issues
Disparada ao abrir uma **Issue**. Facilita a organização e o direcionamento das demandas.

- Adiciona a label `documentation`
- Atribui automaticamente um responsável pela Issue

### 4️⃣ Geração manual de relatório
Disparada manualmente via `workflow_dispatch`. Usada para gerar relatórios sob demanda.

- Executa `scripts/gerar-relatorio.js`
- Publica o conteúdo da pasta `reports/` como *artifact* do workflow

## 👥 Autores

Trabalho desenvolvido em grupo para a disciplina de GitHub Actions.