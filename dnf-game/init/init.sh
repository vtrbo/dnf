#! /bin/bash

# 赋予权限
chmod 777 -R /tmp
cd /home/template/init/

# 判断Script.pvf文件是否初始化过
if [ ! -f "/game/Script.pvf" ];then
  tar -zxvf /home/template/init/Script.tgz
  # 拷贝版本文件到持久化目录
  cp /home/template/init/Script.pvf /game/
  echo "init Script.pvf success"
else
  echo "Script.pvf has already initialized, do nothing!"
fi

# 判断df_game_r文件是否初始化过
if [ ! -f "/game/df_game_r" ];then
  # 拷贝版本文件到持久化目录
  cp /home/template/init/df_game_r /game/
  echo "init df_game_r success"
else
  echo "df_game_r has already initialized, do nothing!"
fi

# 判断privatekey.pem文件是否初始化过
if [ ! -f "/game/privatekey.pem" ];then
  # 拷贝版本文件到持久化目录
  cp /home/template/init/privatekey.pem /game/
  echo "init privatekey.pem success"
else
  echo "privatekey.pem has already initialized, do nothing!"
fi

# 判断publickey.pem文件是否初始化过
if [ ! -f "/game/publickey.pem" ];then
  # 拷贝版本文件到持久化目录
  cp /home/template/init/publickey.pem /game/
  echo "init publickey.pem success"
else
  echo "publickey.pem has already initialized, do nothing!"
fi
