# Update all your registered services on DNS-O-Matic

https://www.dnsomatic.com/

# Setup

    cp dns-o-matic.dist.conf dns-o-matic.conf

Change your credentials in dns-o-matic.conf

# Run

Add to your crontab

    crontab -e

    */5 * * * * /path/to/DNS-O-Matic/dns-o-matic.sh >>/var/log/ddns.log
