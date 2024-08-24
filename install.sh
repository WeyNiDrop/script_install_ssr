#!/bin/bash
echo "请设置密码："
read passwd

# 要检查的文件夹路径
folder_path="/root/shadowsocksR/shadowsocks"

# 使用 -d 判断文件夹是否存在
if [ -d "$folder_path" ]; then
    echo "----installed---"
else
    echo "----install----"
    apt-get update
    apt-get install -y git
    apt-get install -y python2
    apt-get install -y screen
    cd ~
    git clone https://github.com/WeyNiDrop/shadowsocksR.git
    
    echo "----install success----"
fi

cd /root/shadowsocksR/shadowsocks
#screen -S ss
python2 server.py -p 443 -k $passwd -m aes-128-cfb -O auth_aes128_md5 -o tls1.2_ticket_auth_compatible
