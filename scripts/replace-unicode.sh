#!/usr/bin/env bash

# a few search and replaces

# get file-path from first argument
#f=$1
#f="$@"
f="$*"

sed -i "s//'/g" $f
sed -i "s//'/g" $f
sed -i 's//"/g' $f
sed -i 's//"/g' $f
sed -i 's//-/g' $f
sed -i 's///g' $f

# i dont remember what to replace with, i was tired
sed -i 's///g' $f


sed -i 's/Ò//g' $f



