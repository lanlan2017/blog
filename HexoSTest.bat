@echo off
start HexoS.bat
echo 延时
choice /t 10 /d y /n >nul
echo 查找标题为hexo的cmd窗口
tasklist /v /fo csv | findstr /i "cmd.exe" | findstr /i "hexo" > myfile.txt
echo 遍历查找结果
REM 以逗号为分隔符
FOR /F "delims=, tokens=1,2*" %%i IN (myfile.txt) DO (
    echo %%i,%%j,%%k 
    echo 杀进程 %%j
    taskkill /pid %%j
)
REM pause
REM 删除临时文件
del myfile.txt
REM pause