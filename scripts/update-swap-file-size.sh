#!/bin/bash

# change size of swap file
swapoff /pleskswap
fallocate -l 2G /pleskswap
mkswap /pleskswap
swapon /pleskswap
swapon -s

