@echo off
REM �л��̷�
echo %~d0
%~d0
REM ���뵱ǰĿ¼
echo %~dp0
set blogRoot=%~dp0
cd %blogRoot%
REM ��ȡԶ�̷�֧
git pull origin master
REM �ļ�������д򿪵�ǰĿ¼
set postRoot=%~dp0source\_posts
explorer %postRoot%
REM �ڵ�ǰĿ¼�´�git-bash
start git-bash --cd=%postRoot%
REM pause