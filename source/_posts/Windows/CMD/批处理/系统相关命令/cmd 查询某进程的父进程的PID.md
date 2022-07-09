---
title: cmd查询某进程的父进程的PID
categories:
  - Windows
  - CMD
  - 批处理
  - 系统相关命令
abbrlink: '52467e54'
date: 2022-06-26 22:10:10
updated: 2022-06-26 22:10:10
---
## 根据进程名来查询父进程的PID
```
wmic process where Name="进程名.exe" get ParentProcessId
```
## 根据进程的PID来查询父进程的PID
```
wmic process where ProcessId=PID get ParentProcessId
```