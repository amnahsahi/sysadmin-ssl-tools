#!/usr/bin/env bash

set -e

DOMAIN=$1
PORT=${2:-443}
DAYS_WARNING=${3:-30}

if [ -z "$DOMAIN" ]; then
  echo "Usage: ./check-ssl-expiry.sh <domain> [port] [days-warning]"
  exit 1
fi

echo "Checking SSL certificate for $DOMAIN:$PORT..."

EXPIRY_DATE=$(echo | openssl s_client -servername "$DOMAIN" -connect "$DOMAIN:$PORT" 2>/dev/null \
  | openssl x509 -noout -enddate \
  | cut -d= -f2)

EXPIRY_EPOCH=$(date -d "$EXPIRY_DATE" +%s)
CURRENT_EPOCH=$(date +%s)

DAYS_LEFT=$(( (EXPIRY_EPOCH - CURRENT_EPOCH) / 86400 ))

echo "Expiry Date: $EXPIRY_DATE"
echo "Days Remaining: $DAYS_LEFT"

if [ "$DAYS_LEFT" -lt "$DAYS_WARNING" ]; then
  echo "WARNING: Certificate expires in less than $DAYS_WARNING days!"
else
  echo "Certificate is valid."
fi
