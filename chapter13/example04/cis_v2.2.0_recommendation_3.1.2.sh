#!/bin/bash
#
# This file implements CIS Red Hat Enterprise Linux 7 Benchmark 
# Recommendation 3.1.2 from version 2.2.0
echo -n "Ensure net.ipv4.conf.all.send_redirects = 0... "
OUTPUT=$(sysctl net.ipv4.conf.all.send_redirects | grep "net.ipv4.conf.all.send_redirects = 0" 2> /dev/null)
if [ "x$OUTPUT" == "x" ]; then
    echo FAILED!
    echo "Attempting to modify active kernel parameters"
    sudo sysctl -w net.ipv4.conf.all.send_redirects=0
    sudo sysctl -w net.ipv4.route.flush=1
  else
    echo OK
fi

echo -n "Ensure net.ipv4.conf.default.send_redirects = 0... "
OUTPUT=$(sysctl net.ipv4.conf.default.send_redirects | grep "net.ipv4.conf.default.send_redirects = 0" 2> /dev/null)
if [ "x$OUTPUT" == "x" ]; then
    echo FAILED!
    echo "Attempting to modify active kernel parameters"
    sudo sysctl -w net.ipv4.conf.default.send_redirects=0
    sudo sysctl -w net.ipv4.route.flush=1
  else
    echo OK
fi

echo -n "Ensure net.ipv4.conf.all.send_redirects = 0 in persistent configuration..."
OUTPUT=$(grep -e "^net\.ipv4\.conf\.all\.send_redirects = 0" /etc/sysctl.conf /etc/sysctl.d/*)
if [ "x$OUTPUT" == "x" ]; then
    echo FAILED!
    OPTPRESENT=$(grep -e "^net\.ipv4\.conf\.all\.send_redirects" /etc/sysctl.conf /etc/sysctl.d/*)
    if [ "x$OPTPRESENT" == "x" ] ; then
      echo "Line not present - attempting to append configuration"
      echo "net.ipv4.conf.all.send_redirects = 0" | sudo tee -a /etc/sysctl.conf 1>/dev/null
    else
      echo "Line present - attempting to modify"
      sudo sed -i -r 's/^net\.ipv4\.conf\.all\.send_redirects.*/net.ipv4.conf.all.send_redirects = 0/g' /etc/sysctl.conf /etc/sysctl.d/*
    fi
  else
    echo OK
fi

echo -n "Ensure net.ipv4.conf.default.send_redirects = 0 in persistent configuration..."
OUTPUT=$(grep -e "^net\.ipv4\.conf\.default\.send_redirects = 0" /etc/sysctl.conf /etc/sysctl.d/*)
if [ "x$OUTPUT" == "x" ]; then
    echo FAILED!
    OPTPRESENT=$(grep -e "^net\.ipv4\.conf\.default\.send_redirects" /etc/sysctl.conf /etc/sysctl.d/*)
    if [ "x$OPTPRESENT" == "x" ] ; then
      echo "Line not present - attempting to append configuration"
      echo "net.ipv4.conf.default.send_redirects = 0" | sudo tee -a /etc/sysctl.conf 1>/dev/null
    else
      echo "Line present - attempting to modify"
      sudo sed -i -r 's/^net\.ipv4\.conf\.default\.send_redirects.*/net.ipv4.conf.default.send_redirects = 0/g' /etc/sysctl.conf /etc/sysctl.d/*
    fi
  else
    echo OK
fi
