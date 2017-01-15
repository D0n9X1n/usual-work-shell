#!/bin/bash

######################################################
# findAllFileWithSameExtension
#
# $1 function which will be called when the file find
######################################################
function findAllFileWithSameExtension() {
    func=$1
    filter=$2
    if [[ x$func == x ]]; then
        echo 'no input function'
        exit
    fi
    echo "find all $filter files"
    if [[ x$filter == x ]]; then
        if [[ $sureRm == false ]]; then
            read -p "No extension, so dangerous, do you want go on? yes|no : " order
            if [[ $order != yes ]]; then
                exit
            else
                sureRm=true
            fi
        fi
    fi

    ls | while read file
        do
            if [[ -f $file ]]; then
                if [[ x$filter != x && $file =~ \.$filter ]]; then
                    echo 'do work with the func:'$func
                    $func $file
                fi
            fi

            if [[ -d $file ]]; then
                cd "$(pwd)/$file"
                findAllFileWithSameExtension $func $filter
                cd ..
            fi
        done
}

findAllFileWithSameExtension echo php
