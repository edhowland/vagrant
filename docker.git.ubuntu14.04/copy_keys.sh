#!/bin/bash
# copy_keys.sh - copy some keys to vagrant instance

usage='./copy_keys.sh key1 [ key2]\nkey1 and key2 are a private and public key pair'
err_msg="Wrong number of arguments\n$usage"

die() {
  echo $*
  exit 1
}


# check for at least 1 argument
 [ $# -ge 1 ] || die $err_msg

vagrant ssh-config > copy.config
for f in $*
do
 b=`basename $f`  
  scp -F copy.config $f default:./.ssh/git.${b}
  ssh -F copy.config default "chmod 600 ./.ssh/git.$b"
done

rm copy.config


