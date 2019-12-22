---
title: cmd choice命令
categories:
  - Windows
  - CMD 批处理
  - 语法
  - 系统相关命令
abbrlink: bb8611bd
date: 2019-12-22 11:20:19
updated: 2019-12-22 11:20:19
---
# cmd choice命令

## 延时
```cmd
choice /t 秒数 /d y /n >nul
```
例如延时5秒:
```cmd
choice /t 5 /d y /n >nul
```