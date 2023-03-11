#!/bin/bash

# see https://www.linuxprobe.com/bash-shell-difference.html

a=5
a=$(( a+1 ))
(( a=a+1 ))
echo "((a++)): $a" # 7
# echo "((a++)): " (( a > 1))
