@echo off
echo 切换盘符 %~d0
%~d0
echo 进入当前目录 %~dp0
cd %~dp0
echo 生成自定义目录
java -jar "E:\dev2\idea_workspace\HexoTools\runable\FM.jar" toc %~dp0source\_posts\
echo 打开 git-bash
start git-bash --cd=%~dp0
REM pause