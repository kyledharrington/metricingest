#!/bin/bash
cat impi.log | grep degrees | awk -F"|" '{sub(/[0-9][0-9]-/,"");gsub(/[ \t]+$/, "", $1)gsub(" ","_", $1);sub(/ degrees.*/,"", $5);print "temperature."$1 $5}' | /opt/dynatrace/oneagent/agent/tools/dynatrace_ingest
curl http://localhost:9100/metrics | grep -v "#\|{" | awk {'print "host.prometheus."$1" "$2"";'} | /opt/dynatrace/oneagent/agent/tools/dynatrace_ingest
echo "tacos.declious,dt.entity.host=HOST-AB66672D8B662EF4 $RANDOM" | /opt/dynatrace/oneagent/agent/tools/dynatrace_ingest

