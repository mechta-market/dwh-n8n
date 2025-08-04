FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache ffmpeg

RUN addgroup --gid 101 telegramgroup
RUN adduser node telegramgroup

USER node
