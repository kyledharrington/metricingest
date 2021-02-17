#!/bin/bash
# Set variables
SERVER=google.com
PORT=443

#run port check 
nc -w 1 -z -v $SERVER $PORT &> /dev/null
result=$?

echo failedportcheck.count,$SERVER=$PORT $result | /opt/dynatrace/oneagent/agent/tools/dynatrace_ingest -v
