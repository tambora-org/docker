#!/bin/sh 

## renew certbot
certbot renew --noninteractive --nginx --agree-tos

# https://certbot.eff.org/docs/using.html#renewal ??
# certbot renew --pre-hook "service nginx stop" --post-hook "service nginx start"

