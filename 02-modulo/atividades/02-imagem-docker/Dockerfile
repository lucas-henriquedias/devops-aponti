# Imagem base: Ubuntu (sistema operacional), conforme pedido na atividade
FROM ubuntu:24.04

# Instala o Python 3 (o Ubuntu não vem com ele) e limpa o cache do apt
# para a imagem ficar menor
RUN apt-get update \
    && apt-get install -y --no-install-recommends python3 \
    && rm -rf /var/lib/apt/lists/*

# Pasta de trabalho dentro do container
WORKDIR /app

# Copia o app da minha máquina para dentro da imagem
COPY app.py .

# Comando executado quando o container iniciar
CMD ["python3", "app.py"]
