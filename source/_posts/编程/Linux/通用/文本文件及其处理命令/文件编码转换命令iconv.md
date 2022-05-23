---
title: 文件编码转换命令iconv
categories:
  - 编程
  - Linux
  - 通用
  - 文本文件及其处理命令
abbrlink: 3c99cfc0
date: 2022-05-04 21:19:07
updated: 2022-05-04 21:19:07
---
# 文件编码转换命令iconv
iconv可以给文件转换编码
# 帮助文档tldr iconv
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new (master)
$ tldr iconv

  iconv

  Converts text from one encoding to another.
  More information: https://manned.org/iconv.

  - Convert file to a specific encoding, and print to stdout:
    iconv -f from_encoding -t to_encoding input_file

  - Convert file to the current locale's encoding, and output to a file:
    iconv -f from_encoding input_file > output_file

  - List supported encodings:
    iconv -l
```
