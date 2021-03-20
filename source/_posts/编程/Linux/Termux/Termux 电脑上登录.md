---
title: Termux 电脑上登录
categories:
  - 编程
  - Linux
  - Termux
abbrlink: c3146b3e
date: 2019-11-01 11:37:04
updated: 2019-12-17 05:18:52
---
<div id='my_toc'><a href="/blog/c3146b3e/#下载安装Xshell免费版" class="header_1">下载安装Xshell免费版</a>&nbsp;<br><a href="/blog/c3146b3e/#进入中文官网" class="header_2">进入中文官网</a>&nbsp;<br><a href="/blog/c3146b3e/#填写邮箱获取下载链接" class="header_2">填写邮箱获取下载链接</a>&nbsp;<br><a href="/blog/c3146b3e/#接收邮件-并下载" class="header_2">接收邮件 并下载</a>&nbsp;<br><a href="/blog/c3146b3e/#使用Xshell创建秘钥" class="header_1">使用Xshell创建秘钥</a>&nbsp;<br><a href="/blog/c3146b3e/#Xshell创建秘钥详细过程" class="header_2">Xshell创建秘钥详细过程</a>&nbsp;<br><a href="/blog/c3146b3e/#保存公钥" class="header_2">保存公钥</a>&nbsp;<br><a href="/blog/c3146b3e/#导出私钥并保存" class="header_2">导出私钥并保存</a>&nbsp;<br><a href="/blog/c3146b3e/#将Xshell创建的秘钥设置到Termux中" class="header_1">将Xshell创建的秘钥设置到Termux中</a>&nbsp;<br><a href="/blog/c3146b3e/#Termux-获得存储权限" class="header_2">Termux 获得存储权限</a>&nbsp;<br><a href="/blog/c3146b3e/#将公钥发送到手机上" class="header_2">将公钥发送到手机上</a>&nbsp;<br><a href="/blog/c3146b3e/#复制公钥到-ssh目录下" class="header_2">复制公钥到.ssh目录下</a>&nbsp;<br><a href="/blog/c3146b3e/#将公钥写入authorized_keys中" class="header_2">将公钥写入authorized_keys中</a>&nbsp;<br><a href="/blog/c3146b3e/#开启sshd" class="header_1">开启sshd</a>&nbsp;<br><a href="/blog/c3146b3e/#获取链接信息" class="header_1">获取链接信息</a>&nbsp;<br><a href="/blog/c3146b3e/#查看当前Termux用户信息" class="header_2">查看当前Termux用户信息</a>&nbsp;<br><a href="/blog/c3146b3e/#查看Termux的ip地址" class="header_2">查看Termux的ip地址</a>&nbsp;<br><a href="/blog/c3146b3e/#使用正则取出正确的IP所在的行" class="header_3">使用正则取出正确的IP所在的行</a>&nbsp;<br><a href="/blog/c3146b3e/#确保手机和电脑在同一个网络下" class="header_1">确保手机和电脑在同一个网络下</a>&nbsp;<br><a href="/blog/c3146b3e/#使用Xshell链接Termux" class="header_1">使用Xshell链接Termux</a>&nbsp;<br><a href="/blog/c3146b3e/#设置链接常规信息" class="header_2">设置链接常规信息</a>&nbsp;<br><a href="/blog/c3146b3e/#设置用户身份验证信息" class="header_2">设置用户身份验证信息</a>&nbsp;<br><a href="/blog/c3146b3e/#链接成功效果" class="header_2">链接成功效果</a>&nbsp;<br><a href="/blog/c3146b3e/#链接成功但是无法操作的情况" class="header_3">链接成功但是无法操作的情况</a>&nbsp;<br><a href="/blog/c3146b3e/#保证Termux显示在手机屏幕最上方" class="header_3">保证Termux显示在手机屏幕最上方</a>&nbsp;<br><a href="/blog/c3146b3e/#如何重新链接" class="header_2">如何重新链接</a>&nbsp;<br><a href="/blog/c3146b3e/#设置Termux常驻后台" class="header_2">设置Termux常驻后台</a>&nbsp;<br><a href="/blog/c3146b3e/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 下载安装Xshell免费版
## 进入中文官网
进入[Xshell的官网](https://www.netsarang.com/zh/xshell/),然后点击顶部导航条上的`所有下载`，`家庭/学校免费`.
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101155722848.png)
## 填写邮箱获取下载链接
然后填写姓名和邮箱，选择要下载的程序，然后点击下载,下载链接会发送到刚才邮箱上。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101155404912.png)
## 接收邮件 并下载
打开邮箱,点击下载链接即可下载Xshell
下载好之后安装Xshell,过程省略..
# 使用Xshell创建秘钥
## Xshell创建秘钥详细过程
打开Xshell，点击`工具`，`新建用户密钥生成向导`
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101160249858.png)
然后选择`秘钥类型`和`秘钥长度`,默认即可,点击下一步
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101160107548.png)
等待秘钥生成结束后,继续点击`下一步`.
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101160358582.png)
输入`秘钥名称`和`秘钥密码`,继续点击`下一步`
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101160534926.png)
## 保存公钥
此时可以看到公钥了,点击`存为文件`
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101160745914.png)
保存到电脑上的用户目录下的.ssh目录下:
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101161001353.png)
## 导出私钥并保存
然后就看看到创建好的用户秘钥了.
![在这里插入图片描述](https://img-blog.csdnimg.cn/201911011616115.png)
导出私钥
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101161525994.png)
输入密码
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101161743902.png)
# 将Xshell创建的秘钥设置到Termux中
## Termux 获得存储权限
```shell
termux-setup-storage
```
成功拿到存储权限后会在`home`目录生成`storage` 目录,并且生成若干目录(软连接),这些软连接都指向外置存储卡的相应目录应目录。

