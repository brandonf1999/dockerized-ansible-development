
echo "docker build -t ansible-controller:latest $(pwd)/" > /usr/local/sbin/ansible-playbook
echo 'docker run ansible-controller ansible-playbook $@' >> /usr/local/sbin/ansible-playbook
chmod 770 /usr/local/sbin/ansible-playbook

echo "docker build -t ansible-controller:latest $(pwd)/" > /usr/local/sbin/ansible
echo 'docker run ansible-controller ansible $@' >> /usr/local/sbin/ansible
chmod 770 /usr/local/sbin/ansible




