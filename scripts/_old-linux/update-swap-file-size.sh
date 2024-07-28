#!/bin/bash

f="/pleskswap"

# change size of swap file
swapoff $f
fallocate -l 2G $f
mkswap $f
swapon $f
swapon -s

