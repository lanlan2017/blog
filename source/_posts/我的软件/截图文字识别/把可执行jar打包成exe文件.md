---
title: 把可执行jar打包成exe文件
categories: 
  - 我的软件
  - 截图文字识别
date: 2018-10-10 19:39:02
updated: 2019-12-17 05:18:53
abbrlink: d7d49994
---
<div id='my_toc'><a href="/blog/d7d49994/#前言" class="header_2">前言</a>&nbsp;<br><a href="/blog/d7d49994/#使用eclipse把java项目打包为可执行jar包" class="header_2">使用eclipse把java项目打包为可执行jar包</a>&nbsp;<br><a href="/blog/d7d49994/#下载安装破解exe4j" class="header_2">下载安装破解exe4j</a>&nbsp;<br><a href="/blog/d7d49994/#下载exe4j" class="header_3">下载exe4j</a>&nbsp;<br><a href="/blog/d7d49994/#解压压缩包" class="header_3">解压压缩包</a>&nbsp;<br><a href="/blog/d7d49994/#安装" class="header_3">安装</a>&nbsp;<br><a href="/blog/d7d49994/#破解" class="header_3">破解</a>&nbsp;<br><a href="/blog/d7d49994/#打包jar为exe" class="header_2">打包jar为exe</a>&nbsp;<br><a href="/blog/d7d49994/#Project-type" class="header_3">Project type</a>&nbsp;<br><a href="/blog/d7d49994/#Application-info" class="header_3">Application info</a>&nbsp;<br><a href="/blog/d7d49994/#Executable-info" class="header_3">Executable info</a>&nbsp;<br><a href="/blog/d7d49994/#Redirection" class="header_4">Redirection</a>&nbsp;<br><a href="/blog/d7d49994/#32-bit-or-64-bit" class="header_4">32-bit or 64-bit</a>&nbsp;<br><a href="/blog/d7d49994/#Java-invocation" class="header_3">Java invocation</a>&nbsp;<br><a href="/blog/d7d49994/#JRE" class="header_3">JRE</a>&nbsp;<br><a href="/blog/d7d49994/#运行生成的exe" class="header_2">运行生成的exe</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 前言 ##
上次的程序我通过使用,我通过`javaw -jar xxx.jar`来启动一个程序，在任务管理器中显示如下：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/javaw_process.png)
如果有一个javaw进行还好，但是我写的java工具程序可能比较多。进程名都是javaw的话不好分辨。**在Windows下可以把可执行jar包打包成exe文件，这样就有自己的进程名，图标。便于我在任务管理器中管理**(不需要时杀掉该进程)。
## 使用eclipse把java项目打包为可执行jar包 ##
在项目上右键选择`Export`:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/eclipse_export.png)
然后展开Java项，选择`Runable JAR File`:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/eclipse_export_runableJarFile.png)
然后选择主类，jar包的输出位置，依赖包的打包方式。最后点击Finish即可。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/runableJarFileExport.png)

## 下载安装破解exe4j ##

### 下载exe4j ###
破解版下载路径:[https://www.jb51.net/softs/541579.html](https://www.jb51.net/softs/541579.html)
### 解压压缩包 ###
下载后，解压压缩包：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe_install.png)
### 安装 ###
点击安装程序`exe4j_windows-x64_5_0_1.exe`进行安装。
### 破解 ###
安装成功后启动`exe4j`,点击`Change License`按钮，然后运行压缩包中的`Keymaker.exe`生成秘钥。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_welcome.png)
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_keymaker.png)
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_License.png)
粘贴秘钥到exe4j，点击OK即可。
## 打包jar为exe ##

### Project type ###
选择`JAR in EXE mode`,然后点击`next`.
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_JaxInExe.png)
### Application info ###
然后输入exe文件的简称，exe文件输出位置。然后`next`
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_Applicationinfo.png)
### Executable info ###
`Executable type:`中选择第一项`GUI application`,表示GUI程序，第二个选项表示控制台程序。
`Executable name:`中输入软件的名称(`OCR`)
`Icon file:`中选择图标的位置,图标需要实现下载好，图标不是必须的，没有也没关系。
**然后展开`Advanced options`选择第一项`Redirection`**
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_Executableinfo.png)
#### Redirection ####
然后勾选`Redirect stderr`,显示错误输出目录，然后点`next`,Service options 和Version info默认即可，所以点击`next`,`next`即可。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exej_Executableinfo_Redirection.png)
#### 32-bit or 64-bit ####
然后选择`Generate 64-bit executable`,生成64位的exe程序。然后`next`,`next`
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_Executable%20info_64bit.png)
### Java invocation ###
到了第5个配置项`Java invocation`这里要把刚才生成的可执行jar包添加进来。以及`所有的依赖包`，点击绿色的加号，添加可执行Jar包
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_Java_Invocation_add_jar.png)

![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_Java_Invocation_add_jar_archive.png)
**导入所有的依赖包**
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_Java_Invocation_add_alljar.png)

然后在`Main class:`选择主类:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_Java_Invocation_add_jar_mainclass.png)
### JRE ###
选择最小支持的版本，最大的版本可以默认不写。然后展开`Advanced options`,选择`Search sequence`。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_JRE_Serch%20sequency.png)
点击绿色的加号
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_JRE_Serchsequency_add.png)
然后，选择找到本地的jre：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_JRE_Serchsequency_add_jre.png)
然后把它移动到最顶端：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_JRE_Serchsequency_moveUp.png)
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exe4j_JRE_Serchsequency_moveUp_yes.png)
然后`next`,

然后默认，`next`：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/exej_JRE_Preferred%20VM.png)
后面一直next即可。
## 运行生成的exe ##
打开输出目录双击运行exe文件即可运行
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/MyApplications/SwingBaiduOCR/runablejar2exe/run_exe.png)


参考：[https://blog.csdn.net/qq_29232943/article/details/52861800](https://blog.csdn.net/qq_29232943/article/details/52861800)
