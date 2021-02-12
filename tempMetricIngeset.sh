#!/bin/bash

cat impi.log | grep "degrees" | awk -F"|" '{sub(/degrees.*/,"");sub(/[0-9][0-9]-/,"");sub(/[ \t]+$/,"", $1);print $1$5}'


cat impi.log | grep "degrees" | awk -F"|" '{sub(/degrees.*/,"");sub(/[0-9][0-9]-/,"");sub(/[ \t]+$/,"", $1);print $1 $5}' | awk 'gsub(" ","_")'
