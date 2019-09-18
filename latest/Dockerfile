FROM nginx:1.17.0-alpine

LABEL image=codejamninja/nginx:latest \
  maintainer="Jam Risser <jam@codejam.ninja>" \
  base=alpine:3.9

RUN apk add --no-cache \
  tini
RUN wget -O /usr/local/bin/confd \
  https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 && \
  chmod +x /usr/local/bin/confd

COPY entrypoint.sh /usr/local/sbin/entrypoint.sh
COPY nginx.conf.tmpl /etc/confd/templates/nginx.conf.tmpl
COPY nginx.toml /etc/confd/conf.d/nginx.toml

RUN chmod +x /usr/local/sbin/entrypoint.sh

EXPOSE 8080

ENV KUBE_PROTOCAL=https \
  KUBE_HOSTNAME=example.com \
  KUBE_SUBPATH=""

ENTRYPOINT ["tini", "--", "sh", "-c", "/usr/local/sbin/entrypoint.sh"]
