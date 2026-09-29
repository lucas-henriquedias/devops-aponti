# Imagem Docker publicada no Docker Hub

Criação de um app simples em Python, com um Dockerfile, e publicação da imagem no Docker Hub.

**Imagem publicada:** <https://hub.docker.com/r/lucashenriquedias/meu_app_python>

## Estrutura do projeto

```
.
├── app.py
└── Dockerfile
```

- **`app.py`:** um app bem simples que exibe algumas mensagens com `print` e termina.
- **`Dockerfile`:** parte da imagem do **Ubuntu 24.04**, instala o Python 3, copia o `app.py` e o executa.

## Usar a imagem publicada

```bash
docker pull lucashenriquedias/meu_app_python:1.0
docker run lucashenriquedias/meu_app_python:1.0
```

Saída esperada:

```
Olá! Meu app Python está rodando em um container Docker.
Este é o meu primeiro app com Docker.
Fim da execução.
```

Depois de imprimir as mensagens, o container termina sozinho, porque o app não fica rodando em segundo plano.

## Como a imagem foi gerada

O build e o envio foram feitos em um **GitHub Codespace**, sem precisar instalar o Docker Desktop.

```bash
# 1. Gerar a imagem
docker build . -t lucashenriquedias/meu_app_python:1.0

# 2. Testar localmente
docker run lucashenriquedias/meu_app_python:1.0

# 3. Logar no Docker Hub
docker login -u lucashenriquedias

# 4. Enviar a imagem
docker push lucashenriquedias/meu_app_python:1.0
```

## Dificuldades e aprendizados

- No comando do enunciado, `usuariohub` deve ser substituído pelo nome de usuário real do Docker Hub. Se o nome usado no `docker run` for diferente do usado no `docker build`, o Docker tenta baixar uma imagem que não existe.
- O nome da imagem no formato `usuario/repositorio:tag` é o que permite o `docker push` saber para onde enviar.
- No primeiro `docker push`, apareceu o erro `access token has insufficient scopes`. O token do Docker Hub tinha só permissão de leitura, e foi preciso gerar outro com **Read & Write** e refazer o `docker login`.
- Enviar de novo com a mesma tag (`1.0`) substitui a imagem anterior no Docker Hub. A mudança pode ser conferida pelo digest (`sha256:...`), que muda a cada versão nova.
- Um container só vive enquanto o processo principal (`CMD`) está rodando. Como o app só imprime mensagens e termina, o container encerra logo depois.
- O Codespaces já vem com o Docker instalado, o que dispensa a instalação local.
