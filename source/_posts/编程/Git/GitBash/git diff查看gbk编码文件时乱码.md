---
title: git diff查看gbk编码文件时乱码
categories:
  - 编程
  - Git
  - GitBash
abbrlink: e32e7f43
date: 2022-05-04 00:38:55
updated: 2022-05-04 00:38:55
---
# git diff查看gbk编码文件时乱码
修改git-bash窗口的文本编码为GBK,然后执行`git diff`比较文件差异。比较完毕后，再把git-bash窗口的文本编码改回UTF-8。
<!-- more -->
## 问题描述
我的批处理(.bat)文件使用的是GBK编码，在使用git diff命令对比该文件前后版本差异时，中文全都乱码了。
```
18190@DESKTOP-SH3MQPI MINGW64 /d/Desktop/test/CMD/phone (master)
$ git status #查看在你上次提交之后是否有对文件进行再次修改
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   刷视频_honor.bat
        modified:   刷视频_oppo.bat
        modified:   快手_honor_逛街.bat
        modified:   快手_oppo_逛街.bat
        modified:   快手_直播_广告_honor.bat
        modified:   快手_直播_广告_oppo.bat
        modified:   浏览后返回_honor.bat
        modified:   阅读_honor.bat
        modified:   阅读_oppo.bat
        modified:   陶特浏览首页_honor.bat
        modified:   陶特浏览首页_oppo.bat

no changes added to commit (use "git add" and/or "git commit -a")

18190@DESKTOP-SH3MQPI MINGW64 /d/Desktop/test/CMD/phone (master)
```
例如，查看第一个文件前后版本的差异：
```
18190@DESKTOP-SH3MQPI MINGW64 /d/Desktop/test/CMD/phone (master)
$ git --no-pager diff 刷视频_honor.bat
diff --git a/刷视频_honor.bat b/刷视频_honor.bat
index 4d6603d..e6d677c 100644
--- a/刷视频_honor.bat
+++ b/刷视频_honor.bat
@@ -2,44 +2,118 @@
 @REM ʹ▒õ▒ǰ▒ļ▒▒▒▒ļ▒▒▒▒▒Ϊcmd▒▒▒ڵı▒▒▒
 title %~nx0

-@REM chcp 65001
-@REM ▒▒ͷ
 @REM ▒л▒▒▒GBK
 chcp 936

-@REM ▒鿴▒▒▒ӵ▒▒▒▒Ե▒▒ֻ▒
-adb devices -l
-set /p phone_id=▒▒▒▒▒ֻ▒▒豸ID:
+echo -------------------▒▒ȡID ▒▒ʼ----------------------
+echo     A:U8ENW18117021408
+echo     B:192.168.10.4:5555
+echo     C:▒▒▒▒ID
+echo -----------
+
+choice /c:abc /t 8 /d a /M "▒▒▒▒ѡ▒▒:"
+    if %errorlevel% == 3 goto choose_c
+    if %errorlevel% == 2 goto choose_b
+    if %errorlevel% == 1 goto choose_a
+
+:choose_a
+    echo     ѡ▒▒A
+    set phone_id=U8ENW18117021408
+    goto get_id_end
+:choose_b
+    echo     ѡ▒▒B
+    set phone_id=192.168.10.4:5555
+    goto get_id_end
+:choose_c
+    echo     ѡ▒▒C
+    @REM ▒鿴▒▒ǰ▒▒▒ӵ▒▒▒▒▒▒ϵ▒▒ֻ▒▒▒ID
+    adb devices -l
+    set /p phone_id=▒▒▒▒▒▒▒ֻ▒ID:
+    goto get_id_end
+
+:get_id_end
+
+echo     ▒ֻ▒ID=%phone_id%
+
+echo -------------------▒▒ȡID ▒▒▒▒----------------------
+
+echo -------------------▒▒ȡʱ▒▒ ▒▒ʼ----------------------
+echo     A:12   ▒▒▒▒ ▒▒▒ؿ▒▒▒׬Ǯ
+echo     B:20   ▒▒▒▒ ▒▒▒▒▒▒▒▒▒ҳ
+echo     C:60   ▒▒▒▒(1Сʱ)
+echo     D:180  ▒▒▒▒(3Сʱ) ˢ▒▒Ƶ▒▒▒ټ▒▒ٰ▒
+echo     E:360  ▒▒▒▒(6Сʱ)
+echo -----------
+
+choice /c:abcde /t 8 /d d /M "▒▒▒▒ѡ▒▒:"
+
+    if %errorlevel% == 5 goto choose_e
+    if %errorlevel% == 4 goto choose_d
+    if %errorlevel% == 3 goto choose_c
+    if %errorlevel% == 2 goto choose_b
+    if %errorlevel% == 1 goto choose_a
+
+:choose_e
+    echo     ѡ▒▒E 360▒▒▒▒(6Сʱ)
+    set /a minute=360
+    goto get_minute_end
+:choose_d
+    echo     ѡ▒▒D 180▒▒▒▒(3Сʱ)
+    set /a minute=180
+    goto get_minute_end
+:choose_c
+    echo     ѡ▒▒C 60▒▒▒▒(1)
+    set /a minute=60
+    goto get_minute_end
+:choose_b
+    echo     ѡ▒▒B 20▒▒▒▒
+    set /a minute=20
+    goto get_minute_end
+:choose_a
+    echo     ѡ▒▒A 12▒▒▒▒
+    set /a minute=12
+    goto get_minute_end
+
+:get_minute_end
+echo     ʱ▒▒=%minute%▒▒▒▒
+echo -------------------▒▒ȡʱ▒▒ ▒▒ʼ----------------------
+
+
+echo -------------------▒▒▒▒▒ֻ▒ ▒▒ʼ----------------------
+set /a time_required=%minute%*60
+

 @REM ▒▒С▒▒▒▒
 set min=8
 @REM ▒▒▒▒▒▒
-set max=14
+set max=16
 @REM ▒▒▒▒▒▒Ҳ▒▒▒▒▒
 set /a mod=%max% - %min% + 1

-echo Сʱ=▒▒▒ӣ▒[1=60,2=120,3=180,4=240,5=300,6=360,7=420,8=480,9=540,10=600,11=660,12=720]
-set /p time=▒▒▒▒▒ʱ▒▒(▒▒▒▒):
-set /a time_required=%time% *60

 @REM ▒▒ʱ▒▒
-set /a time_counter=0
+set /a second_counter=0

 :head
     @REM ▒ȴ▒▒ﵽҪ▒▒▒ʱ▒▒
-    If %time_counter% GTR %time_required% goto tail
+    If %second_counter% GTR %time_required% goto tail

     @REM ▒▒▒▒▒▒▒▒▒▒▒
     set /a seconds=%RANDOM% %% %mod% + %min%

     @REM ▒ϻ▒▒▒Ļ▒▒▒
     adb -s %phone_id% shell input swipe 8 1650 8 700 300
-
+    @REM echo errorlevel=%errorlevel%
+    @REM ▒▒▒adb▒▒▒▒ֵ▒▒▒▒0▒▒▒▒˵▒▒adbִ▒▒ʧ▒ܣ▒▒Ͳ▒▒▒ִ▒▒▒▒
+    if %errorlevel% GTR 0 goto adb_error
+    @REM ͳ▒▒▒Ѿ▒▒ۿ▒▒ķ▒▒▒▒▒
+    set /a minute_counter=%second_counter%/60
     @REM choice /c:yn /t 4 /d n /M ".  ▒▒ͣ▒▒▒▒▒▒y,Ĭ▒▒n,▒▒▒▒▒▒ͣ"
-    echo ....▒ȴ▒:%seconds%▒▒,▒ѵȴ▒:%time_counter%▒▒,Ҫ▒ȴ▒:%time_required%▒▒(%time%▒▒▒▒)
-    choice /c:yn /t %seconds% /d n /M "......▒▒▒▒y▒▒ͣ▒▒▒▒,Ĭ▒▒n,▒▒▒▒▒▒ͣ"
+    echo ....▒ȴ▒:%seconds%▒▒,▒ѵȴ▒:%second_counter%s=%minute_counter%m,Ҫ▒ȴ▒:%time_required%s=%minute%m
+    choice /c:yn /t %seconds% /d n /M "▒Ƿ▒▒▒ͣ?"
     @REM ͳ▒▒▒Ѿ▒▒ȴ▒▒▒ʱ▒▒
-    set /a time_counter+=%seconds%
+    set /a second_counter+=%seconds%
+

     @REM ▒ж▒choice▒▒▒▒ķ▒▒▒ֵ▒▒▒▒ȷ▒▒▒û▒▒▒▒▒▒▒▒Ǹ▒ѡ▒▒
     @REM Ӧ▒▒▒ж▒▒▒ֵ▒▒ߵĴ▒▒▒▒▒
@@ -48,17 +122,20 @@ set /a time_counter=0

 @REM Ĭ▒▒ѡ▒▒N▒▒▒▒▒
 :choose_n
-    echo ........ֱ▒▒▒▒▒▒▒▒ͷ
+    echo   ֱ▒▒▒▒▒▒▒▒ͷ
     echo.
 goto head

 @REM ѡ▒▒Y▒▒▒▒▒
 :choose_y
-    echo ........▒▒֮ͣ▒▒▒▒▒▒▒▒▒▒ͷ
+    echo   ▒▒֮ͣ▒▒▒▒▒▒▒▒▒▒ͷ
     pause
     echo.
 goto head

+@REM ִ▒▒adb▒▒▒▒▒▒▒▒▒▒▒
+:adb_error
+    echo   adb▒▒▒▒ִ▒д▒▒▒
 :tail
-    echo ______▒▒▒▒▒▒▒_______
-    mshta vbscript:msgbox("'%~nx0'_▒▒▒н▒▒▒",4096)(window.close)
+    @REM mshta vbscript:msgbox("'%~nx0'_▒▒▒н▒▒▒",4096)(window.close)
+    echo -------------------▒▒▒▒▒ֻ▒ ▒▒▒▒----------------------
\ No newline at end of file

18190@DESKTOP-SH3MQPI MINGW64 /d/Desktop/test/CMD/phone (master)
```
可以看到有一堆的乱码。

