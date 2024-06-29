Role Name
=========

Describe the role


Requirements
------------

Mention pre-requisites that may not be covered by Ansible itself

Role Variables
--------------

A description of variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.).

| Variable                | Required | Default | Choices                   | Comments                                 |
|-------------------------|----------|---------|---------------------------|------------------------------------------|
| foo                     | no       | false   | true, false               | example variable                         |
| bar                     | yes      |         | lemon, lime               | example variable                         |

Dependencies
------------

Mention dependancies outlined in meta/main.yml


Example Playbook
----------------

Including an example of how to use your role (include variables passed in as parameters):

    - hosts: all
      roles:
         - ansible-role-template

License
-------

See LICENSE.md

Author Information
------------------

Brandon Foos
git@bfoos.com

