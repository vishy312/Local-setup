#!/bin/bash

function print_color(){
    NC='\033[0m'

    case $1 in
    'green') COLOR='\033[0;32m' ;;
    'blue') COLOR='\033[0;34m' ;;
    esac

    echo -e "{$COLOR} $2 {$NC}"
}


print_color blue "RabbitMQ Server is being Configured............."

#installing and congiguring rabbitmq service
sudo yum install epel-release -y
sudo yum update -y
sudo yum install wget -y
cd /tmp/
wget http://packages.erlang-solutions.com/erlang-solutions-2.0-1.noarch.rpm
sudo rpm -Uvh erlang-solutions-2.0-1.noarch.rpm
sudo yum -y install erlang socat
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
sudo yum install rabbitmq-server -y
sudo systemctl start rabbitmq-server
sudo systemctl enable rabbitmq-server
sudo systemctl status rabbitmq-server
sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator
sudo systemctl restart rabbitmq-server
print_color blue "RabbitMQ Server is Congigured!"