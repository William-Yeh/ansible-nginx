
williamyeh.nginx for Ansible Galaxy
============

[![Circle CI](https://circleci.com/gh/William-Yeh/ansible-nginx.svg?style=shield)](https://circleci.com/gh/William-Yeh/ansible-nginx) [![Build Status](https://travis-ci.org/William-Yeh/ansible-nginx.svg?branch=master)](https://travis-ci.org/William-Yeh/ansible-nginx)


## Summary

Role name in Ansible Galaxy: **[williamyeh.nginx](https://galaxy.ansible.com/williamyeh/nginx/)**

This Ansible role has the following features for Nginx:

 - Install specific version.
 - Handlers for restart/reload/stop events;
 - Bare bone configuration (*real* configuration should be left to user's template files; see **Usage** section below).




## Role Variables

### Mandatory variables

None.




### Optional variables

User-installable configuration files (by Ansible's template system):


```yaml
# main conf template to be installed to "/etc/nginx/nginx.conf";
# relative to `playbook_dir`
nginx_conf_main


# other conf templates to be installed to "/etc/nginx/conf.d";
# dict fields:
#   - key: memo for this conf
#   - value:
#     - src:  template file relative to `playbook_dir`
#     - dest: target file relative to `/etc/nginx/conf.d/`
nginx_conf_others
```


User-configurable defaults:


```yaml
# Nginx version; e.g., "1.8.1"
# Will install the default (usually the latest stable) version, if not specified.
nginx_version


# start the service at the end of the role?
# default: True
nginx_start      


# uid of worker process;
# default: "nginx".
nginx_user


# for worker_rlimit_nofile in nginx.conf
nginx_ulimit:  51200

# for worker_connections in nginx.conf
nginx_worker_connections:  1024


# install health-check endpoint "http://HOST:PORT/nginx_status"?
nginx_status:  False

# use `service` command to start/restart nginx daemon?
nginx_use_service:  True
```


## Handlers

- `restart nginx`

- `reload nginx`

- `stop nginx`



## Usage


### Step 1: add role

Add role name `williamyeh.nginx` to your playbook file.


### Step 2: add variables

Set vars in your playbook file.

Simple example:

```yaml
---
# file: simple-playbook.yml

- hosts: all

  roles:
    - williamyeh.nginx

  vars:
    nginx_version: 1.8.1
```


### Step 3: copy user's config files, if necessary


More practical example:

```yaml
---
# file: complex-playbook.yml

- hosts: all

  roles:
    - williamyeh.nginx

  vars:
    nginx_version: 1.8.1

    nginx_conf_main: "templates/nginx.conf.j2"

    nginx_conf_others:
      conf_template_for_app_1:
        src: "templates/app-1.conf.j2"
        dest: app-1.conf
      conf_template_for_app_2:
        src: "templates/app-2.conf.j2"
        dest: app-2.conf
```


## Dependencies

None.


## License

MIT License. See the [LICENSE file](LICENSE) for details.


## History

Rewritten from my pre-Galaxy version: [server-config-template](https://github.com/William-Yeh/server-config-template).

During refactoring, some roles on Ansible Galaxy also inspired me:

  - [Stouts.nginx](https://github.com/Stouts/Stouts.nginx)
  - [MatthewMi11er.nginx](https://github.com/MatthewMi11er/ansible-role-nginx)
