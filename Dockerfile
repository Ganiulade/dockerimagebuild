ARG VERSION=20.04
FROM ubuntu:${VERSION}
MAINTAINER "ganiu ganiu.odulate@gmail.com"
LABEL environment=production
RUN apt update && RUN apt install -y nginx curl
COPY index.html /usr/share/nginx/html
ADD  index.html /var/www/html
WORKDIR /
VOLUME /var/www/html
EXPOSE 80
ENTRYPOINT ["nginx", "-g"]
CMD ["daemon off;"]
HEALTHCHECK CMD curl --fail http://localhost:80/ || exit 1

