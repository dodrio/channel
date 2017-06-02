FROM alpine:3.3

RUN apk add --update openssh \
&& rm -rf /var/cache/apk/*

RUN sed -i '/^#Port/c\Port 7878' /etc/ssh/sshd_config
RUN sed -i '/^#AllowTcpForwarding/c\AllowTcpForwarding yes' /etc/ssh/sshd_config
RUN sed -i '/^#GatewayPorts/c\GatewayPorts yes' /etc/ssh/sshd_config
RUN sed -i '/^#PasswordAuthentication/c\PasswordAuthentication yes' /etc/ssh/sshd_config
RUN echo 'ClientAliveInterval 10' > /etc/ssh/sshd_config
RUN echo 'ClientAliveCountMax 5' > /etc/ssh/sshd_config

COPY docker-entrypoint.sh /
EXPOSE 7878
CMD ["/docker-entrypoint.sh"]
