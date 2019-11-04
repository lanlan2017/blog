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
REM 文件浏览器中打开当前目录
set postRoot=%~dp0source\_posts
explorer %postRoot%
REM 在当前目录下打开git-bash
start git-bash --cd=%postRoot%
REM pause