---
title: 批处理 ping命令判断是否可以连接到一个网站
categories: 
  - Windows
  - CMD批处理
  - 语法
  - 构建程序相关命令
date: 2019-04-03 17:24:14
updated: 2020-04-11 09:15:21
abbrlink: 318f3e6b
---
<div id='my_toc'><a href="/blog/318f3e6b/#问题描述" class="header_2">问题描述</a>&nbsp;<br><a href="/blog/318f3e6b/#判断当前是否可以联网的批处理" class="header_2">判断当前是否可以联网的批处理</a>&nbsp;<br><a href="/blog/318f3e6b/#应用到程序中" class="header_2">应用到程序中</a>&nbsp;<br><a href="/blog/318f3e6b/#安装程序" class="header_3">安装程序</a>&nbsp;<br><a href="/blog/318f3e6b/#执行程序" class="header_3">执行程序</a>&nbsp;<br><a href="/blog/318f3e6b/#运行结果" class="header_3">运行结果</a>&nbsp;<br><a href="/blog/318f3e6b/#网络连接正常" class="header_4">网络连接正常</a>&nbsp;<br><a href="/blog/318f3e6b/#网络不通时" class="header_4">网络不通时</a>&nbsp;<br><a href="/blog/318f3e6b/#ping命令发送一次请求" class="header_3">ping命令发送一次请求</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 问题描述 ##
使用讯飞语音合成服务需要联网,但是,有时候网络断掉了.我并不知道,程序中也没有提醒.等到我发现合成的不对的时候,再检查网络,已经浪费了一段时间.
所以程序应该先判断一下是否能联网,如果能联网再调用SDK合成语音,如果不能联网则及时给出提示.
## 判断当前是否可以联网的批处理 ##
**xunfei.bat**:
```bat
@echo off
ping www.xfyun.cn > nul
if %errorlevel% leq 0 (
   echo 可以连接到www.xfyun.cn,网络链接正常.
   pause
) else (
   echo 无法连接到www.xfyun.cn,请求检查网络是否连接正常.
   pause
)
```
这里先执行`ping`命令,并根据`ping`命令返回的`errorlevel`来判断是否可以连通,如果可以连接上,`errorlevel`应该为`0`
可以联网时输出：
```cmd
可以连接到www.xfyun.cn,网络链接正常.
请按任意键继续. . .
```
无法联网时输出:
```cmd
无法连接到www.xfyun.cn,请求检查网络是否连接正常.
请按任意键继续. . .
```
## 应用到程序中 ##
### 安装程序 ###
`install.bat`:
```bat
echo ############ 生成启动程序 xunfei.bat... #####
::覆盖写入
echo @echo off>xunfei.bat
echo ::切换盘符>>xunfei.bat
echo %~d0>>xunfei.bat
echo :: 进入文件所在路径>>xunfei.bat
echo cd %~dp0>>xunfei.bat
echo :: 判断是否可以联网,为了节省时间,只发送回显请求1次>>xunfei.bat
echo ping www.xfyun.cn -n 1 ^> nul>>xunfei.bat
echo :: 如果可以联网则执行程序>>xunfei.bat
echo if %%errorlevel%% leq 0 (>>xunfei.bat
echo    echo 网络链接正常.>>xunfei.bat
echo    java -jar "%thispath%\xunfei.jar">>xunfei.bat
echo ) else (>>xunfei.bat
echo :: 如果不可以联网则给出提示>>xunfei.bat
echo    echo 无法连接到www.xfyun.cn,请求检查网络是否连接正常.>>xunfei.bat
echo    pause>>xunfei.bat
echo    exit>>xunfei.bat
echo )>>xunfei.bat
:: ################# 创建启动程序 结束 #################
```
### 执行程序 ###
运行安装程序`install.bat`生成的`xunfei.bat`:
```bat
@echo off
::切换盘符
E:
:: 进入文件所在路径
cd E:\workspace\XunFeiTTS\runable\
:: 判断是否可以联网,为了节省时间,只发送回显请求1次
ping www.xfyun.cn -n 1 > nul
:: 如果可以联网则执行程序
if %errorlevel% leq 0 (
   echo 网络链接正常.
   java -jar "E:\workspace\XunFeiTTS\runable\xunfei.jar"
) else (
:: 如果不可以联网则给出提示
   echo 无法连接到www.xfyun.cn,请求检查网络是否连接正常.
   pause
   exit
)

```
### 运行结果 ###
`xunfei.bat`运行结果如下:
#### 网络连接正常 ####
```cmd
网络链接正常.
######################################## 讯飞语音合成系统 ########################################
输入要合成的文字(以: "#"作为结束符):
```
#### 网络不通时 ####
```cmd
无法连接到www.xfyun.cn,请求检查网络是否连接正常.
请按任意键继续. . .
```
### ping命令发送一次请求 ###
正常的ping命令会回显4次,如下所示:
```cmd
G:\Desktop\书籍\批处理\bat>ping www.xfyun.cn
正在 Ping www.xfyun.cn [42.62.43.138] 具有 32 字节的数据:
来自 42.62.43.138 的回复: 字节=32 时间=66ms TTL=237
来自 42.62.43.138 的回复: 字节=32 时间=146ms TTL=237
来自 42.62.43.138 的回复: 字节=32 时间=136ms TTL=237
来自 42.62.43.138 的回复: 字节=32 时间=126ms TTL=237
42.62.43.138 的 Ping 统计信息:
    数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，
往返行程的估计时间(以毫秒为单位):
    最短 = 66ms，最长 = 146ms，平均 = 118ms
```
为了节省时间,我这里只发送一次请求:
```cmd
G:\Desktop\书籍\批处理\bat>ping www.xfyun.cn -n 1
正在 Ping www.xfyun.cn [42.62.43.138] 具有 32 字节的数据:
来自 42.62.43.138 的回复: 字节=32 时间=57ms TTL=237
42.62.43.138 的 Ping 统计信息:
    数据包: 已发送 = 1，已接收 = 1，丢失 = 0 (0% 丢失)，
往返行程的估计时间(以毫秒为单位):
    最短 = 57ms，最长 = 57ms，平均 = 57ms
```
这样等待时间可以忽略,毕竟等待默认的ping命令执行完毕还是挺难熬的。
