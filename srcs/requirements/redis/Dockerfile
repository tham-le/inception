FROM alpine:3.18

RUN apk -U upgrade 
RUN apk add redis

ENTRYPOINT ["redis-server", "--protected-mode no"]
