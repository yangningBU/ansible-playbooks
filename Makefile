default: menu
menu:
	@echo "Some of the make commands available are:\n"
	@echo "\t- setup-env   \t Get python/ansible environment set up"
	@echo "\t- setup-vm    \t Make sure your Vagrant VM is up and running"
	@echo "\t- build       \t Standup nginx server for both HTTP and HTTPS traffic"
	@echo "\nRead the Makefile for a complete list of commands."

build: vm-up
	$(MAKE) setup-http-site
	$(MAKE) setup-https-site

activate:
	pyenv activate

setup-env:
	pyenv install 3.7.0
	pyenv virtualenv 3.7.0 ansible-venv
	pyenv local virtualenv; pyenv activate; pip install ansible

setup-vm:
	vagrant init ubuntu/xenial64
	$(MAKE) vm-up

vm-up:
	vagrant up

update-vm:
	@echo "Reloading VM config. This will shutdown the VM real quick and restart it."
	vagrant reload

setup-http-site:
	ansible-playbook playbooks/web-no-tls.yml

setup-https-site:
	ansible-playbook playbooks/create-nginx-ssl-files.yml
	ansible-playbook playbooks/web-tls.yml