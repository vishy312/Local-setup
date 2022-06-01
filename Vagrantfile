Vagrant.configure("2") do |config|
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true

    ### DB vm ###
    config.vm.define "db01" do |db01|
        db01.vm.box = "ubuntu/trusty64"
        db01.vm.hostname = "db01"
        db01.vm.network "private_network", ip: "192.168.56.15"
        db01.vm.provision "shell", path: "mysql.sh"
    end

    ### Memacache ###
    config.vm.define "mc01" do |mc01|
        mc01.vm.box = "ubuntu/trusty64"
        mc01.vm.hostname = "mc01"
        mc01.vm.network "private_network", ip: "192.168.56.14"
        mc01.vm.provision "shell", path: "memacache.sh"
    end

    ### RabbitMQ ###
    config.vm.define "rb01" do |rb01|
        rb01.vm.box = "ubuntu/trusty64"
        rb01.vm.hostname = "rb01"
        rb01.vm.network "private_network", ip: "192.168.56.16"
        rb01.vm.provision "shell", path: "rabbitmq.sh"
    end

    ### Tomcat ###
    config.vm.define "app01" do |app01|
        app01.vm.box = "ubuntu/trusty64"
        app01.vm.hostname = "app01"
        app01.vm.network "private_network", ip: "192.168.56.12"
        app01.vm.provision "shell", path: "tomcat.sh"
        app01.vm.provider "virtualbox" do |vb|
            vb.memory = "1024"
        end
    end

    ### Nginx-LoadBalancer ###
    config.vm.define "web01" do |web01|
        web01.vm.box = "ubuntu/trusty64"
        web01.hostname = "web01"
        web01.vm.network "private_network", ip: "192.168.56.11"
        web01.vm.provision "shell", path: "nginx.sh"
    end