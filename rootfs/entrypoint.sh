#!/usr/bin/env bash

dotssh=/home/tunneling/.ssh
dotconf=/home/tunneling/.conf
mkdir -p $dotssh 2>/dev/null
mkdir -p $dotconf 2>/dev/null
if [ -f /opt/authorized_keys ]; then cp /opt/authorized_keys $dotssh 2>/dev/null; fi
touch $dotssh/authorized_keys 2>/dev/null
chown tunneling:tunneling $dotssh $dotssh/authorized_keys 2>/dev/null 
chmod 700 $dotssh 2>/dev/null
chmod 600 $dotssh/authorized_keys 2>/dev/null
for f in `ls -1 /opt/ssh_host_* 2>/dev/null`; do [ ! -r $f ] && echo $f is not readable && exit 1; done
cp /opt/ssh_host_* $dotconf 2>/dev/null
chmod 600 $dotconf/ssh_host_* 2>/dev/null

if [[ -z "$@" ]]; then
	exec /usr/sbin/sshd -D
else
	exec "$@"
fi
