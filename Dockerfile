FROM n8nio/n8n:1.121.2

USER root

RUN apk add --no-cache curl ffmpeg

RUN usermod -aG $(getent group 101 | cut -d: -f1) node

USER node

RUN mkdir -p audio_chunks
