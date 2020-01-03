# Instructions

Tested on:
- CentOS 7.6
- Ansible 2.8.4

Run this command:

    cd roles/loadmariadb/files
    git clone https://github.com/datacharmer/test_db.git
    cd ../../..
    ansible-playbook -i hosts site.yml
