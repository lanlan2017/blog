---
title: cmd 解压缩 WinRAR的命令行模式用法介绍
categories: 
  - Windows
  - CMD 批处理
  - 语法
  - 系统相关命令
date: 2019-11-22 11:16:59
updated: 2019-12-09 19:45:23
abbrlink: a51d0e
---
<div id='my_toc'><a href="/blog/a51d0e/#cmd-解压缩WinRAR的命令行模式用法介绍">cmd 解压缩WinRAR的命令行模式用法介绍</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/a51d0e/#下载安装WinRAR">下载安装WinRAR</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/a51d0e/#unrar-exe帮助文档">unrar.exe帮助文档</a><br/><a href="/blog/a51d0e/#参考资料">参考资料</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
# cmd 解压缩WinRAR的命令行模式用法介绍 #
## 下载安装WinRAR ##
`WinRAR.exe`安装完后,从**安装目录**将主程序`winRAR.exe`拷贝出来即可,该程序是独立可运行的

`WinRaR`的命令行模式程序在安装目录下的`rar.exe` (打包压缩程序),`unrar.exe`(解压缩程序)
## unrar.exe帮助文档 ##
```cmd
F:\Program Files\WinRAR>unrar.exe /?

UNRAR 5.71 x64 免费软件      版权所有 (C) 1993-2019 Alexander Roshal

用法:     unrar <command> -<switch 1> -<switch N> <archive> <files...>
               <@listfiles...> <path_to_extract\>

<Commands>
  e             提取文件不带压缩路径
  l[t[a],b]     列出压缩文档内容 [technical[all], bare]
  p             打印文件到 stdout
  t             测试压缩文档的文件
  v[t[a],b]     详细列出压缩文档的内容 [technical[all],bare]
  x             解压文件带完整路径

<Switches>
  -             停止参数扫描
  @[+]          禁用 [enable] 文件列表
  ac            压缩或解压后清除压缩文档属性
  ad            扩展压缩文档名称到目标路径
  ag[format]    使用当前日期生成压缩文档名称
  ai            忽略文件属性
  ap<path>      设置压缩文档内部的路径
  c-            禁用内容显示
  cfg-          禁用读取配置
  cl            转换名称为小写
  cu            转换名称为大写
  dh            打开共享的文件
  ep            从名称里排除路径
  ep3          扩展路径为完整路径包括驱动器盘符
  f             刷新文件
  id[c,d,p,q]   禁用消息
  ierr         发送所有压缩文档到 stderr
  inul          禁用所有消息
  ioff[n]       完成一个操作后关闭电脑
  kb            保留损坏的已解压文件
  n<file>       额外管理器包含文件
  n@            从 stdin 读取额外的过滤器掩码
  n@<list>      从列表文件读取额外的过滤器掩码
  o[+|-]        设置覆盖模式
  oc            设置 NTFS 压缩属性
  ol[a]         将符号链接处理为链接 [absolute paths]
  or            自动重命名文件
  ow            保存或恢复文件拥有者和组
  p[password]   设置密码
  p-            不要查询密码
  r             递归子目录
  ri<P>[:<S>]   设置优先级 (0-默认,1-最小.15-最大) 和休眠时间单位为 ms
  sc<chr>[obj]  指定字符集
  sl<size>      处理小于指定大小的文件
  sm<size>      处理大于指定大小的文件
  ta[mcao]<d>   处理那些在日期 <d> YYYYMMDDHHMMSS 之后修改过的文件
  tb[mcao]<d>   处理那些在日期 <d> YYYYMMDDHHMMSS 之前修改过的文件
  tn[mcao]<t>   处理那些时间比 <t> 更新的文件
  to[mcao]<t>   处理那些时间比 <t> 更老的文件
  ts[m,c,a]     保存或恢复文件时间（修改日期，创建日期，访问日期）
  u             更新文件
  v             列出所有卷
  ver[n]        文件版本控制
  vp            每个卷之前暂停
  x<file>       排除特定文件
  x@           读取文件名以便从 stdin 排除
  x@<list>      排除在特定列表文件里列出的文件
  y             对所有问题回答是
```
**先这样,有空再研究**
# 参考资料 #
[https://www.cnblogs.com/fetty/p/4769279.html](https://www.cnblogs.com/fetty/p/4769279.html)
