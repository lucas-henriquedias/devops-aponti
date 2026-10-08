FROM debian:trixie

RUN apt-get update && \
    apt-get install -y --no-install-recommends nginx && \
    rm -rf /var/lib/apt/lists/*

ADD meu_site.tar /var/www/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]