## 0. 关于镜像

> **参考wp、typecho后重新定制的镜像，抛弃臃肿的LNMP环境，可直接运行**
> **如果需要进入镜像内部 (Linux Bash Shell)，请参考下面的教程！**

## 1. 镜像说明

此镜像基于`php:7.3-alpine` 作为母镜像，集成了`ZFAKA`程序运行所需的所有环境，包括`yaf` 扩展等。抛弃传统的LNMP环境，极大程度精简了镜像体积，使得镜像拉取速度更快，占用资源更低。

(*)另外，修复了因缺少`bcmatch`扩展导致的支付故障。

DEMO：https://mall.baiyue.one

## 2. 使用方法

**如果是正式商用环境，请直接参考4**

程序启动命令行：

```
docker run --name zfaka-mysql -e MYSQL_DATABASE=faka -e MYSQL_ROOT_PASSWORD=baiyue.one -d -v - /opt/zfaka/mysql:/var/lib/mysql mysql:5.5   #安装数据库(数据库密码为baiyue.one，可自主替换)
docker run -itd -p 3002:80 -v /opt/zfaka:/var/www/html --link zfaka-mysql:mysql --name zfaka baiyuetribe/zfaka  #运行ZFAKA程序
```

程序运行必要组件：`数据库`+`ZFAKA程序`

- 关于数据库：可自定义修改数据库密码，替换`baiyue.one`为你自己的密码，不替换也行，因为外网无法访到数据库（没有映射端口）;默认数据存储文件路径`/opt/zfaka/mysql`
- 关于ZFAKA程序：默认端口为`3002` ，可自定义修改；默认源码存放路径`/opt/zfaka` 

如需域名访问，请设置域名反代。参考：[如何设置域名反代任意端口？](https://baiyue.one/archives/527.html)

## 3. 进入Docker Bash Shell

有的时候需要进入Docker镜像的Bash Shell进行修改，只需执行以下命令：

```
docker exec -it zfaka sh
```

## 4.如何管理代码及修改数据库？

有时候需要`phpadmin`来管理数据库或使用`kodexplorer`来管理源码文件，这时候需要增加多个容器。因此，本站也做了`docker-compose.yml`来直接启动所有工具，一步到位。

```
wget https://raw.githubusercontent.com/Baiyuetribe/zfaka/docker/docker-compose.yml
docker-compose up -d
```

说明：

- ZFAKA主程序入口为：`http://域名:3002` 打开后填入数据库密码即可完成安装步骤。
- phpadmin入口：`http://域名:8080`  用来修改数据库
- kodexplore入口：`http://域名:999` 用来管理源码或替换图片等等。

## 4. Bugfix的记录以及感谢

- (2019/06/3) 修复了启动过程中，unzip配置参数错误，导致第二次启动时出现提示确认覆盖，发生异常的错误 (感谢 ShawnJi)
- （2019/7/3）感谢`yangxuan8282`大佬的Docker笔记，使得原本庞大的LNMP环境变为极简轻便的alpine环境。

## 5. 联系作者 & 求打赏！

QQ群：635925514 

Docker使用问题反馈：<https://github.com/Baiyuetribe/zfaka/pulls>

项目来源：<https://github.com/zlkbdotnet/zfaka>

