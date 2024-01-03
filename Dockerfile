FROM alpine:3.19.0

COPY ./rootfs /

RUN addgroup tunneling && adduser -u 1000 -S -D -G tunneling tunneling && \
    apk add --no-cache bash openssh && \
    chmod 777 /etc/ssh/ && \
    rm -rf /run && \
    ln -s /tmp /run && \
    chmod +x /entrypoint.sh

USER tunneling

ENTRYPOINT ["/entrypoint.sh"]
