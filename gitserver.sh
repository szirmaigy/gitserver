#!/bin/bash

rm -rf /home/git
adduser --home /home/git --shell /usr/bin/git-shell --disabled-password --gecos "git" git
echo "git:gitpassword" | sudo chpasswd

mkdir /home/git/.ssh
chmod 700 /home/git/.ssh
chown git:git /home/git/.ssh

touch /home/git/.ssh/authorized_keys
chmod 600 /home/git/.ssh/authorized_keys
chown git:git /home/git/.ssh/authorized_keys

cat << EOF > /etc/shells
# /etc/shells: valid login shells
/bin/sh
/bin/dash
/bin/bash
/bin/rbash
/usr/bin/git-shell
EOF

chsh git -s $(which git-shell)

service restart sshd
