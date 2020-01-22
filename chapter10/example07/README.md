# Instructions

Tested on:
- CentOS 7.6
- Ansible 2.8.4
- ansible-freeipa, Github commit 5bb44245c6c43d752c1e066ebdc6cb3eb0253d98

Run this command:

    git clone https://github.com/freeipa/ansible-freeipa
    cd ansible-freeipa

    ln -s ~/ansible-freeipa/roles/ ~/.ansible/
    mkdir ~/.ansible/plugins
    ln -s ~/ansible-freeipa/plugins/modules ~/.ansible/plugins/
    ln -s ~/ansible-freeipa/plugins/module_utils/ ~/.ansible/plugins/

    ansible-playbook -i hosts ~/ansible-freeipa/playbooks/install-client.yml
