#!/bin/bash

cat impi.log | grep degrees | awk -F"|" '{sub(/[0-9][0-9]-/,"");gsub(/[ \t]+$/, "", $1)gsub(" ","_", $1);sub(/ degrees.*/,"", $5);print "temperature."$1 $5}' | /opt/dynatrace/oneagent/agent/tools/dynatrace_ingest
#cat impi.log | grep degrees | awk -F"|" '{sub(/[0-9][0-9]-/,"");gsub(/[ \t]+$/, "", $1)gsub(" ","_", $1);sub(/ degrees.*/,"", $5);print $1$5}'
#cat impi.log | grep "degrees" | awk -F"|" '{sub(/degrees.*/,"");sub(/[0-9][0-9]-/,"");sub(/[ \t]+$/,"", $1);print $1$5}'
#cat impi.log | grep "degrees" | awk -F"|" '{sub(/degrees.*/,"");sub(/[0-9][0-9]-/,"");sub(/[ \t]+$/,"", $1)gsub(" ","_");print $1 $5}'
#cat impi.log | grep degrees | awk -F"|" '{gsub(/[ \t]+$/, "", $1); print $1 ""}'
#cat impi.log | grep degrees | awk '{print $1$2$3}'
