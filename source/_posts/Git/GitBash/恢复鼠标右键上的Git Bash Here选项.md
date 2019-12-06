title: 恢复鼠标右键上的Git Bash Here选项
categories:
  - Git
  - GitBash
abbrlink: 6aa7c987
date: 2019-12-06 15:02:25
updated: 2019-12-06 15:28:58
---
<div id='my_toc'>

- [问题描述](/blog/6aa7c987/#问题描述)
- [打开注册表编辑器](/blog/6aa7c987/#打开注册表编辑器)
- [进入shell目录](/blog/6aa7c987/#进入shell目录)
- [新建项Git Bash Here](/blog/6aa7c987/#新建项Git-Bash-Here)
    - [设置图标](/blog/6aa7c987/#设置图标)
- [设置命令](/blog/6aa7c987/#设置命令)
- [地址中有空格要用引号包裹](/blog/6aa7c987/#地址中有空格要用引号包裹)
- [使用](/blog/6aa7c987/#使用)
- [参考资料](/blog/6aa7c987/#参考资料)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# 问题描述
新安装的Git-bash会在鼠标右键上注册一个git-bash here的快捷选项.
但是我的git-bash版本可能比较聊,我重装后也没有.现在来手动创建.
# 打开注册表编辑器
按Win+r打开运行,然后输入`regedit`,进入注册表编辑器:
# 进入shell目录
然后在顶部地址栏中粘贴如下路径,然后按回车进入shell目录,
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
# 设置命令
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
在一个目录下按下,鼠标右键选择Git Bash Here选项,即可在当前目录下打开git-bash了:

# 参考资料
[https://blog.csdn.net/weixin_42357048/article/details/80533571](https://blog.csdn.net/weixin_42357048/article/details/80533571)