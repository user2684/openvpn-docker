FROM debian

# Install required packages with apt
RUN apt-get update \
  && apt-get install -y openvpn iptables dnsmasq \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Expose network
EXPOSE 1194/udp

# Expose filesystem
VOLUME /openvpn

# Install entrypoint
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["bash","/docker-entrypoint.sh"]

# Start openvpn
CMD ["openvpn"]
