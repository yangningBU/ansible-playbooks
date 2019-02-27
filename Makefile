setup-env:
	pyenv install 3.7.0
	pyenv virtualenv 3.7.0 ansible-venv
	pyenv local virtualenv; pyenv activate; pip install ansible

setup-vm:
	vagrant init ubuntu/trusty64
	vagrant up

update-vm:
	vagrant reload

setup-http-site:
	ansible-playbook playbooks/web-no-tls.yml

setup-https-site:
	ansible-playbook playbooks/create-nginx-ssl-files.yml
	ansible-playbook playbooks/web-tls.yml