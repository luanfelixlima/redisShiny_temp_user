#
#	Debian 12.2.0-14
#

# INSTALL
apt install redis
apt install php-redis

# INICIANDO
system restart redis-server
systemctl restart redis
systemctl restart redis-server
systemctl enable redis-server

