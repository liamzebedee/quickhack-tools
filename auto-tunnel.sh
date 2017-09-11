#!/bin/bash

x() {
	# Setup remote tunnel on dynamic port
  set -x
  port=`ruby -e 'require "socket"; puts Addrinfo.tcp("", 0).bind {|s| s.local_address.ip_port }'`
  ssh -o UserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -oServerAliveInterval=240 -R$port:localhost:22 USER@HOST.COM $port

	x
}
trap 'x' ERR

# Automatically trap error and re-setup tunnel

x
