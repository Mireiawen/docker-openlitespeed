#!/bin/bash
set -e

# Start the LiteSpeed
/usr/local/lsws/bin/litespeed

# Read the credentials
cat '/usr/local/lsws/adminpasswd'

# Tail the logs to stdout
tail -f \
	'/var/log/litespeed/server.log'
