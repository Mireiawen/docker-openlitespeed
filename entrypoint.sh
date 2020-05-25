#!/bin/bash
set -e

# Start the LiteSpeed
/usr/local/lsws/bin/litespeed

function finish()
{
	/usr/local/lsws/bin/lswsctrl "stop"
	pkill "tail"
}

trap cleanup SIGTERM

# Update the credentials
if [ -n "${ADMIN_PASSWORD}" ]
then
	ENCRYPT_PASSWORD="$(/usr/local/lsws/admin/fcgi-bin/admin_php -q '/usr/local/lsws/admin/misc/htpasswd.php' "${ADMIN_PASSWORD}")"
	echo "admin:${ENCRYPT_PASSWORD}" >'/usr/local/lsws/admin/conf/htpasswd'
	echo "WebAdmin user/password is admin/${ADMIN_PASSWORD}" >'/usr/local/lsws/adminpasswd'
fi

# Read the credentials
cat '/usr/local/lsws/adminpasswd'

# Tail the logs to stdout
tail -f \
	'/var/log/litespeed/server.log'
