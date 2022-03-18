#!/usr/bin/env bash

# press control+v, u, D5 (or whatever hex value), to insert a unicode to search 'n replace'

f="$@"

recode WINDOWS-1252..utf8//TRANSLIT $f

iconv -f WINDOWS-1252 -t UTF-8//TRANSLIT $f -o $f 

# get rid of non-utf-8 chars
# the -c flag
iconv -f UTF-8 -t UTF-8//TRANSLIT $f -o $f -c

