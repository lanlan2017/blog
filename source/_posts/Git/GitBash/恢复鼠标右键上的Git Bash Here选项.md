---
title: 恢复鼠标右键上的Git Bash Here选项
categories: 
  - Git
  - GitBash
date: 2019-12-06 15:02:25
updated: 2019-12-15 10:01:43
abbrlink: 6aa7c987
---
<div id='my_toc'><a href="/blog/6aa7c987/#问题描述" class="header_1">问题描述</a><br><a href="/blog/6aa7c987/#打开注册表编辑器" class="header_1">打开注册表编辑器</a><br><a href="/blog/6aa7c987/#进入shell目录" class="header_1">进入shell目录</a><br><a href="/blog/6aa7c987/#新建项Git-Bash-Here" class="header_1">新建项Git Bash Here</a><br><a href="/blog/6aa7c987/#设置图标" class="header_2">设置图标</a><br><a href="/blog/6aa7c987/#设置命令" class="header_2">设置命令</a><br><a href="/blog/6aa7c987/#地址中有空格要用引号包裹" class="header_1">地址中有空格要用引号包裹</a><br><a href="/blog/6aa7c987/#使用" class="header_1">使用</a><br><a href="/blog/6aa7c987/#参考资料" class="header_1">参考资料</a><br></div>
<style>
    .header_1{
        margin-left: 1em;
    }
    .header_2{
        margin-left: 2em;
    }
    .header_3{
        margin-left: 3em;
    }
    .header_4{
        margin-left: 4em;
    }
    .header_5{
        margin-left: 5em;
    }
    .header_6{
        margin-left: 6em;
    }
</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
# 问题描述
新安装的Git-bash会在鼠标右键上注册一个git-bash here的选项.
但是我的git-bash版本可能比较老，或者其他原因,我重装后也没有这个鼠标右键选项，不过没有关系，现在来手动创建就是了。
# 打开注册表编辑器
按Win+r打开运行,然后输入`regedit`,进入注册表编辑器。
# 进入shell目录
然后在
注册表顶部的**地址栏**
中粘贴如下路径,然后按**回车**进入shell目录,
```
计算机\HKEY_CLASSES_ROOT\Directory\Background\shell
```
此时虽然定位到shell目录,但是shell目录可能显示在屏幕底部,为了便于后续操作,可以按**上/下箭头键**,将shell目录显示在**屏幕中间**
# 新建项Git Bash Here #
在**shell目录**上**右键**,然后选择**新建**,**项**,输入名称:
```
Git Bash Here
```
## 设置图标
然后**点击**刚才创建的**Git Bash Here**这个目录,在**右键**,**新建**,**字符串值**:
输入字符串的名称:
```
Icon
```
字符串的值设为:
```
"F:\Program Files\Git\mingw64\share\git\git-for-windows.ico"
```
其中`F:\Program Files\Git`是git的安装目录,以你的为准,git图标的路径为:
```
Git安装目录\mingw64\share\git\git-for-windows.ico
```
## 设置命令
鼠标点击**Git Bash Here**目录,然后**右键**,**新建**,**项**,输入名字:
```
command
```
然后点击新建的目录**command**,接着点击右边的**(默认)** 这个字符串进行**编辑**,输入git-bash的路径:
```
"F:\Program Files\Git\git-bash.exe"
```
# 地址中有空格要用引号包裹
因为地址中有空格,为了防止系统无法识别,所以程序地址要用**双引号**包裹起来
也可以Git按住目录下的git-bash.exe上面**按住shift键**,然后按下鼠标**右键**,然后选择**复制为路径(A)**即可得到双引号包裹的路径.
# 使用
在Windows资源管理器中的任意目录下按下,**鼠标右键**然后 选择Git Bash Here选项,即可在当前目录下打开git-bash了。

# 参考资料
[https://blog.csdn.net/weixin_42357048/article/details/80533571](https://blog.csdn.net/weixin_42357048/article/details/80533571)
