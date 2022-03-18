#!/bin/bash

# DO NOT EXECUTE ME !!!

# most useful commands in this section

# use this to find the file, then use | to chain the command
# no more hunting for files!
# the search i think is automatically recursive
find . -name *.ext
find . some*text


# end of most useful commands


# diff
git diff HEAD
git diff file-path

diff file-path file-path-2 --color --side-by-side
diff folder-path folder-path-2 --color --side-by-side



# change file encoding

# get encoding of the file
file -i file-path

# convert encoding
iconv -f ISO-8859-1 -t UTF-8//TRANSLIT in-file -o out-file

# convert encoding of multiple files in the current directory
# #!/bin/bash

FROM_ENCODING="value_here" # set this
TO_ENCODING="UTF-8//TRANSLIT" # UTF-8 is the standard encoding, //TRANSLIT tries to transliterate to a similar character, otherwise can remove it

CONVERT=" iconv  -f   $FROM_ENCODING  -t   $TO_ENCODING"

for  file  in  *.txt; do
     $CONVERT   "$file"   -o  "${file%.txt}-utf8" # safer than overwriting
done
exit 0


# get file-path of shell
which zsh

# change default shell used when you login
# it will then prompt you asking for the file-path of the shell
chsh


# append a folder-path to the $PATH environment var
# so that programs ("binaries") in it can be invoked via command line
echo $PATH
export PATH = $PATH:/path/to/bi


# update swap file

# check size and name of swap file
swapon -s

# create a new swapfile
dd if=/dev/zero of=/tempswap bs=1M count=1024 #1GB file
mkswap /tempswap
swapon /tempswap


# update size of swap file
# /swapfile is a file-path
swapoff /swapfile
fallocate -l 2G /swapfile
mkswap /swapfile
swapon /swapfile
swapon -s


# i will never understand linux's file structre, wtf!!
# NOTHING is standardized!!! ahhhhhh
cp init.vim ~/.config/nvim/init.vim

# replace file extensions in folder
# https://unix.stackexchange.com/questions/78821/how-can-i-rename-all-files-with-one-extension-to-a-different-extension-recursive#78822
find some_folder -type f -name "*.bub" | 
    sed "s/\.bub$//" | 
    xargs -I% mv -iv %.bub %.aaa
    
# function version
# use: $ extmv some_folder/ bub aaa
$ extmv () {
    find "${1}" -type f -name "*.${2}" | 
    sed "s/\.${2}$//" | 
    xargs -I% mv -iv "%.${2}" "%.${3}"
}

