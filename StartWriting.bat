@echo off
REM 切换盘符
echo %~d0
%~d0
REM 进入当前目录
echo %~dp0
set blogRoot=%~dp0
cd %blogRoot%
REM 拉取远程分支
git pull origin master
REM 在文章根目录下打开文件资源管理器
set postRoot=%~dp0source\_posts
explorer %postRoot%
REM 站点目录下打开git-bash
start git-bash --cd=%blogRoot%
REM pause