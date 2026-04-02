#!/usr/bin/env bash

DOMAIN=$1

if [ -z "$DOMAIN" ]; then
  echo "Usage: ./renew-cert.sh <domain>"
  exit 1
fi

echo "Renewing certificate for $DOMAIN..."

sudo certbot renew --quiet

echo "Reloading web server..."
sudo systemctl reload nginx

echo "Done."
