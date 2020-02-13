@echo off
REM 切换盘符
echo %~d0
%~d0
REM 进入当前目录
echo %~dp0
set blogRoot=%~dp0
cd %blogRoot%
echo 打开post目录:%~dp0source\_posts
set postRoot=%~dp0source\_posts
explorer %postRoot%
echo 在%blogRoot%目录下打开git-bash
start git-bash --cd=%blogRoot%

choice /t 10 /d n /m 是否拉取远程更新(默认不拉取)

IF ERRORLEVEL 2 goto end

    echo 拉取远程分支
    git pull origin master
:end
    REM echo 程序结束
    REM pause