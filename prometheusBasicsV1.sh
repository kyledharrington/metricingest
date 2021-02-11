#!/bin/bash

curl http://localhost:9100/metrics | grep -v "#\|{" | awk {'print "host.prometheus."$1" "$2"";'} | /opt/dynatrace/oneagent/agent/tools/dynatrace_ingest