`storage`目录下的`shared`目录对应我们手机**内部存储的根目录**(`/storage/emulated/0/`),我们通过文件资源浏览器打开的就是这个`/storage/emulated/0/`目录,只不过在`Termux`中`/storage/emulated/0/`对应的是`storage`目录下的`shared`目录。
## 将公钥发送到手机上
我这里将公钥通过`QQ`发送到手机上.
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101161929142.png)然后打开手机QQ,接收电脑上发送过来的公钥.
## 复制公钥到.ssh目录下
打开`Termux`,进入用户`home`目录下:
```shell
cd ~
```
创建手机QQ`接收文件的那个目录`(`tencent/QQfile_recv`)的`软连接`.
```shell
ln -s /data/data/com.termux/files/home/storage/shared/tencent/QQfile_recv qq
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101163019713.png)
然后复制qq软连接下的公钥到home目录下的.ssh目录中
```shell
mv ~/qq/id_rsa_2048.pub ~/.ssh
```
## 将公钥写入authorized_keys中
进入home目录下的.ssh目录.
```shell
cd ~/.ssh
```
将公钥写入`authorized_keys`文件中
```shell
cat id_rsa_2048.pub > authorized_keys
```
查看公钥
```shell
cat authorized_keys
ssh-rsa AAAAB3Nza.............................................................
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101164033332.png)
# 开启sshd
```shell
sshd
```
# 获取链接信息
## 查看当前Termux用户信息
```shell
whoami
```
whoami的输出就是当前用户的信息:
```
u0_a391
```
## 查看Termux的ip地址
```shell
ifcofig
```
ifcofig运行效果如下:
```
dummy0: flags=195<UP,BROADCAST,RUNNING,NOARP>  mtu 1500
        inet6 fe80::bc05:1ff:fe55:4556  prefixlen 64  scopeid 0x20<link>
        unspec 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00  txqueuelen 1000  (UNSPEC)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 66  bytes 4620 (4.5 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
......这里省略部分信息.
wlan0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.43.1  netmask 255.255.255.0  broadcast 192.168.137.255
        inet6 fe80::76d2:1dff:fe00:73fd  prefixlen 64  scopeid 0x20<link>
        unspec 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00  txqueuelen 1000  (UNSPEC)
        RX packets 1824  bytes 1096921 (1.0 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2529  bytes 366296 (357.7 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

```
这里的`wlan0`中的** inet 192.168.43.1**中的`192.168.43.1`就是**当前手机的ip地址**
```
wlan0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.43.1  netmask 255.255.255.0  broadcast 192.168.137.255
```
### 使用正则取出正确的IP所在的行
ifconfig命令的输出很多,可以使用grep命令从ifconfig命令中筛选出:
```
inet 192.168.43.1  netmask 255.255.255.0  broadcast 192.168.137.255
```
这一行.
```shell
ifconfig |grep -E 'inet ([0-9]{1,3}(\.[0-9]{1,3}){3,3})\s.netmask.+broadcast'
```
```shell
ifconfig |grep -P '[0-9]{1,3}(?:\.[0-9]{1,3}){3}\s.netmask.+broadcast'
```
# 确保手机和电脑在同一个网络下
- **电脑和手机链接到同一个WiFi下**,
    - 这种方式可能会失败,
    - 我在电脑上和手机上分别登录到校园网后,使用Xshell链接不成功,估计是校园网有限制吧,这个问题,浪费我好长时间!,最后发现可以通过热点进行连接
