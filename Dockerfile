FROM alpine:3.12

COPY ./rootfs /

RUN addgroup tunneling && adduser -S -D -G tunneling tunneling && \
    apk add --no-cache bash openssh && \
    chmod 777 /etc/ssh/ && \
    rm -rf /run && \
    ln -s /tmp /run && \
    chmod +x /entrypoint.sh

USER tunneling

ENTRYPOINT ["/entrypoint.sh"]
