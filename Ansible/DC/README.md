## Usage Steps
- Make sure WinRM is enabled and reachable in VM.
- Change the username and password in the playbook site.yml to VM's admin user and password
  - ansible_become_user (Admin user)
  - ansible_become_password (Admin password)
  - ansible_user (Admin user)
  - ansible_password (Admin password)
- Arguments required for the playbook
  - DC: DC IP
  - dc_domain_name: FQDN domain name to be created (e.g. mydomain.com)
- Run below command to build a DC
```
ansible-playbook -i {DC VM IP}, site.yml -e "DC={DC VM IP}" -e "dc_domain_name={Domain Name}"
```
