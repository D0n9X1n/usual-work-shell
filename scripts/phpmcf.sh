#!/bin/bash

function printMan() {
    echo "ALLCODE                       MIT LICENSE                         ALLCODE"
    echo ""
    echo "                  FORMAT YOUR WHOLE PHP PROJECT CODE"
    echo ""
    echo "NAME"
    echo "      phpmcf.sh -- format all your php project code"
    echo ""
    echo "SYNOPSIS"
    echo "      sh phpmcf.sh [-d] [...]"
    echo ""
    echo "DESCRIPTION"
    echo "      Think about this, members in your php dev team, who like using vim or phpstorm"
    echo "      or emacs or sublime, but without a code format standard, which will cause a "
    echo "      huge problem for a long term. So here comes a solution."
    echo ""
    echo "     -d       Your projet directory, which use current directory default. "
    echo ""
    echo "     -h       ReadMe"
    echo ""
    echo "EXAMPLES"
    echo "      The command:"
    echo "          sh phpmcf.sh -d ."
    echo "      Result:"
    echo "          into /Users/Mike/Workspace/my-shell/usual-work-shell"
    echo "          find all php files in /Users/Mike/Workspace/my-shell/usual-work-shell"
    echo "          find all php files in /Users/Mike/Workspace/my-shell/usual-work-shell/scripts"
    echo "          find all php files in /Users/Mike/Workspace/my-shell/usual-work-shell/scripts/lib"
    echo "          find all php files in /Users/Mike/Workspace/my-shell/usual-work-shell/scripts/lib/phpcf"
    echo "          find all php files in /Users/Mike/Workspace/my-shell/usual-work-shell/scripts/lib/phpcf/phpcf-src"
    echo "          /Users/Mike/Workspace/my-shell/usual-work-shell/scripts/lib/phpcf/phpcf-src/phpcf.php does not need formatting"
    echo "          format /Users/Mike/Workspace/my-shell/usual-work-shell/scripts/lib/phpcf/phpcf-src/phpcf.php"
    echo "          find all php files in /Users/Mike/Workspace/my-shell/usual-work-shell/scripts/lib/phpcf/phpcf-src/ext"
    echo "          find all php files in /Users/Mike/Workspace/my-shell/usual-work-shell/scripts/lib/phpcf/phpcf-src/src"
    echo "          done."
    echo ""
    echo "WISH YOU A HAPPY DAY."
    echo ""
    echo "MIT                           July 11, 2016                           MIT"
}

while getopts "hd:" arg
do
    case $arg in
        d)
            dir=$OPTARG
            ;;
        h)
            printMan
            out=1
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

if [[ -z "$dir" ]] || [[ ! -d "$dir" ]]; then
    echo 'use current directory instead'
    nowdir=$(pwd)
else
    nowdir=$(cd $dir; pwd)
fi
echo "into $nowdir"

function findPhpFile() {
    echo "find all php files in $(pwd)"
    cfilelist=$(ls | grep "\.php$")
    for cfilename in $cfilelist
    do
        if [ -f "$cfilename" ]; then
            /usr/local/bin/lib/phpcf/phpcf apply $(pwd)"/$cfilename"
            echo "format $(pwd)/$cfilename"
        fi
    done

    dirlist=$(ls)
    for dirname in $dirlist
    do
        if [ -d "$dirname" ]; then
            cd $dirname
            findPhpFile
            cd ..
        fi
    done
}

cd $nowdir
findPhpFile
echo "done."
