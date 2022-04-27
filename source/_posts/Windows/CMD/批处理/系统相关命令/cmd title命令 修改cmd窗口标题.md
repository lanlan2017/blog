---
title: cmd title命令 修改cmd窗口标题
categories:
  - Windows
  - CMD
  - 批处理
  - 系统相关命令
abbrlink: 29c2092f
date: 2022-04-26 10:05:47
updated: 2022-04-26 10:05:47
---
# cmd title命令 修改cmd窗口标题
title命令可以设置当前cmd窗口的标题,可以把cmd窗口标题修改成批处理文件的完整名称。这样我们同时运行多个批处理文件时，就知道cmd窗口和正在运行的批处理文件的关系。
<!-- more -->
## 示例
```bat test.bat
@echo off
echo 当前文件的完整名称：%~nx0
title %~nx0
pause
```
上面的`title %~nx0`命令将当前cmd床头设置为当前文件的完整名称。

运行效果：

![image-20220426101204728](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220426101204.png)

## 帮助文档
```cmd
D:\Desktop\test\CMD\phone>title /?
设置命令提示窗口的窗口标题。

TITLE [string]

  string       指定命令提示窗口的标题。
```

# 参考资料
https://lanlan2017.github.io/blog/5b0d225d/
https://blog.csdn.net/zj0910/article/details/46942861