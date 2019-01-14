# OpenVPN (ARM) #

OpenVPN server on Raspbian (ARM architecture)

## Docker Image Features ##

* Expose port 1194/udp
* All the files in the mounted `/openvpn` directory will be copied into `/etc/openvpn` before starting the service
* DNS requests from the tunnel are proxied to Google DNS servers. If you want to use a local DNS server, set it with `--dns=<ip>` when running the container

## How to Run It ##

~~
docker run --privileged -p 1194:1194/udp -v $(pwd)/openvpn:/openvpn user2684/openvpn
~~

## Tags ##
* [`latest`](https://github.com/user2684/openvpn-docker/blob/master/Dockerfile)

