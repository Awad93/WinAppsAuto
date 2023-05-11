# Domain Joined SQL Server
## Requirements
- Domain Controller up and running

## Usage Steps
- Make sure WinRM is enabled and reachable in VM.
- Change the username and password in the playbook site.yml to VM's admin user and password
  - ansible_become_user (Admin user)
  - ansible_become_password (Admin password)
  - ansible_user (Admin user)
  - ansible_password (Admin password)
- Change domain_admin_user and domain_admin_password in vars.yml to domain admin credentials.
- Arguments required for the playbook
  - SQL: SQL Server IP
  - DC: DC IP
  - dc_domain_name: FQDN domain name (e.g. mydomain.com)
- Run below command to build a SQL server
```
ansible-playbook -i {SQL Server VM IP}, --tags Default site.yml -e "SQL={SQL Server VM IP}" -e "DC={DC VM IP}" -e "dc_domain_name={Domain Name}"
```

# Standalone SQL Server

## Usage Steps
- Make sure WinRM is enabled and reachable in VM.
- Change the username and password in the playbook site.yml to VM's admin user and password
  - ansible_become_user (Admin user)
  - ansible_become_password (Admin password)
  - ansible_user (Admin user)
  - ansible_password (Admin password)
- Arguments required for the playbook
  - SQL: SQL Server IP
- Run below command to build a SQL server
```
ansible-playbook -i {SQL Server VM IP}, --tags Standalone site.yml -e "SQL={SQL Server VM IP}"
```
