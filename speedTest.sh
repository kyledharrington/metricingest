#!/bin/bash

speedtest --simple | awk {'gsub(":","", $1);print "host."$1" "$2"";'} | /opt/dynatrace/oneagent/agent/tools/dynatrace_ingest -v
