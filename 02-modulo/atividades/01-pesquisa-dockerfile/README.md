# Dockerfile comentado

Pesquisa sobre as principais instruções de um Dockerfile, com um arquivo de exemplo explicado em comentários.

**Arquivo entregue:** [`Dockerfile`](Dockerfile)

## Fontes consultadas

- <https://docs.docker.com/build/concepts/dockerfile/>
- <https://docs.docker.com/reference/dockerfile/>

## O que o arquivo traz

Um Dockerfile para uma aplicação web em Python (Flask), com a explicação de cada instrução escrita nos comentários.

| Instrução | Para que serve |
|-----------|----------------|
| `ARG` | Variável que existe só durante o build. Única instrução que pode vir antes do `FROM`. |
| `FROM` | Define a imagem base. |
| `LABEL` | Metadados da imagem (autor, descrição etc.). |
| `ENV` | Variável de ambiente que continua existindo no container em execução. |
| `WORKDIR` | Pasta de trabalho para as instruções seguintes. |
| `COPY` | Copia arquivos da máquina local para a imagem. |
| `RUN` | Executa um comando durante o build e gera uma nova camada. |
| `ADD` | Como o `COPY`, mas também extrai `.tar.gz` e aceita URLs. |
| `VOLUME` | Ponto de montagem para dados persistentes. |
| `EXPOSE` | Documenta a porta usada pela aplicação (não a publica). |
| `USER` | Define o usuário que executa o container (evita rodar como root). |
| `HEALTHCHECK` | Ensina o Docker a testar se o container está saudável. |
| `ENTRYPOINT` | Programa principal do container. |
| `CMD` | Argumentos padrão do `ENTRYPOINT`, que podem ser trocados no `docker run`. |

## O que aprendi na pesquisa

- Copiar o `requirements.txt` antes do código aproveita o cache de camadas e evita reinstalar dependências a cada mudança no código.
- `COPY` é a opção padrão. O `ADD` só vale a pena quando preciso de extração automática ou de URL.
- `EXPOSE` apenas documenta a porta. Para acessar de fora, é preciso usar `-p` no `docker run`.
- `ENTRYPOINT` e `CMD` na forma exec (lista JSON) fazem o processo receber corretamente os sinais do Docker.
- `MAINTAINER` está depreciado. O recomendado é usar `LABEL`.
- Não se deve colocar senhas em `ENV` ou `ARG`, pois ficam visíveis na imagem.

## Observação

Esta atividade é uma pesquisa, então o Dockerfile foi entregue isoladamente. Para construir a imagem a partir dele, seria preciso ter na mesma pasta um `app.py`, um `requirements.txt` (com `flask`) e um `assets.tar.gz`.
