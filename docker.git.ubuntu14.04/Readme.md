# Ubuntu 14.04 with ansible, git, git-flow, and Docker

The Vagrantfile starts an Ubuntu 14.04 box and then installs
ansible, git, git-flow, and Docker.  Once ansible is installed,
it uses ansible to install and configure the other components.
This makes the Vagrantfile idempotent and can be run multiple
times with either of these commands:

```
  vagrant up --provision # if VM is not running
  vagrant provision  # if VM is running
```

## Copy public/private key pairs used with git

Once vagrant is up and running, you should check it to see if you can ssh to it:
    ```
    vagrant ssh
    ```

If this works, then use the ./copy_keys.sh to scp the key pair you want git to use inside your instance
    ```
    ./copy_keys.sh ~/.ssh/id_rsa*
    ```
