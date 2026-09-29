# ==============================================================================
# DOCKERFILE DE EXEMPLO - Aplicação web em Python (Flask)
# ==============================================================================

# 1. ARG: é uma variável que só existe durante o build. Permite trocar a versão 
# do Python sem editar o arquivo: docker build --build-arg PYTHON_VERSION=3.11 . 
# É a única instrução que pode vir antes do FROM.
ARG PYTHON_VERSION=3.12

# 2. FROM: define a imagem base. Usei a versão "slim" (mais leve) com tag fixa, 
# para o build não mudar sozinho se sair uma versão nova. Sem tag, o Docker 
# usaria "latest".
FROM python:${PYTHON_VERSION}-slim

# 3. LABEL: são os metadados da imagem em formato chave=valor (aparecem no 
# "docker inspect"). É a forma recomendada hoje; a instrução MAINTAINER está 
# depreciada.
LABEL org.opencontainers.image.title="Minha App Flask"
LABEL org.opencontainers.image.authors="Lucas Henrique <lucashenrique102006@gmail.com>"
LABEL org.opencontainers.image.description="Exemplo didático de Dockerfile"

# 4. ENV: variáveis de ambiente que continuam existindo dentro do container em 
# execução (diferente do ARG). PYTHONUNBUFFERED faz os logs aparecerem na hora no
# "docker logs".
# Obs: Não se deve colocar senhas aqui, pois ENV fica visível na imagem.
ENV PYTHONUNBUFFERED=1
ENV APP_HOME=/app

# 5. WORKDIR: pasta de trabalho para as instruções seguintes (RUN, COPY, ADD, 
# CMD etc). Se não existir, o Docker cria.
WORKDIR ${APP_HOME}

# 6. COPY: copia arquivos da minha máquina para a imagem. Copio o requirements.txt 
# antes do código para aproveitar o cache: enquanto ele não mudar, o Docker não 
# reinstala as dependências a cada alteração no código.
COPY requirements.txt .

# 7. RUN: executa um comando durante o build e salva o resultado como uma nova 
# camada. O --no-cache-dir evita guardar o cache do pip e deixa a imagem menor.
RUN pip install --no-cache-dir -r requirements.txt

# Agora sim copio o código da aplicação.
COPY app.py .

# 8. ADD: é parecido com o COPY, mas também descompacta arquivos .tar.gz 
# automaticamente e aceita URLs. Aqui o assets.tar.gz é extraído direto em 
# /app/static. Na prática, o COPY é mais recomendado para o dia a dia, já o 
# ADD apenas quando precisar desses recursos extras.
ADD assets.tar.gz ${APP_HOME}/static/

# Cria a pasta de dados e um usuário comum, sem privilégios de administrador.
RUN mkdir -p ${APP_HOME}/data \
    && useradd --system --no-create-home appuser \
    && chown -R appuser ${APP_HOME}

# 9. VOLUME: ponto de montagem para dados persistentes: se o container for 
# apagado, o que estiver nessa pasta continua guardado no volume.
VOLUME ["/app/data"]

# 10. EXPOSE: só documenta a porta que a aplicação usa. Não publica a porta, 
# para acessar de fora é preciso usar "-p 8000:8000" no docker run.
EXPOSE 8000

# 11. USER: a partir daqui, tudo roda como "appuser" e não como root. Se a 
# aplicação for invadida, o estrago possível é menor.
USER appuser

# 12. HEALTHCHECK: ensina o Docker a testar se o container está saudável
# (e não só "rodando"). Usei Python porque a imagem slim não tem curl nem wget.
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD ["python", "-c", "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8000/', timeout=2)"]

# 13. ENTRYPOINT: o programa principal do container (fixo).
# CMD: os argumentos padrão dele, que podem ser trocados no "docker run".
# Juntos executam: python app.py. Usei a forma exec (lista JSON), que faz 
# o processo receber corretamente os sinais do Docker, como o de parar o
# container.
ENTRYPOINT ["python"]
CMD ["app.py"]

