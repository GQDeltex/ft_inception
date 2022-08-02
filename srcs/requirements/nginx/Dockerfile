FROM alpine:3

RUN apk add --no-cache nginx

COPY ./mime.types /etc/nginx/conf/mime.types
COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
