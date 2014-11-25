
williamyeh.nginx for Ansible Galaxy
============


## Summary

Role name in Ansible Galaxy: **[williamyeh.nginx](https://galaxy.ansible.com/list#/roles/2245)**

This Ansible role has the following features for Nginx:

 - Install specific version.
 - Handlers for restart/reload/stop events;
 - Bare bone configuration (*real* configuration should be left to user's template files; see **Usage** section below).




## Role Variables

### Mandatory variables

Variables needed to be defined in user's playbook:

```yaml
nginx_version
```

For example:

```yaml
nginx_version: 1.6.2
```



### Optional variables

User-configurable defaults:


```yaml
# which daemon user?
nginx_user:  nginx

# for worker_rlimit_nofile in nginx.conf
nginx_ulimit:  51200

# for worker_connections in nginx.conf
nginx_worker_connections:  1024

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
    nginx_version: 1.6.2
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
    nginx_version: 1.6.2

  tasks:
    - name: Copy project-specific config file(s) for Nginx 
      template: src=templates/nginx.conf.j2  dest=/etc/nginx/nginx.conf
      template: src=templates/app-1.conf.j2  dest=/etc/nginx/conf.d/app-1.conf
      template: src=templates/app-2.conf.j2  dest=/etc/nginx/conf.d/app-2.conf
      notify:
        - reload nginx
```


## Dependencies

None.


## License

Licensed under the Apache License V2.0. See the [LICENSE file](LICENSE) for details.


## History

Rewritten from my pre-Galaxy version: [server-config-template](https://github.com/William-Yeh/server-config-template).

During refactoring, some roles on Ansible Galaxy also inspired me:

  - [Stouts.nginx](https://github.com/Stouts/Stouts.nginx)
  - [MatthewMi11er.nginx](https://github.com/MatthewMi11er/ansible-role-nginx)

