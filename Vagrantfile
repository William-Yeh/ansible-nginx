Vagrant.configure("2") do |config|

    # main & default: normal OS series...
    config.vm.define "main", primary: true do |node|
        node.vm.box = "ubuntu/trusty64"
        #node.vm.box = "ubuntu/precise64"
        #node.vm.box = "debian/jessie64"
        #node.vm.box = "debian/wheezy64"
        #node.vm.box = "bento/centos-7.2"
        #node.vm.box = "bento/centos-6.7"

        node.vm.provision "ansible" do |ansible|
            ansible.playbook = "test.yml"
            ansible.sudo = true
        end
    end


    # alpine: special case...
    config.vm.define "alpine" do |node|
        node.vm.box = "maier/alpine-3.3.1-x86_64"

        # for Alpine Linux...
        node.vm.synced_folder '.', '/vagrant', disabled: true

        node.vm.provision "ansible" do |ansible|
            ansible.playbook = "test-alpine.yml"
            ansible.sudo = true
            ansible.extra_vars = { alpine_python_fix_repo: true }
        end
    end


    # docker: for auto build & testing (e.g., Travis CI)
    config.vm.define "docker" do |node|
        node.vm.box = "williamyeh/ubuntu-trusty64-docker"

        node.vm.provision "shell", inline: <<-SHELL
            cd /vagrant
            docker build  -f test/Dockerfile-ubuntu14.04  -t nginx_trusty   .
            docker build  -f test/Dockerfile-ubuntu12.04  -t nginx_precise  .
            docker build  -f test/Dockerfile-debian8      -t nginx_jessie   .
            docker build  -f test/Dockerfile-debian7      -t nginx_wheezy   .
            docker build  -f test/Dockerfile-centos7      -t nginx_centos7  .
            docker build  -f test/Dockerfile-centos6      -t nginx_centos6  .
            docker build  -f test/Dockerfile-alpine3      -t nginx_alpine3  .
        SHELL
    end

end

