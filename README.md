# First Ansible Playground
I used Vagrant and Virtualbox to manage linux VMs locally, download [vagrant here](https://www.vagrantup.com/downloads.html) and [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

### Setup
I used pyenv:
```
pyenv install 3.7.0
pyenv virtualenv 3.7.0 ansible-venv
pyenv local virtualenv
pyenv activate
pip install ansible
```

Create Ubuntu VM:
```
vagrant init ubuntu/trusty64
vagrant up
```
If you make changes to Vagrantfile, run
```
vagrant reload
```
before running any ansible playbooks.

### Setup Nginx on Your VM:
```
ansible-playbook web-notls.yml
```
Go checkout [localhost:8080](http://localhost:8080)


Author: Yonatan Laurence
