---
title: 解决cmd PowerShell中git log中文乱码
categories: 
  - Git
  - Debug
abbrlink: 4f38856c
date: 2019-12-18 02:32:38
updated: 2022-04-04 00:51:45
---
# 解决cmd下git log中文乱码
## 问题描述
cmd下输入git log命令出现如下乱码:
```
E:\Blog\blogRoot>git log -10 --pretty=oneline
1c26db1ef9c54330757911b5205ac92a15c01b6c (HEAD -> src) <E6>B4><E6><96><B0>todo<E9><A1><B5><E9><9D><A2>
375a4b8bfa89cad081c15d9a834f070459eb3c09 <E6>B4><E6><96><B0>todo<E9><A1><B5><E9><9D><A2>
7edcc579a0c417bb2481256da4c87cbf5a6be379 (origin/src) <E6>B4><E6><96><B0><E6><89><B9><E5><A4><84><E7><90><86><E6><96>   <87><E4><BB><B6>
da64371d7c69340976265a076a161bcade7c1497 <E6>B4><E6><96><B0>todo<E9><A1><B5><E9><9D><A2>
7e108c076bbeeda63d5ada9259cb153d6ecc89b5 <E6>B4><E6><96><B0>todo<E9><A1><B5><E9><9D><A2>
c23ddcc1f4b450dedc847ecef25fa97432326e7b <E6><B7><BB><E5><8A><A0><E7>AE><E5><BD><95><E6><91><98><E8><A6><81>
78b7fb59455787fc8ac243a355dad9563ee015ab <E5><88><A0><E9><99><A4><E6><B5><8B><E8><AF><95><E6><96><87><E4><BB><B6>,<E9>  <87><8D><E6><96><B0><E7><94><9F><E6><88><90><E7>AE><E5><BD><95><E6><91><98><E8><A6><81>
f00bcacf7a5fda143fd407b8959154945b4ed558 <E6><B7><BB><E5><8A><A0><E6><B5><8B><E8><AF><95><E6><96><87><E4><BB><B6>       eab5cd3a59085d6ca0fed8bef9aea20b9a13d7ff <E6>B4><E6><96><B0><E6><96><87><E7><AB><A0>
15b8dea30dba4f1931b612b17e75b684bb51deba <E5><88><A0><E9><99><A4><E6><B5><8B><E8><AF><95><E6><96><87><E7><AB><A0> 
```
## 解决方案
在cmd中输入如下命令:
```
git config --global core.quotepath false 
git config --global gui.encoding utf-8
git config --global i18n.commit.encoding utf-8 
git config --global i18n.logoutputencoding utf-8 
set LESSCHARSET=utf-8
```
这样git log就不会乱码了:
```
E:\Blog\blogRoot>git log -10 --pretty=oneline
1c26db1ef9c54330757911b5205ac92a15c01b6c (HEAD -> src) 更新todo页面
375a4b8bfa89cad081c15d9a834f070459eb3c09 更新todo页面
7edcc579a0c417bb2481256da4c87cbf5a6be379 (origin/src) 更新批处理文件
da64371d7c69340976265a076a161bcade7c1497 更新todo页面
7e108c076bbeeda63d5ada9259cb153d6ecc89b5 更新todo页面
c23ddcc1f4b450dedc847ecef25fa97432326e7b 添加目录摘要
78b7fb59455787fc8ac243a355dad9563ee015ab 删除测试文件,重新生成目录摘要
f00bcacf7a5fda143fd407b8959154945b4ed558 添加测试文件
eab5cd3a59085d6ca0fed8bef9aea20b9a13d7ff 更新文章
15b8dea30dba4f1931b612b17e75b684bb51deba 删除测试文章
```
但是,这样只对当前cmd有效,新开的cmd无效,需要再次输入:
```
set LESSCHARSET=utf-8
```
## 永久生效
设置添加**环境变量**`LESSCHARSET`,设为`utf-8`:
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Git/Cmd/GitLogChineseGarbled/1.png)
### 效果
这样`CMD,powerShell`中都不会乱码了:
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Git/Cmd/GitLogChineseGarbled/3.png)
`Windows Terminal`中的`cmd`和`PowerShell`也不会乱码:
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Git/Cmd/GitLogChineseGarbled/2.png)

<!-- Git/Cmd/GitLogChineseGarbled/ -->
# 参考资料
[https://blog.csdn.net/sunjinshengli/article/details/81283009](https://blog.csdn.net/sunjinshengli/article/details/81283009)
