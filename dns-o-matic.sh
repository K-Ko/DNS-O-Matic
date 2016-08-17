#!/bin/bash

#set -x

pwd=$(dirname $0)

### Remember last IP and only update if changed
lastfile=/tmp/$(basename $0).last
version=$(<$pwd/.version)

. $pwd/dns-o-matic.conf

[ -f $lastfile ] && last=$(<$lastfile)

### Get actual IP
ip=$(dig +short myip.opendns.com @resolver1.opendns.com)

echo -n $ip >$lastfile

[ "$last" == $ip ] && exit

[ "$VERBOSE" ] && opts=--verbose || opts=--silent

### Update IP
curl $opts --header 'User-Agent: Knut Kohl - DNS-O-Matic Update Client - '$version \
     https://$USER:$PASSWORD@updates.dnsomatic.com/nic/update?myip=$ip

### Newline for logging
echo
