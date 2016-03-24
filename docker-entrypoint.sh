#!/bin/sh

# Logo
cat > /etc/motd <<EOF
  ╔═╗┬ ┬┌─┐┌┐┌┌┐┌┌─┐┬     [ Based On OpenSSH ]
  ║  ├─┤├─┤││││││├┤ │          2015.12.27
  ╚═╝┴ ┴┴ ┴┘└┘┘└┘└─┘┴─┘     (Made By m31271n)
EOF

# Want sshd run? Then you need generate a key.
# I didn't  generate all types of keys, such as dsa, ecdsa.
# but generate only one type - rsa.
if [ ! -e /etc/ssh/ssh_host_rsa_key ]; then
    ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key
fi

: ${USERNAME:="channel"}
: ${PASSWORD:="channel"}

adduser -s /sbin/nologin -D ${USERNAME}
passwd ${USERNAME} <<EOF
${PASSWORD}
${PASSWORD}
EOF

# Launch sshd
exec /usr/sbin/sshd -D
