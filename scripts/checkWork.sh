#!/bin/bash

function printMan() {
    echo "CHECKWORK                       MIT LICENSE                         CHECKWORK"
    echo ""
    echo "                  CHECK YOUR DAILY WORK IN GIT REPOSITORY"
    echo ""
    echo "NAME"
    echo "      checkWork.sh -- check git project work"
    echo ""
    echo "SYNOPSIS"
    echo "      sh checkWork.sh [-udh] [user ...]"
    echo ""
    echo "DESCRIPTION"
    echo "      If you want to check your work in a git repository. For example,"
    echo "      you want to check today's work, how many line code you add, in"
    echo "      total, and how many lines code you delete. You can use the shell."
    echo ""
    echo "     -u       The user you want to check his code contribution.  "
    echo ""
    echo "     -d       How many days you want to check."
    echo ""
    echo "EXAMPLES"
    echo "      The command:"
    echo ""
    echo "              sh checkWork.sh -u mike -d 1"
    echo ""
    echo "      will print mike's today work, such as code lines (add, delete, total)"
    echo ""
    echo "      Here is the resulat:"
    echo ""
    echo "             added lines: 226 removed lines : 2 total lines: 224 "
    echo ""
    echo "      The command:"
    echo ""
    echo "              sh checkWork.sh"
    echo ""
    echo "      will print default user (your git config), and today's work"
    echo ""
    echo "MIT                             March 16, 2016                             MIT"
}

while getopts "hd:u:" arg
do
    case $arg in
        h)
            printMan
            out=1
            ;;
        u)
            user=$OPTARG
            ;;
        d)
            day=$OPTARG
            ;;
        ?)
            printMan
            out=1
            ;;
    esac
done
if [[ x$out == x ]]; then
    if [[ x$user == x ]]; then
        if [[ x$day == x ]]; then
            git log --since=1.day --author="$(git config --get user.name)" --pretty=tformat: --numstat | gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added lines: %s removed lines : %s total lines: %s\n",add,subs,loc }' -
        else
            git log --since=$day.days --author="$(git config --get user.name)" --pretty=tformat: --numstat | gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added lines: %s removed lines : %s total lines: %s\n",add,subs,loc }' -
        fi
    else
        if [[ x$day == x ]]; then
            git log --since=1.day --author="$user" --pretty=tformat: --numstat | gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added lines: %s removed lines : %s total lines: %s\n",add,subs,loc }' -
        else
            git log --since=$day.days --author="$user" --pretty=tformat: --numstat | gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added lines: %s removed lines : %s total lines: %s\n",add,subs,loc }' -
        fi
    fi
fi

