---
title: 使用批处理脚本 在特定目录中启动Git-Bash窗口
categories: 
  - Git
  - GitBash
date: 2019-01-07 20:35:05
updated: 2019-10-31 20:21:37
abbrlink: e95301e8
---
- [问题描述](/blog/html/e95301e8/#问题描述)
- [实现](/blog/html/e95301e8/#实现)
- [命令解释](/blog/html/e95301e8/#命令解释)
- [点击批处理在项目目录下打开git-bash](/blog/html/e95301e8/#点击批处理在项目目录下打开git-bash)
- [参考资料](/blog/html/e95301e8/#参考资料)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## 问题描述 ##
平时想要在项目目录中输入git命令，我需要先打开git-bash窗口，然后还要cd到项目目录中。这挺麻烦的。我现在想:
通过批处理脚本,直接在某个目录中启动git-bash窗口。
## 实现 ##
在项目目录下,创建一个批处理脚本(`StartGitBash.bat`)文件,写入如下的命令:
```cmd
start F:\Program" "Files\Git\git-bash.exe --cd=D:\dev\workspace\HexoTools
```
## 命令解释 ##
- `start`用于启动一个窗口
- `F:\Program" "Files\Git\git-bash.exe`是git-bash的路径，注意路径中间的空格要用引号包起来
- `--cd=D:\dev\workspace\HexoTools`指定git-bash的启动目录为`D:\dev\workspace\HexoTools`,

## 点击批处理在项目目录下打开git-bash ##
现在我只要点击项目目录下的`StartGitBash.bat`:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/git/GitBash/KuaiSuDaKai/1.png)
就可在项目目录下打开git-bash了：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/git/GitBash/KuaiSuDaKai/2.png)
## 参考资料 ##
[如何使用脚本启动具有特定工作目录的Git Bash窗口？](https://code.i-harness.com/zh-CN/q/12fe77e)
>原文链接: [使用批处理脚本 在特定目录中启动Git-Bash窗口](https://lanlan2017.github.io/blog/e95301e8/)
