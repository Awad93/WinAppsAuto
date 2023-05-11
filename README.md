## WinAppsAuto
WinAppAuto is a set of ansible playbooks to automate common Microsoft applications deployment with default settings and configurations for cybersecurity R&D and simulation.

The playbooks were tested on Windows Server 2016.

## Microsoft Applications
- Active Directory
- Exchange Server 2016
- SQL Server 2017

## Requirements
- Linux OS (Ubuntu preferred)
- python
- ansible
- pywinrm
- Ansible Collections
  - ansible.windows
  - community.windows

### Requirements Installation
You can refer to [Installing Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) or run the commands:

```
python -m pip install --user ansible
python -m pip install pywinrm
ansible --version
```

Once you installed Ansible, you can install the required collections by running the commands:
```
ansible-galaxy collection install ansible.windows
ansible-galaxy collection install community.windows
```
## Playbooks Usage
you can follow the README section for each application's playbook under Ansible folder, which only takes one command to start the application deployment.
- [Active Directory Guide](Ansible/DC/README.md)
- [Exchange Server Guide](Ansible/EXCH/README.md)
- [SQL Server Guide](Ansible/SQL/README.md)