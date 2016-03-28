#!/bin/bash

function printMan() {
    echo "TOPNCODER                       MIT LICENSE                         TOPNCODER"
    echo ""
    echo "                  CHECK YOUR DAILY WORK IN GIT REPOSITORY"
    echo ""
    echo "NAME"
    echo "      topNCoder.sh -- find the top n most commits coder"
    echo ""
    echo "SYNOPSIS"
    echo "      sh topNCoder.sh [-nh] [num]"
    echo ""
    echo "DESCRIPTION"
    echo "      If you want to find our who commits the most, you can use the script."
    echo ""
    echo "     -n       How many users you want to check"
    echo ""
    echo "     -h       How to use the script."
    echo ""
    echo "EXAMPLES"
    echo "      The command:"
    echo ""
    echo "              sh topNCoder.sh -n 1"
    echo ""
    echo "      will print who take the most commits"
    echo ""
    echo "      Here is the resulat:"
    echo ""
    echo "                 4 Mike Tang"
    echo ""
    echo "      The command:"
    echo ""
    echo "              sh topNCoder.sh"
    echo ""
    echo "      will print the commit list order by the commit times."
    echo ""
    echo "MIT                             March 16, 2016                            MIT"
}

while getopts "hn:" arg
do
    case $arg in
        h)
            printMan
            ;;
        n)
            num=$OPTARG
            ;;
        ?)
            printMan
            out=1
            ;;
    esac
done

if [[ x$out == x ]]; then
    if [[ x$num == x ]]; then
        git log --pretty='%aN' | sort | uniq -c | sort -k1 -n -r
    else
        git log --pretty='%aN' | sort | uniq -c | sort -k1 -n -r | head -n $num
    fi
fi
