# First Ansible Playground
I used Vagrant and Virtualbox to manage linux VMs locally, download [vagrant here](https://www.vagrantup.com/downloads.html) and [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

### Setup
I used pyenv:
```
make setup-env
```

Create Ubuntu VM:
```
make setup-vm
```
If you make changes to Vagrantfile, run
```
make update-vm
```
before running any ansible playbooks.

### Run playbooks:
Right now the only thing we got going is running a basic html page behind Nginx served over both HTTP and HTTPS
```
make build
```
Go checkout [localhost:8080](http://localhost:8080) and [localhost:8443](https://localhost:8443)


Author: Yonatan Laurence