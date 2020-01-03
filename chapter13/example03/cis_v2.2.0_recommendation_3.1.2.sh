#!/bin/bash
#
# This file implements CIS Red Hat Enterprise Linux 7 Benchmark 
# Recommendation 3.1.2 from version 2.2.0
echo -n "Ensure net.ipv4.conf.all.send_redirects = 0... "
OUTPUT=$(sysctl net.ipv4.conf.all.send_redirects | grep "net.ipv4.conf.all.send_redirects = 0" 2> /dev/null)
if [ "x$OUTPUT" == "x" ]; then
    echo FAILED!
  else
    echo OK
fi

echo -n "Ensure net.ipv4.conf.default.send_redirects = 0... "
OUTPUT=$(sysctl net.ipv4.conf.default.send_redirects | grep "net.ipv4.conf.default.send_redirects = 0" 2> /dev/null)
if [ "x$OUTPUT" == "x" ]; then
    echo FAILED!
  else
    echo OK
fi

echo -n "Ensure net.ipv4.conf.all.send_redirects = 0 in persistent configuration..."
OUTPUT=$(grep -e "^net\.ipv4\.conf\.all\.send_redirects = 0" /etc/sysctl.conf /etc/sysctl.d/*)
if [ "x$OUTPUT" == "x" ]; then
    echo FAILED!
  else
    echo OK
fi

echo -n "Ensure net.ipv4.conf.default.send_redirects = 0 in persistent configuration..."
OUTPUT=$(grep -e "^net\.ipv4\.conf\.default\.send_redirects = 0" /etc/sysctl.conf /etc/sysctl.d/*)
if [ "x$OUTPUT" == "x" ]; then
    echo FAILED!
  else
    echo OK
fi
