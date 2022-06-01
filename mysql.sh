#!/bin/bash

DATABASE_PASS="admin123"

function print_color(){
    NC="\033[0m"

    case $1 in
    "green") COLOR="\033[0;32m" ;;
    "blue") COLOR="\033[0;34m" ;;
    esac

    echo -e "{$COLOR} $2 {$NC}"
}

print_color blue "Database Server is being Configured..............."

#setting up repository and installing mariadb
print_color green "setting up repository and installing mariadb"
yum update -y
yum install epel-release -y
yum install git zip unzip -y
yum install mariadb-server -y


#configure mariadb
print_color green "configure mariadb"
systemctl start mariadb
systemctl enable mariadb
systemctl status mariadb
sleep 2


#adding github repo
print_color green "adding github repo"
cd /tmp/
git clone -b local-setup https://github.com/devopshydclub/vprofile-project.git

#setting up database
print_color green "setting up database"
mysql-admin -u root password "$DATABASE_PASS"
mysql -u root -p"$DATABASE_PASS" < db-load.sql

systemctl restart mariadb


#install and configure firewalld
print_color green "install and configure firewalld"
yum install -y firewalld
systemctl start firewalld
systemctl enable firewalld
systemctl status firewalld
sleep 2
firewall-cmd --get-active-zones
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --reload
systemctl restart firewalld

print_color blue "Database Server is configured!"