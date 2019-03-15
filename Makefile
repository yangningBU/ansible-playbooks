default: menu
menu:
	@echo "Some of the make commands available are:\n"
	@echo "\t- setup      \t Get environment setup and everything running. You should only ever have to run this once."
	@echo "\t- install    \t Run this if you update your Pipfile"
	@echo "\t- deploy     \t Run this to deploy any changes to your server"
	@echo "\t- reload-vm  \t Run this to apply any changes to your Vagrantfile"
	@echo "\nRead the Makefile for a complete list of commands."

deploy: vm-up
	$(MAKE) setup-http-site
	$(MAKE) setup-https-site

activate:
	pipenv shell

setup:
	$(MAKE) install
	$(MAKE) vm-up
	$(MAKE) deploy

install:
	command -v pipenv >/dev/null 2>&1 || brew install pipenv
	pipenv install
	$(MAKE) activate

vm-up:
	vagrant up

reload-vm:
	@echo "Reloading VM config. This will shutdown the VM real quick and restart it."
	vagrant reload

setup-http-site:
	pipenv run ansible-playbook playbooks/web-no-tls.yml

setup-https-site:
	pipenv run ansible-playbook playbooks/create-nginx-ssl-files.yml
	pipenv run ansible-playbook playbooks/web-tls.yml