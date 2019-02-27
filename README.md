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

### Setup Nginx on Your VM:
```
make setup-http-site
```
Go checkout [localhost:8080](http://localhost:8080)

Or for funsies, run the one with TLS:
```
make setup-https-site
```
and go checkout [localhost:8443](https://localhost:8443)


Author: Yonatan Laurence
