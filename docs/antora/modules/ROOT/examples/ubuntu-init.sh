#!/bin/bash

# 初始化 Ubuntu 系统，支持 Java 开发
# Ubuntu  22.04 64位

apt update  -y
apt upgrade -y

# https://www.programbr.com/ubuntu/daemons-outdated-libraries/
sudo apt install needrestart

# 安装 jre
apt install openjdk-17-jre-headless -y
java -version

# 安装 Nginx
apt install nginx
nginx -v
# http://peacetrue.cn

# https://nginx-extras.getpagespeed.com/
# https://github.com/vozlt/nginx-module-vts
# https://github.com/vozlt/nginx-module-vts/issues/202
# nginx 监控模块：nginx-module-vts
#apt-get install nginx-extras -y
#apt-cache show nginx-extras | grep module
#apt-get install nginx-module-vts -y
#apt remove nginx-extras
#apt autoremove
# https://developer.aliyun.com/article/876253?accounttraceid=f57ab3d529c34fbfa2d4dca147842ee4irpx
cd /var/tmp || exit
wget http://nginx.org/download/nginx-1.18.0.tar.gz
tar -zxvf nginx-1.18.0.tar.gz
# git clone git://github.com/vozlt/nginx-module-vts.git
wget https://github.com/vozlt/nginx-module-vts/archive/refs/heads/master.zip
apt install unzip -y
unzip master.zip
apt install g++ gcc libpcre3 libpcre3-dev zlib1g-dev openssl libssl-dev make -y
cd nginx-1.18.0
# https://github.com/vozlt/nginx-module-vts/issues/223
./configure --with-compat --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --add-dynamic-module=../nginx-module-vts-master --with-cc-opt=-Wno-stringop-overread
make modules -Werror
mkdir -p /etc/nginx/modules
cp objs/ngx_http_vhost_traffic_status_module.so /etc/nginx/modules


# Ubuntu 22 安装 MySQL 8.0 服务端和客户端
sudo apt install mysql-server -y
mysqld --version

#登陆mysql
sudo mysql -uroot << 'EOF'
alter user 'root'@'localhost' identified with mysql_native_password by '1qw2!QW@';
use mysql;
update user set host='%' where user='root';
grant all on *.* to 'root'@''
flush privileges;
EOF
