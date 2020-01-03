#!/bin/bash
#
# This file implements CIS Red Hat Enterprise Linux 7 Benchmark 
# Recommendation 5.2.8 from version 2.2.0
echo -n "Ensure root logins are disabled on SSH... "
OUTPUT=$(grep -e "^PermitRootLogin no" /etc/ssh/sshd_config)
if [ "x$OUTPUT" == "x" ]; then
  echo FAILED!
  OPTPRESENT=$(grep -e "^PermitRootLogin.*" /etc/ssh/sshd_config)
  if [ "x$OPTPRESENT" == "x" ]; then
    echo "Configuration not present - attempting to add"
    echo "PermitRootLogin no" | sudo tee -a /etc/ssh/sshd_config 1>/dev/null
  else
    echo "Configuration present - attempting to modify"
    sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config
  fi
  sudo systemctl restart sshd
else
  echo OK
fi
