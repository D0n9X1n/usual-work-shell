#!/bin/bash

function printMan() {
    echo "ALLCODE                       MIT LICENSE                         ALLCODE"
    echo ""
    echo "                  FIND THE WHOLE PROJECT CODE TO A FILE"
    echo ""
    echo "NAME"
    echo "      allCode.sh -- get all your project code"
    echo ""
    echo "SYNOPSIS"
    echo "      sh allCode.sh [-dfoh] [...]"
    echo ""
    echo "DESCRIPTION"
    echo "      If you want to get all your project code into a file. For example,"
    echo "      when you apply for a <<software copyright>>, you need to copy all"
    echo "      your project code into a doc file, which is boring and sucked. You"
    echo "      will find this script helpful."
    echo ""
    echo "     -d       Your projet directory, which use current directory default. "
    echo ""
    echo "     -f       Which extension of file type you want, such as 'java, php, sh, c'"
    echo ""
    echo "     -o       Output file name, which will generate in your home folder."
    echo ""
    echo "     -h       ReadMe"
    echo ""
    echo "EXAMPLES"
    echo "      The command:"
    echo ""
    echo "              sh allCode.sh -d . -f sh -o result.code"
    echo "      Result:"
    echo "              :!sh allCode.sh -d . -f sh -o result.code"
    echo "              into /Users/Mike/Workspace/my-shell/usual-work-shell/scripts"
    echo "              find all sh files"
    echo "              /Users/Mike/Workspace/my-shell/usual-work-shell/scripts/allCode.sh"
    echo "              /Users/Mike/Workspace/my-shell/usual-work-shell/scripts/checkWork.sh"
    echo "              /Users/Mike/Workspace/my-shell/usual-work-shell/scripts/initProject.sh"
    echo "              /Users/Mike/Workspace/my-shell/usual-work-shell/scripts/topNCoder.sh"
    echo "              finish find code, copy /tmp/result.code to your home folder..."
    echo "              done."
    echo ""
    echo "      will get all the shell code into /${HOME}/result.code"
    echo ""
    echo "MIT                           July 11, 2016                           MIT"
}


while getopts "hd:f:o:" arg
do
    case $arg in
        h)
            printMan
            ;;
        d)
            dir=$OPTARG
            ;;
        f)
            filter=$OPTARG
            ;;
        o)
            outFile=$OPTARG
            ;;
        ?)
            printMan
            out=1
            ;;
    esac
done

if [[ x$out != x ]]; then
    exit
fi

if [[ x$outFile == x ]]; then
    outFile=result.txt
fi

if [[ -z "$dir" ]] || [[ ! -d "$dir" ]]; then
    echo 'use current directory instead'
    nowdir=$(pwd)
else
    nowdir=$(cd $dir; pwd)
fi
echo "into $nowdir"

function searchFiles() {
    echo "find all $filter files"
    if [[ x$filter == x ]]; then
        cfilelist=$(ls)
    else
        cfilelist=$(ls | grep "\.$filter$")
    fi
    for cfilename in $cfilelist
    do
        if [ -f "$cfilename" ]; then
            cat $(pwd)"/$cfilename" >> /tmp/$outFile
            echo "$(pwd)/$cfilename"
        fi
    done

    dirlist=$(ls)
    for dirname in $dirlist
    do
        if [ -d "$dirname" ]; then
            cd $dirname
            searchFiles
            cd ..
        fi
    done
}

rm -rf /tmp/$outFile
cd $nowdir
searchFiles
echo "finish find code, copy /tmp/$outFile to your home folder..."
cp /tmp/$outFile ~/$outFil
echo "done"
