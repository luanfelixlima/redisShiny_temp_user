#
#	Debian 12.2.0-14
#

# INSTALL
apt install r-base
apt install gdebi-core
apt-get install libhiredis-dev

# PACKAGE TO MANIPULATE REDIS
R -i
install.packages("redux")
