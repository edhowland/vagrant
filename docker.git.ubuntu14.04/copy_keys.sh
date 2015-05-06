#!/bin/bash
# copy_keys.sh - copy some keys to vagrant instance


vagrant ssh-config > copy.config
for f in $*
do
 b=`basename $f`  
  scp -F copy.config $f default:./.ssh/git.${b}
done


