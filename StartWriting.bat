@echo off
REM �л��̷�
echo %~d0
%~d0
REM ���뵱ǰĿ¼
echo %~dp0
set blogRoot=%~dp0
cd %blogRoot%
echo ��postĿ¼:%~dp0source\_posts
set postRoot=%~dp0source\_posts
explorer %postRoot%
echo ��%blogRoot%Ŀ¼�´�git-bash
start git-bash --cd=%blogRoot%
REM pause
echo ��ȡԶ�̷�֧
git pull origin master
REM �����¸�Ŀ¼�´��ļ���Դ������