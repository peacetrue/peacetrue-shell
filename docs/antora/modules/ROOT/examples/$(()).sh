#!/bin/bash

# see https://www.linuxprobe.com/bash-shell-difference.html

a=5;b=7;c=2;

echo "\$a+\$b: $a + $b"
echo "\$(a+b*c): $(( a+b*c ))"
echo "\$(( a+b*c )): $(( a+b*c ))"
echo "\$(((a+b*c))): $(((a+b*c)))"
echo "\$((\$a+\$b*\$c)): $(( $a+$b*$c ))"
