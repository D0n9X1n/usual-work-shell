#!/bin/bash
function createGitIgnore() {
    echo '# Created by .ignore support plugin (hsz.mobi)
### *.iml template


### .git template


### Tags template
# Ignore tags created by etags, ctags, gtags (GNU global) and cscope
TAGS
!TAGS/
tags
!tags/
gtags.files
GTAGS
GRTAGS
GPATH
cscope.files
cscope.out
cscope.in.out
cscope.po.out



### Xcode template
build/
*.pbxuser
!default.pbxuser
*.mode1v3
!default.mode1v3
*.mode2v3
!default.mode2v3
*.perspectivev3
!default.perspectivev3
xcuserdata
*.xccheckout
*.moved-aside
DerivedData
*.xcuserstate


### Java template
*.class

# Mobile Tools for Java (J2ME)
.mtj.tmp/

# Package Files #
*.jar
*.war
*.ear

# virtual machine crash logs, see http://www.java.com/en/download/help/error_hotspot.xml
hs_err_pid*


### *.classpath template


### JetBrains template
# Covers JetBrains IDEs: IntelliJ, RubyMine, PhpStorm, AppCode, PyCharm

*.iml

## Directory-based project format:
.idea/
# if you remove the above rule, at least ignore the following:

# User-specific stuff:
.idea/workspace.xml
.idea/tasks.xml
.idea/dictionaries

# Sensitive or high-churn files:
.idea/dataSources.ids
.idea/dataSources.xml
.idea/sqlDataSources.xml
.idea/dynamic.xml
.idea/uiDesigner.xml

# Gradle:
# .idea/gradle.xml
# .idea/libraries

# Mongo Explorer plugin:
# .idea/mongoSettings.xml

## File-based project format:
*.ipr
*.iws

## Plugin-specific files:

# IntelliJ
out/

# mpeltonen/sbt-idea plugin
.idea_modules/

# JIRA plugin
atlassian-ide-plugin.xml

# Crashlytics plugin (for Android Studio and IntelliJ)
com_crashlytics_export_strings.xml
crashlytics.properties
crashlytics-build.properties


### Vim template
[._]*.s[a-w][a-z]
[._]s[a-w][a-z]
*.un~
Session.vim
.netrwhist
*~


### *.settings template
*.settings
*.settings/

### Maven template
target/
pom.xml.tag
pom.xml.releaseBackup
pom.xml.versionsBackup
pom.xml.next
release.properties
dependency-reduced-pom.xml


### Linux template
*~

# KDE directory preferences
.directory

# Linux trash folder which might appear on any partition or disk
.Trash-*


### OSX template
.DS_Store
.AppleDouble
.LSOverride

# Icon must end with two \r
Icon

# Thumbnails
._*

# Files that might appear in the root of a volume
.DocumentRevisions-V100
.fseventsd
.Spotlight-V100
.TemporaryItems
.Trashes
.VolumeIcon.icns

# Directories potentially created on remote AFP share
.AppleDB
.AppleDesktop
Network Trash Folder
Temporary Items
.apdisk' > .gitignore
}

function createLicense() {
    echo 'Copyright © 2016 TangDongxin

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.' > LICENSE
}


project=$1

if [[ X$project == X ]]; then
    echo 'No project Name'
else
    echo 'Creating ' $project
    mkdir $project
    cd $project
    echo 'Creating LICENSE ( MIT )'
    createLicense
    echo 'Finish LICENSE'
    echo 'Creating .gitignore'
    createGitIgnore
    echo 'Finish .gitignore'
    touch ReadMe.md
    echo 'Finish Create Project: ' $project ' .Enjoy coding!'
fi

