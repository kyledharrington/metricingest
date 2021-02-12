#!/bin/bash

cat impi.log | grep degrees | awk -F"|" '{sub(/[0-9][0-9]-/,"");gsub(/[ \t]+$/, "", $1)gsub(" ","_", $1);sub(/ degrees.*/,"", $5);print "temperature."$1 $5}' | /opt/dynatrace/oneagent/agent/tools/dynatrace_ingest
