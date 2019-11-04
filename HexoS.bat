@echo off
echo 切换盘符 %~d0
%~d0
echo 进入当前目录 %~dp0
cd %~dp0
echo 启动本地服务器
hexo s -p 4007