@echo off
echo 切换盘符 %~d0
%~d0
echo 进入文章目录: %~dp0source\_posts\
cd %~dp0source\_posts\
echo.
echo ############################################################### 删除所有的html文件 开始
echo.
for /r . %%i in (*.html) do (
	echo     删除:"%%i"
	del "%%i"
)
echo.
echo ############################################################### 删除所有的html文件 结束
echo 进入站点目录 %~dp0
cd %~dp0
echo 启动本地服务器
hexo s -p 4007