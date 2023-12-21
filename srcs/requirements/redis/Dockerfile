FROM alpine:3.17

RUN apk -U upgrade 
RUN apk add redis

ENTRYPOINT ["redis-server", "--protected-mode no"]
