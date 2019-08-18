# ZFAKA发卡系统(新增易支付+payjs,共计17中支付接口)

# 说明：

## 易支付对接参考来源：
https://github.com/anhao/zfaka-epay-sdk

## payjs对接参考来源：
https://github.com/hiyouli/payjs-for-zfaka


注意：本站参考以上两个开源sdk说明完成对接，未实际测试两个支付接口。若测试有bug可以积极反馈。

# 安装步骤：

## 方法1.宝塔版本与普通安装方法一致。（此处忽略）

源码下载地址：https://github.com/Baiyuetribe/zfaka/archive/epay-payjs.zip

## Docker版安装(适用于服务器（ubuntu\debian\centos7...）、win10、Macos、树莓派等)：

首先安装docker服务

```
 echo y | bash <(curl -L -s https://raw.githubusercontent.com/Baiyuetribe/codes/master/docker.sh)
```
其次安装ZFAKA程序

```bash
mkdir -p /opt/zfaka && cd /opt/zfaka        #创建本地源码存储路径
wget https://raw.githubusercontent.com/Baiyuetribe/zfaka/epay-payjs/docker-compose.yml
docker-compose up -d
```

程序源码存储路径 `/opt/zfaka` ;

- 安装后网站地址：http://ip:3002;

- phpadmin地址：http://ip:8080

- 文件管理地址：http://ip:999

## 其它操作：

- 停止ZFAKA：`cd /opt/zfaka && docker-compose stop`

- 卸载ZFAKA：`cd /opt/zfaka && docker-compose down`

- 删除本地源码及数据库： `rm -rf /opt/zfaka`


![](https://img.baiyue.one/upload/2019/08/5d595d465de69.png)