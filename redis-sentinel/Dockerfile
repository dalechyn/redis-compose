# syntax=docker/dockerfile:latest

FROM bitnami/redis-sentinel

EXPOSE 6973/tcp
RUN ["/bin/ls", "-a", "/bitnami"]
RUN redis-sentinel
