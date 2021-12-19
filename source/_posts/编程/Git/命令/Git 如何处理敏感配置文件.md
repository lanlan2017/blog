---
title: Git 如何处理敏感配置文件
categories: 
  - 编程
  - Git
  - 命令
date: 2020-06-24 04:41:17
updated: 2020-06-24 05:24:22
abbrlink: 548b8a6
---
# 问题描述
配置文件中保存有软件的APP_ID和秘钥,为了别人能使用这个文件,我把它加入了版本库中,当然里面只有key,没有秘钥:
```
APP_ID=
SECURITY_KEY=
```
我现在希望这个配置文件提交之后,就再也不再被Git追踪到了。
这样我自己才能把APP_ID和秘钥填进去,自己使用。

# 解决方案
## 先只提交key
第一次提交只有key没有value的配置文件,
## 填写value
然后在配置文件中填写上value
## 忽略修改
使用命令:
```cmd
git update-index --assume-unchanged filename
```
忽略对配置文件的修改。
这样我填写上秘钥后,只能再本地起作用。
## 添加到.gitignore
别人使用这个项目的时,配置文件依然只有key,没有value
# 参考资料
[https://www.liuin.cn/2017/11/16/Git-%E5%81%9C%E6%AD%A2%E8%BF%BD%E8%B8%AA%E6%96%87%E4%BB%B6/](https://www.liuin.cn/2017/11/16/Git-%E5%81%9C%E6%AD%A2%E8%BF%BD%E8%B8%AA%E6%96%87%E4%BB%B6/)
