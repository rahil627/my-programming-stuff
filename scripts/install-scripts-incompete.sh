#!/usr/bin/env bash

# seems incomplete...

# TODO: does this work if it exists?
mkdir -p ~/bin

# TODO: add ~/bin to $PATH

# list scripts to copy here
user-bin-path='~/bin'
files=(
  filename1
  filename2
  filename3
)

for file in "${files[@]}"; do
    cp "$file" user-bin-path
done

