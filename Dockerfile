# Установщик пакетов apk: в образах n8n с конца 2025 года его нет (образ собран на
# «Docker Hardened Images»), поэтому берём статическую сборку из обычного alpine той же
# версии, ставим пакеты и убираем её из итогового образа.
FROM alpine:3.24 AS apk
RUN apk add --no-cache apk-tools-static

# Версию n8n поднимать осознанно: сверяться со списком уязвимостей
# https://github.com/n8n-io/n8n/security/advisories
FROM n8nio/n8n:2.48.5

USER root

COPY --from=apk /sbin/apk.static /sbin/apk.static
RUN /sbin/apk.static add --no-cache curl ffmpeg && rm /sbin/apk.static

USER node

RUN mkdir -p audio_chunks
