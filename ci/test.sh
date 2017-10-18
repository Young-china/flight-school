#!/bin/sh
set -e -x

touch ssh_key
echo "$private_key"
echo "$private_key" > ssh_key
cat ssh_key

# install ssh
apt-get update && apt-get -y install sudo
apt-get -y install openssh-server tcl tk expect

sudo chnod -R 600 ssh_key
eval "$(ssh-agent -s)"
ssh-add ssh_key
ssh-add -l

expect << EOF
spawn ssh -T git@github.ibm.com
expect "Are you sure you want to continue connecting (yes/no)?"
send "yes\r"
expect eof
EOF
