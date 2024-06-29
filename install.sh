
echo "docker build -t ansible-controller $(pwd)/" > /usr/local/sbin/ansible-playbook
echo "docker run ansible-controller ansible-playbook" >> /usr/local/sbin/ansible-playbook
chmod 770 /usr/local/sbin/ansible-playbook



