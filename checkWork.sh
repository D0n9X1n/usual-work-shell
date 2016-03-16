#!/bin/bash

##################################################################################
# Usage: use sh checkWork.sh (optional)username
# for example: sh checkWork.sh mike
# if you don't have username, the shell will find your default git user
##################################################################################

user=$1
if [[ $user ]]; then
    git log --author="$user" --pretty=tformat: --numstat | gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added lines: %s removed lines : %s total lines: %s\n",add,subs,loc }' -
else
    git log --author="$(git config --get user.name)" --pretty=tformat: --numstat | gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added lines: %s removed lines : %s total lines: %s\n",add,subs,loc }' -
fi
