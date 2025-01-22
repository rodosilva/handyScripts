#!/usr/bin/env bash

list=$(cat hosts)

#while IFS=' ' read -r line
#do
#  echo " === START === "
#  echo "Complete Line from file: $line"
#  host=$(echo "$line" | awk '{print $1}')
#  ipe=$(echo "$line" | awk '{print $2}')
#  echo "Individual host is: $host"
#  ip=$(host $host | grep -oE "[0-9]{1,3}(\.)[0-9]{1,3}(\.)[0-9]{1,3}(\.)[0-9]{1,3}")
#  echo "IP is: $ip"
#  echo " === CONTINUE === "

#done <<< $hosts

echo " === RECORD TEMPLATE === "

while read -r line
do
  host=$(echo $line | awk '{print $1}')
  ipe=$(echo $line | awk '{print $2}')
  hostw=$(echo $host | perl -pe 's/(\w+)\.(\w+)\.(\w+)\.(\w+).(\w+)/$1/g')
  ipd=$(echo $ipe | perl -pe 's/(\d+)\.(\d+)\.(\d+)\.(\d+)/$4/g')
    
  echo -e "Add-DnsServerResourceRecordA -ComputerName [AD] -ZoneName [ZONE] -Name \"${hostw}\" -IPv4Address \"${ipe}\""
  echo -e "Add-DnsServerResourceRecordPtr -ComputerName [AD] -ZoneName [ZONE ARPA] -Name \"${ipd}\" -PtrDomainName \"${host}\""

done <<< "$list"

#for n in $(cat hosts.txt | sed 's/^[\r]//g')
#do
#  echo "Line: ${n}"
#  awk '{print $1}' $n  
#done
