#!/bin/bash

# VARIABLES
hosts='./hosts.txt'
playbook='./rebootLinux.yaml'

read -p "Pick a Tenant: lab | corp | prod: " tenant

if ! [[ $tenant =~ ^lab$ || $tenant =~ ^corp$ || $tenant =~ ^prod$ ]]
then
  echo "Incorrect Tenant, please pick an option"
  exit 0
fi

ansible-playbook -K -k -i ${hosts} --limit ${tenant} ${playbook}
