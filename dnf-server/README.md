# dnf服务端

## 说明

1. 使用`libhook.so`优化了CPU占用,1-2分钟出五国，占用10%以内
2. 集成了DP2插件，默认不开启，使用环境变量DP2开启。采用了加载器2方式(替换libGeoIP.so.1)
3. game密码限制必须8位，否则无法连接
4. 由于无法更改dnf连接mysql的端口配置，使用了rinetd映射mysql的ip和端口，配置文件在 `/etc/rinetd.conf`
5. 修改环境变量重启即刻生效

## 启动

详见[docker-compose.yml](docker-compose.yml)

## DP2插件说明

持久化 ./game/dp2/ ，映射到容器中 /dp2/ <br/>
df_game_r.lua 中编写插件，调用到脚本就将脚本放入 script 中。<br/>
容器集成了 mysql 客户端，脚本中需要执行sql命令时，命令为 `mysql -h127.0.0.1 -ugame -p$GAME_PASSWORD`。

## 环境变量

AUTO_MYSQL_IP: 和dnfmysql使用统一自定义网桥使用，支持自动获取mysql的ip

MYSQL_NAME: dnfmysql容器名，用户自动获取mysql的ip

MYSQL_IP: mysql的ip

MYSQL_PORT: mysql的端口

GAME_PASSWORD: game账户密码，必须8位

AUTO_PUBLIC_IP: 自动获取公网ip

PUBLIC_IP: 你的ip地址

DP2: dp2插件
