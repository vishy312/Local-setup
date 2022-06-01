#!/bin/bash

function print_color(){
    NC="\033[0m"

    case $1 in
    "green") COLOR="\033[0;32m" ;;
    "blue") COLOR="\033[0;34m" ;;
    esac

    echo -e "{$COLOR} $2 {$NC}"
}

print_color blue "Memacache Server is being configured....................."

#installing and configuring memacache service
print_color green "installing and configuring memacache service"
yum install epel-release -y
yum install -y memacached
systemctl start memacached
systemctl enable memacached
systemctl status memacached
print_color green "memacache service is installed and configured"


memacached -p 11211 -U 11111 -u memacached -d

print_color blue "Memacache Server is Configured!"