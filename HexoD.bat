@echo off
echo �л��̷� %~d0
%~d0
echo ���뵱ǰĿ¼ %~dp0
cd %~dp0
echo �����Զ���Ŀ¼
java -jar "E:\dev2\idea_workspace\HexoTools\runable\FM.jar" toc %~dp0source\_posts\
echo �� git-bash
start git-bash --cd=%~dp0
REM pause