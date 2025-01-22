#!/bin/bash

# This Script will validate that CDN service is working as it should
ok=yes
## 1. Validate that the mount is there
echo "=== Validating that the mount is there ==="
mnt=$(df -h | grep -io "/mnt/")

if [[ -z $mnt ]]
then
  echo "The mount is missing, please check that"
  ok=no
else
  echo "The mount is there, you can proceed"
fi

## 2. Validate that the the httpd service is Active
echo "=== Validating that the httpd service is Active ==="
httpd=$(systemctl status httpd | grep -o "active")

if [[ -z $httpd ]]
then
  echo "The httpd service is not Active, please check that"
  ok=no
else
  echo "The httpd service is Active, you can proceed"
fi

if [[ $ok = yes ]]
then
  echo "Verification passed"
else
  echo "Verification did not pass"
  exit 2
fi
