#!/usr/bin/env bash

FILE=$1

if [ -z "$FILE" ]; then
  echo "Usage: ./check-multiple-ssl.sh domains.txt"
  exit 1
fi

while read -r domain; do
  echo "----------------------------------"
  ./check-ssl-expiry.sh "$domain"
done < "$FILE"
