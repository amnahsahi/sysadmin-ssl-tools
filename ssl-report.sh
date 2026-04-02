#!/usr/bin/env bash

DOMAIN=$1

EXPIRY=$(echo | openssl s_client -servername "$DOMAIN" -connect "$DOMAIN:443" 2>/dev/null \
  | openssl x509 -noout -enddate \
  | cut -d= -f2)

echo "$DOMAIN | $EXPIRY"
