@echo off
echo �л��̷� %~d0
%~d0
echo ���뵱ǰĿ¼ %~dp0
cd %~dp0
echo �� git-bash
start git-bash --cd=%~dp0
REM pause