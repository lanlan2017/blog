@echo off
start HexoS.bat
echo ��ʱ
choice /t 10 /d y /n >nul
echo ���ұ���Ϊhexo��cmd����
tasklist /v /fo csv | findstr /i "cmd.exe" | findstr /i "hexo" > myfile.txt
echo �������ҽ��
REM �Զ���Ϊ�ָ���
FOR /F "delims=, tokens=1,2*" %%i IN (myfile.txt) DO (
    echo %%i,%%j,%%k 
    echo ɱ���� %%j
    taskkill /pid %%j
)
REM pause
REM ɾ����ʱ�ļ�
del myfile.txt
REM pause