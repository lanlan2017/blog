@echo off
echo �л��̷� %~d0
%~d0
echo ��������Ŀ¼: %~dp0source\_posts\
cd %~dp0source\_posts\
echo ##### ɾ�������ļ�
del %~dp0source\_posts\����.md
echo ##### ɾ�������ļ�
echo.
echo ############################################################### ɾ�����е�html�ļ� ��ʼ
echo.
for /r . %%i in (*.html) do (
	echo     ɾ��:"%%i"
	del "%%i"
)
echo.
echo ############################################################### ɾ�����е�html�ļ� ����
echo ����վ��Ŀ¼ %~dp0
cd %~dp0
echo �������ط�����
hexo s -p 4001