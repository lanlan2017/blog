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
REM �����¸�Ŀ¼�´��ļ���Դ������
set postRoot=%~dp0source\_posts
explorer %postRoot%
REM վ��Ŀ¼�´�git-bash
start git-bash --cd=%blogRoot%
REM pause