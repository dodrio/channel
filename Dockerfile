FROM alpine:3.2

RUN apk add --update openssh \
&& rm -rf /var/cache/apk/*

RUN sed -i '/^#AllowTcpForwarding/c\AllowTcpForwarding yes' /etc/ssh/sshd_config
RUN sed -i '/^#GatewayPorts/c\GatewayPorts yes' /etc/ssh/sshd_config
RUN sed -i '/^#PasswordAuthentication/c\PasswordAuthentication yes' /etc/ssh/sshd_config

EXPOSE 22

COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]
