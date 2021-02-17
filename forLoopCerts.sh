#!/bin/bash

DOMAINS="domains.txt"
DAYS="7"

while read -r TARGET; do
  echo "checking if $TARGET expires in less than $DAYS days";
  expirationdate=$(date -d "$(: | openssl s_client -connect "$TARGET":443 -servername "$TARGET" 2>/dev/null \
                                | openssl x509 -text \
                                | grep 'Not After' \
                                |awk '{print $4,$5,$7}')" '+%s');
  in7days=$(($(date +%s) + (86400*DAYS)));
      echo "KO - Certificate for $TARGET expires in less than $DAYS days, on $(date -d @"$expirationdate" '+%Y-%m-%d')" 
done
