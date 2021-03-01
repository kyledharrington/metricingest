#!/bin/bash

groupfiledate=$(date -r /etc/group +%s) 2>/dev/null; epoch=$(($(date +%s) - $groupfiledate)); echo $(($epoch / 60 / 60 / 24))

echo host.groupfile, moddate=$groupfiledate
