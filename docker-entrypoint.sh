#!/bin/bash
set -e

# start the application
if [ "$1" = 'openvpn' ]; then
	# copy all the files of the /openvpn mount into /etc/openvpn
	if [ "$(ls -A /openvpn)" ]; then
	        cp -Rf /openvpn/* /etc/openvpn/
	fi
	
	# access DNS requests coming from the tunnel
	echo "interface=eth0,tun*" > /etc/dnsmasq.conf
	# start dns relay service
	/etc/init.d/dnsmasq start

	# Route traffic from the tunnel
	iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

	# start openvpn
	touch /var/log/openvpn.log
	/etc/init.d/openvpn start
	tail -F /var/log/openvpn.log
fi

exec "$@"
