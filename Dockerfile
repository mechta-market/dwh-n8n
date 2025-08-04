FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache ffmpeg

RUN adduser node $(getent group 101 | cut -d: -f1)

USER node
