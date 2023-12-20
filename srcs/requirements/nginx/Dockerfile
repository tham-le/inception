FROM alpine:3.18

RUN apk update
RUN apk add nginx

COPY conf/default.conf /etc/nginx/http.d/default.conf
COPY ./nginx-selfsigned.key /etc/ssl/private/
COPY ./nginx-selfsigned.crt /etc/ssl/certs/

RUN chmod 600 /etc/ssl/private/nginx-selfsigned.key
RUN chmod 600 /etc/ssl/certs/nginx-selfsigned.crt

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]	
	
