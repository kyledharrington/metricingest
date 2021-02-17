#!/bin/bash

domains=(rxc68685.live.dynatrace.com qgp71409.live.dynatrace.com dynatrace.com createpoint.qti.qualcomm.com)

for domain in "${domains[@]}"
do certdate=$(date --date="$(echo | openssl s_client -connect $domain -connect $domain:443 2>/dev/null | openssl x509 -noout -enddate | cut -d= -f 2)" +%s); 
	epoch=$(($certdate - $(date +%s))); 
	daystilexpire=$(($epoch / 60 / 60 / 24)); 
	echo certificate.expiration,domain=$domain $daystilexpire | /opt/dynatrace/oneagent/agent/tools/dynatrace_ingest;
done

