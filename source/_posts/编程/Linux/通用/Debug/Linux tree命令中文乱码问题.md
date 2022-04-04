---
title: Linux tree命令中文乱码问题
categories: 
  - Linux
  - 通用
  - Debug
abbrlink: a192b88d
date: 2021-06-02 17:46:51
updated: 2022-04-04 00:51:45
---
# tree命令中文乱码问题
tree打印目录树时，遇到中文的目录或文件名时，打印的是`\数字`：
```
[root@localhost Linux_Test]# tree 文件管理和目录管理/
\346\226\207\344\273\266\347\256\241\347\220\206\345\222\214\347\233\256\345\275\225\347\256\241\347\220\206/
└── \346\226\207\344\273\266\347\256\241\347\220\206\345\222\214\347\233\256\345\275\225\347\256\241\347\220\2062
    ├── HelloWorld2.c
    ├── HelloWorld.c
    └── \345\244\207\344\273\275
        ├── p1.c
        └── p2.c

2 directories, 4 files
[root@localhost Linux_Test]#
```
# 解决方案：tree -N
man tree查看相关选项，可以看到使用-N选项可以**按原样打印不可打印的字符，而不是转义的八进制数。**
```
......
FILE OPTIONS
......
       -N     Print non-printable characters as is instead of as escaped octal numbers.
......
```
打印效果：
```
[root@localhost Linux_Test]# tree -N 文件管理和目录管理/
文件管理和目录管理/
└── 文件管理和目录管理2
    ├── HelloWorld2.c
    ├── HelloWorld.c
    └── 备份
        ├── p1.c
        └── p2.c

2 directories, 4 files
[root@localhost Linux_Test]# 
```
# 参考资料
<https://www.jianshu.com/p/52a4cedcfea0>
