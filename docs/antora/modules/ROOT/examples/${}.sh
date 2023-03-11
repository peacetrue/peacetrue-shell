#!/bin/bash

# see https://www.linuxprobe.com/bash-shell-difference.html

file=/dir1/dir2/dir3/my.file.txt

echo "\${#file}: ${#file}"

# 删除
echo "file: $file"
echo "\${file}: ${file}"
echo "\${file#*/}: ${file#*/}"
echo "\${file##*/}: ${file##*/}"
echo "\${file%/*}: ${file%/*}"
echo "\${file%%/*}: ${file%%/*}"

# 截取
echo "\${file:0:5}: ${file:0:5}"
echo "\${file:5:5}: ${file:5:5}"

# 替换
echo "\${file/dir/path}: ${file/dir/path}"
echo "\${file//dir/path}: ${file//dir/path}"

# 默认值
unset file
echo "\${file-my.file.txt}: ${file-my.file.txt}"
file=
echo "\${file:-my.file.txt}: ${file:-my.file.txt}"
echo "\${file+my.file.txt}: ${file+my.file.txt}"
file=1
echo "\${file:+my.file.txt}: ${file:+my.file.txt}"

unset file
echo "\${file=my.file.txt}: ${file=my.file.txt}"
file=
echo "\${file:=my.file.txt}: ${file:=my.file.txt}"
unset file
echo "\${file?my.file.txt}: ${file?my.file.txt}"
file=
echo "\${file:?my.file.txt}: ${file:?my.file.txt}"

