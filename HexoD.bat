@echo off
echo �л��̷� %~d0
%~d0
echo ��������Ŀ¼: %~dp0source\_posts\
cd %~dp0source\_posts\
echo.
echo ############################################################### ɾ�����е�html�ļ� ��ʼ
echo.
for /r . %%i in (*.html) do (
	echo     ɾ��:"%%i"
	del "%%i"
)
echo.
echo ############################################################### ɾ�����е�html�ļ� ����
echo �����Զ���Ŀ¼
java -jar "E:\dev2\idea_workspace\MyJavaTools\runable\FM.jar" toc %~dp0source\_posts\
echo ��վ��Ŀ¼:%~dp0 ��git-bash
start git-bash --cd=%~dp0
REM pause