# Start with a base image of Rocky Linux 9
FROM rockylinux/rockylinux:9

LABEL maintainer="Brandon Foos <git@bfoos.com>"
LABEL version="1.0"
LABEL description="Portable ansible development and execution environment"

# Install necessary packages
RUN dnf update -y && \
    dnf install -y \
        openssh-clients \
        python3-pip \
        python3-devel \
        openssl-devel \
        libffi-devel \
        gcc \
        git && \
    dnf clean all && \
    pip3 install --upgrade pip 

# Create application user
RUN useradd -m -s /bin/bash ansible

# Switch to 'ansible' user
USER ansible
WORKDIR /opt/ansible

# Set the home directory for the new user
ENV HOME=/home/ansible
RUN mkdir -p $HOME && chown ansible:ansible $HOME

# Set environment variables
ENV ANSIBLE_HOST_KEY_CHECKING=False
ENV PATH=$HOME/.local/bin:$PATH

# Copy requirements
COPY ansible/requirements.yml /opt/ansible/
COPY python/requirements.txt /opt/python/

# Install pip modules and ansible collections for user
RUN pip3 install --user -r /opt/python/requirements.txt && \
    ansible-galaxy collection install -r /opt/ansible/requirements.yml

# Copy requirements
COPY ansible /opt/ansible/
COPY python /opt/python/

# Switch to 'root' user
USER root

# Set permissions
RUN chown -R ansible:ansible /opt/ansible && \
    chown -R ansible:ansible /opt/python && \
    find /opt/ansible -type f -exec chmod 660 {} + && \
    find /opt/ansible -type d -exec chmod 770 {} + && \
    find /opt/python -type f -exec chmod 660 {} + && \
    find /opt/python -type d -exec chmod 770 {} + 

# Switch to 'ansible' user
USER ansible
WORKDIR /opt/ansible

# Default command is to run bash
CMD ["ansible-playbook"]

