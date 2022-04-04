---
title: LinuxDeploy CentOS7编译安装最新的Git
categories: 
  - Linux
  - LinuxDeploy
abbrlink: 94a9be61
date: 2021-03-18 11:12:56
updated: 2022-04-04 00:51:45
---
# 下载git源码压缩包
## 从Git官网上下载
进入git下载网站：[https://git-scm.com/download/linux](https://git-scm.com/download/linux)
滚动页面到最下方：可以看到CentOS对应的安装方式。：

> **Red Hat Enterprise Linux, Oracle Linux, CentOS, Scientific Linux, et al.**
> RHEL and derivatives typically ship older versions of git. You can [download a tarball](https://www.kernel.org/pub/software/scm/git/) and build from source, or use a 3rd-party repository such as the [IUS Community Project](https://ius.io/) to obtain a more recent version of git.

翻译：
RHEL及其衍生物通常提供较旧版本的git。您可以从源代码下载tarball并进行构建，或者使用第三方存储库（如IUS社区项目）来获取git的最新版本。

## 从GitHub上下载
[https://github.com/git/git/releases](https://github.com/git/git/releases)

## 使用Xftp上传到centos上
先用Xshell连接手机，然后在Xshell中打开Xftp,把git的压缩包上传到/opt目录
# 解压Git源码包
```shell
tar -xzf git-2.29.3.tar.gz
```
运行效果
```
[root@localhost ]# cd /opt
[root@localhost opt]# mkdir git
[root@localhost opt]# ls
apache-tomcat-8.5.63.tar.gz  git  git-2.29.3.tar.gz  hexo  java  jdk-8u281-linux-aarch64.tar.gz  nvm  nvm-0.37.2.tar.gz  tomcat  tomcat85
[root@localhost opt]# tar -xzf git-2.29.3.tar.gz -C git
```
进入解压后的git目录
```
[root@localhost opt]# ls
apache-tomcat-8.5.63.tar.gz  git  git-2.29.3.tar.gz  hexo  java  jdk-8u281-linux-aarch64.tar.gz  nvm  nvm-0.37.2.tar.gz  tomcat  tomcat85
[root@localhost opt]# cd git
[root@localhost git]# ls
git-2.29.3
[root@localhost git]# cd git-2.29.3/
[root@localhost git-2.29.3]# ls
abspath.c           connect.h                  git-mergetool.sh                merge-blobs.h        reachable.c             submodule-config.h
aclocal.m4          contrib                    git-p4.py                       merge.c              reachable.h             submodule.h
......
```
# 安装Git在CentOS对应的依赖
```shell
yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel
```
上面这个命令会自动安装旧版本的git,所以，安装之前，要先移除该git
# 移除旧版git
```shell
yum remove git
```
# 编译安装
移除旧版的git后，就可以执行厦门的两个命令进行编译和安装了：
```shell
make prefix=/usr/local/git all
make prefix=/usr/local/git install
```
编译和安装需要的时间可能比较长,耐心等待运行结束。
# 设置git的环境变量
```shell
vim /etc/profile
```
在文件末尾添加：
```shell
export PATH=$PATH:/usr/local/git/bin
```
然后刷新环境变量：
```shell
source /etc/profile
```
# 测试安装是否成功
```shell
git version
```
运行效果：
```
[root@localhost opt]# git --version
git version 2.29.3
[root@localhost opt]# 
```
# 设置Git自动补全
git的源码包里面已经有自动补全的脚本了，配置到环境变量即可使用，具体操作方法如下：
## 获取git-completion.bash文件的绝对路径
该文件在git源码目录下的相对路径为：
```
contrib/completion/git-completion.bash
```
找到该文件，并获取该文件的绝对路径
```
[root@localhost git]# pwd
/opt/git
[root@localhost git]# cd git-2.29.3/
[root@localhost git-2.29.3]# cd contrib/
[root@localhost contrib]# ls
buildsystems  coverage-diff.sh  examples          git-shell-commands   mw-to-git         remotes2config.sh  thunderbird-patch-inline
coccinelle    credential        fast-import       hg-to-git            persistent-https  rerere-train.sh    update-unicode
completion    diff-highlight    git-jump          hooks                README            stats              vscode
contacts      emacs             git-resurrect.sh  long-running-filter  remote-helpers    subtree            workdir
[root@localhost contrib]# cd completion/
[root@localhost completion]# ls
git-completion.bash  git-completion.tcsh  git-completion.zsh  git-prompt.sh
[root@localhost completion]# pwd
/opt/git/git-2.29.3/contrib/completion
[root@localhost completion]# readlink -f git-completion.bash 
/opt/git/git-2.29.3/contrib/completion/git-completion.bash
[root@localhost completion]# 
```
好的最终我得到的绝对路径为：
```
/opt/git/git-2.29.3/contrib/completion/git-completion.bash
```
## 设置环境变量
```
vim ~/.bashrc
```
在该环境变量文件的**末尾**最后加入下面内容
```
source git-completion.bash文件的绝对路径
```
我这里是：
```
source /opt/git/git-2.29.3/contrib/completion/git-completion.bash
```
运行效果：
```
[root@localhost opt]# vim ~/.bashrc 
[root@localhost opt]# cat ~/.bashrc
# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
......
# Git自动补全脚本环境变量
source /opt/git/git-2.29.3/contrib/completion/git-completion.bash
[root@localhost opt]# 
```
完成以上步骤后，重启 shell，就可以通过 tab 键自动补全 Git 命令了。
例如输入git s然后按tab键，会有如下提示信息：
```
[root@localhost blog]# git s
send-email        show              sparse-checkout   stash             submodule         
shortlog          show-branch       stage             status            switch            
[root@localhost blog]# git s
```
# 参考资料
[https://www.runoob.com/git/git-install-setup.html](https://www.runoob.com/git/git-install-setup.html)
[https://ehlxr.me/2016/07/30/CentOS-7-%E5%AE%89%E8%A3%85%E6%9C%80%E6%96%B0%E7%9A%84-Git/](https://ehlxr.me/2016/07/30/CentOS-7-%E5%AE%89%E8%A3%85%E6%9C%80%E6%96%B0%E7%9A%84-Git/)
[https://my.oschina.net/mobinchao/blog/3023355](https://my.oschina.net/mobinchao/blog/3023355)

[https://ehlxr.me/2016/09/04/CentOS-%E4%B8%AD%E9%85%8D%E7%BD%AE-Git-%E5%91%BD%E4%BB%A4%E8%87%AA%E5%8A%A8%E8%A1%A5%E5%85%A8/](https://ehlxr.me/2016/09/04/CentOS-%E4%B8%AD%E9%85%8D%E7%BD%AE-Git-%E5%91%BD%E4%BB%A4%E8%87%AA%E5%8A%A8%E8%A1%A5%E5%85%A8/)
[https://www.jianshu.com/p/b3531cf9bd0e](https://www.jianshu.com/p/b3531cf9bd0e)