## 解决方案1
### 临时修改git-bash窗口的编码为GBK
在git-bash.exe**窗口顶部按右键。**然后选择**选项**

![image-20220504005609102](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220504005618.png)

点击左侧边栏的文本，然后点击本地Locale后面的字符集下拉框，选择GBK.

![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220504005618.png)

此时再次使用git diff命令，中文显示正常了:

```
18190@DESKTOP-SH3MQPI MINGW64 /d/Desktop/test/CMD/phone (master)
$ git --no-pager diff 鍒疯棰慱honor.bat
diff --git a/鍒疯棰慱honor.bat b/鍒疯棰慱honor.bat
index 4d6603d..e6d677c 100644
--- a/鍒疯棰慱honor.bat
+++ b/鍒疯棰慱honor.bat
@@ -2,44 +2,118 @@
 @REM 使用当前文件的文件名作为cmd窗口的标题
 title %~nx0

-@REM chcp 65001
-@REM 开头
 @REM 切换到GBK
 chcp 936

-@REM 查看链接到电脑的手机
-adb devices -l
-set /p phone_id=输入手机设备ID:
+echo -------------------获取ID 开始----------------------
+echo     A:U8ENW18117021408
+echo     B:192.168.10.4:5555
+echo     C:输入ID
+echo -----------
+
+choice /c:abc /t 8 /d a /M "输入选择:"
+    if %errorlevel% == 3 goto choose_c
+    if %errorlevel% == 2 goto choose_b
+    if %errorlevel% == 1 goto choose_a
+
+:choose_a
+    echo     选择A
+    set phone_id=U8ENW18117021408
+    goto get_id_end
+:choose_b
+    echo     选择B
+    set phone_id=192.168.10.4:5555
+    goto get_id_end
+:choose_c
+    echo     选择C
+    @REM 查看当前连接到电脑上的手机的ID
+    adb devices -l
+    set /p phone_id=请输入手机ID:
+    goto get_id_end
+
+:get_id_end
+
+echo     手机ID=%phone_id%
+
+echo -------------------获取ID 结束----------------------
+
+echo -------------------获取时间 开始----------------------
+echo     A:12   分钟 陶特看看赚钱
+echo     B:20   分钟 陶特浏览首页
+echo     C:60   分钟(1小时)
+echo     D:180  分钟(3小时) 刷视频快速极速版
+echo     E:360  分钟(6小时)
+echo -----------
+
+choice /c:abcde /t 8 /d d /M "输入选择:"
+
+    if %errorlevel% == 5 goto choose_e
+    if %errorlevel% == 4 goto choose_d
+    if %errorlevel% == 3 goto choose_c
+    if %errorlevel% == 2 goto choose_b
+    if %errorlevel% == 1 goto choose_a
+
+:choose_e
+    echo     选择E 360分钟(6小时)
+    set /a minute=360
+    goto get_minute_end
+:choose_d
+    echo     选择D 180分钟(3小时)
+    set /a minute=180
+    goto get_minute_end
+:choose_c
+    echo     选择C 60分钟(1)
+    set /a minute=60
+    goto get_minute_end
+:choose_b
+    echo     选择B 20分钟
+    set /a minute=20
+    goto get_minute_end
+:choose_a
+    echo     选择A 12分钟
+    set /a minute=12
+    goto get_minute_end
+
+:get_minute_end
+echo     时间=%minute%分钟
+echo -------------------获取时间 开始----------------------
+
+
+echo -------------------操作手机 开始----------------------
+set /a time_required=%minute%*60
+

 @REM 最小的秒
 set min=8
 @REM 最大的秒
-set max=14
+set max=16
 @REM 求余的右操作数
 set /a mod=%max% - %min% + 1

-echo 小时=分钟：[1=60,2=120,3=180,4=240,5=300,6=360,7=420,8=480,9=540,10=600,11=660,12=720]
-set /p time=输入的时间(分钟):
-set /a time_required=%time% *60

 @REM 计时器
-set /a time_counter=0
+set /a second_counter=0

 :head
     @REM 等待达到要求的时间
-    If %time_counter% GTR %time_required% goto tail
+    If %second_counter% GTR %time_required% goto tail

     @REM 生成随机秒数
     set /a seconds=%RANDOM% %% %mod% + %min%

     @REM 上划屏幕左侧
     adb -s %phone_id% shell input swipe 8 1650 8 700 300
-
+    @REM echo errorlevel=%errorlevel%
+    @REM 如果adb返回值大于0，则说明adb执行失败，就不在执行了
+    if %errorlevel% GTR 0 goto adb_error
+    @REM 统计已经观看的分钟数
+    set /a minute_counter=%second_counter%/60
     @REM choice /c:yn /t 4 /d n /M ".  暂停请输入y,默认n,即不暂停"
-    echo ....等待:%seconds%秒,已等待:%time_counter%秒,要等待:%time_required%秒(%time%分钟)
-    choice /c:yn /t %seconds% /d n /M "......输入y暂停程序,默认n,即不暂停"
+    echo ....等待:%seconds%秒,已等待:%second_counter%s=%minute_counter%m,要等待:%time_required%s=%minute%m
+    choice /c:yn /t %seconds% /d n /M "是否暂停?"
     @REM 统计已经等待的时间
-    set /a time_counter+=%seconds%
+    set /a second_counter+=%seconds%
+

     @REM 判断choice命令的返回值，来确定用户输入了那个选项
     @REM 应先判断数值最高的错误码
@@ -48,17 +122,20 @@ set /a time_counter=0

 @REM 默认选择N的情况
 :choose_n
-    echo ........直接跳到开头
+    echo   直接跳到开头
     echo.
 goto head

 @REM 选择Y的情况
 :choose_y
-    echo ........暂停之后再跳到开头
+    echo   暂停之后再跳到开头
     pause
     echo.
 goto head

+@REM 执行adb命令出错的情况
+:adb_error
+    echo   adb命令执行错误！
 :tail
-    echo ______程序结束_______
-    mshta vbscript:msgbox("'%~nx0'_运行结束",4096)(window.close)
+    @REM mshta vbscript:msgbox("'%~nx0'_运行结束",4096)(window.close)
+    echo -------------------操作手机 结束----------------------
\ No newline at end of file

18190@DESKTOP-SH3MQPI MINGW64 /d/Desktop/test/CMD/phone (master)
```



### git-bash窗口编码改回原来的UTF-8

不过又出现了新的问题，那就是文件名又乱码了。

，git diff比较完成之后，把git-bash窗口的编码重新修改成UTF-8

