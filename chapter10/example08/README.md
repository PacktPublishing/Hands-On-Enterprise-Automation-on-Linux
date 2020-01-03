# Instructions

Tested on:
- CentOS 7.6 or Ubuntu Server 18.04 LTS
- Ansible 2.8.4

Run this command:

    ansible -i hosts -m shell -a "cat /etc/passwd | grep -Ev 'root|daemon'" all
