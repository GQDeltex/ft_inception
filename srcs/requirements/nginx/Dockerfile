FROM alpine:3

RUN apk add --no-cache nginx

ARG DOMAIN_NAME

COPY mime.types /etc/nginx/conf/mime.types
COPY nginx.conf /etc/nginx/nginx.conf
COPY cert.key /etc/nginx/certs/cert.key
COPY cert.crt /etc/nginx/certs/cert.crt

RUN sed -i -e "s/{{ DOMAIN }}/$DOMAIN_NAME/g" /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
