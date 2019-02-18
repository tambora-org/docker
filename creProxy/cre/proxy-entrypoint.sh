#!/bin/bash
set -e

# Warn if the DOCKER_HOST socket does not exist
#/cre/docker-socket.sh

# Generate dhparam file if required
# Note: if $DHPARAM_BITS is not defined, generate-dhparam.sh will use 2048 as a default
/cre/generate-dhparam.sh $DHPARAM_BITS

# Compute the DNS resolvers for use in the templates - if the IP contains ":", it's IPv6 and must be enclosed in []
export RESOLVERS=$(awk '$1 == "nameserver" {print ($2 ~ ":")? "["$2"]": $2}' ORS=' ' /etc/resolv.conf | sed 's/ *$//g')
if [ "x$RESOLVERS" = "x" ]; then
    echo "Warning: unable to determine DNS resolvers for nginx" >&2
    unset RESOLVERS
fi

# If the user has run the default command and the socket doesn't exist, fail
#if [ "$socketMissing" = 1 -a "$1" = forego -a "$2" = start -a "$3" = '-r' ]; then
#	exit 1
#fi

exec "$@"
