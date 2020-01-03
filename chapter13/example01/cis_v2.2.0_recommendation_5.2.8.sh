#!/bin/bash
#
# This file implements CIS Red Hat Enterprise Linux 7 Benchmark 
# Recommendation 5.2.8 from version 2.2.0
echo -n "Ensure root logins are disabled on SSH... "
OUTPUT=$(grep -e "^PermitRootLogin no" /etc/ssh/sshd_config)
if [ "x$OUTPUT" == "x" ]; then
  echo FAILED!
else
  echo OK
fi
