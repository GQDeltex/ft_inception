FROM alpine:3

RUN apk add --no-cache nginx

COPY ./site.html /var/www/html/index.html
COPY ./nginx.conf /etc/nginx/http.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
