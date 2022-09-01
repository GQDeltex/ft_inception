FROM alpine:3

RUN apk add --no-cache vsftpd
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 20
EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
