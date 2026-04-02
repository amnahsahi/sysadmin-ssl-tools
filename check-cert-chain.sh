#!/usr/bin/env bash

DOMAIN=$1

if [ -z "$DOMAIN" ]; then
  echo "Usage: ./check-cert-chain.sh <domain>"
  exit 1
fi

echo | openssl s_client -connect "$DOMAIN:443" -servername "$DOMAIN" -showcerts