- **电脑链接到手机热点上**
- **手机链接到电脑的热点上**

经过我的测试两种热点连接方式都通过`Xshell`连接到手机上的`Termux`,最好**使用热点方式**。
# 使用Xshell链接Termux
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101164512819.png)
## 设置链接常规信息
在弹出的窗口左侧点击`连接`填写上面获取到的的`ip`地址:
端口填写`8020`
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101164932939.png)
## 设置用户身份验证信息
- 点击窗口左侧的`用户身份验证`
- 方法选择框中选择使用`Public key`,
- 在用户名填写上面获取到的Termux`用户名`,
- 选择上面创建好的`秘钥`,
- 填写创建秘钥时的指定的`秘钥密码`.
- 最后点击`连接`

![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101165201792.png)

## 链接成功效果
### 链接成功但是无法操作的情况
如果运行效果如下
```
Connecting to 192.168.137.191:8022...
Connection established.
To escape to local shell, press 'Ctrl+Alt+]'.
```
这说明链接是成功的,但是无法操作,这是因为Termux现在不在前台,把Termux显示在前台即可,也就是显示在屏幕上.
### 保证Termux显示在手机屏幕最上方
如果Termux没有显示在前台的话Xshell无法操作.
```shell
Connecting to 192.168.137.191:8022...
Connection established.
To escape to local shell, press 'Ctrl+Alt+]'.
WARNING! The remote SSH server rejected X11 forwarding request.
Welcome to Termux!
Wiki:            https://wiki.termux.com
Community forum: https://termux.com/community
Gitter chat:     https://gitter.im/termux/termux
IRC channel:     #termux on freenode
Working with packages:
 * Search packages:   pkg search <query>
 * Install a package: pkg install <package>
 * Upgrade packages:  pkg upgrade
Subscribing to additional repositories:
 * Root:     pkg install root-repo
 * Unstable: pkg install unstable-repo
 * X11:      pkg install x11-repo
Report issues at https://termux.com/issues
 u0_a391@localhost  ~  

```
`Termux`从前台切换到后台后连接失败,需要重新连接。
```shell
Socket error Event: 32 Error: 10053.
Connection closing...Socket close.

Connection closed by foreign host.

Disconnected from remote host(Termux) at 16:57:47.

Type `help' to learn how to use Xshell prompt.
[F:\~]$ 

```
## 如何重新链接
将`Termux`切换到前台,然后点击`Xshell`菜单栏面的`文件`,然后点击`重新连接`。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101165959918.png)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191101170131315.png)
## 设置Termux常驻后台
一直将`Termux`显示在前台还是不方便,可以点击手机通知栏上的`ACQUIRE WAKELOCK`,让`Termux`常驻后台.这样`Termux`在后台的时候也可以保持和`Xshell`的连接。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191103145704397.png)
常驻后台时的效果:
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191103145858917.png)
# 参考资料
[https://blog.csdn.net/jacka654321/article/details/81145756](https://blog.csdn.net/jacka654321/article/details/81145756)
