#!/bin/bash

N=$1
if [[ $N ]]; then
    git log --pretty='%aN' | sort | uniq -c | sort -k1 -n -r | head -n $N
else
    git log --pretty='%aN' | sort | uniq -c | sort -k1 -n -r
fi
