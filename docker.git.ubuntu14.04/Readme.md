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

This will scp your RSA keys to the vagrant instance and copy them to /home/vagrant/.ssh/git.id_rsa.pub and git.id_rsa
It also chmods them to rw--.

## Pairing with another programmer
First setup a reverse ssh tunnel to Digital Ocean:

```
  /usr/bin/ssh -R 12322:localhost:22 104.236.142.158
```


Note: Leave this session running (you are logged into Digital Ocean as you)
Open a new Terminal windo.
Then after your other programmer has logged into your machine, you need to setup a screen session together. First, determine your pseudo tty:

```
  who am i
```

Then chmod the tty (e.g. /dev/ttys001) for read+write for group+other:

```
  chmod go+rw /dev/ttys001 # substitute your current tty
```

then switch to that other user:

```
  sudo su - rwcitek   # substitute the other user's user id
```

Now, start the screen session:
```
  screen -S foobar
```

The other user should:
```
  screen -x foobar
```

At this point, you're both loggend in as the other usr (rwcitek)
Depending on which user hosts the files you want to 
pair, you might want to do the following:
```
  # in the screen session
  su - edhowland @ type password for edhowland (you)
  # execute chdirs and stuff to get to your working folders
```
