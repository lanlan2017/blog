---
title: 根据Java源码生成流程图
categories: 
  - 其他
  - 流程图
date: 2018-12-08 00:07:22
updated: 2019-12-09 19:45:23
abbrlink: 358dbd0e
---
<div id='my_toc'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/358dbd0e/#前言">前言</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/358dbd0e/#工具软件">工具软件</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/358dbd0e/#安装步骤">安装步骤</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/358dbd0e/#下载demo版安装包">下载demo版安装包</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/358dbd0e/#安装demo版本">安装demo版本</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/358dbd0e/#使用demo版本生成流程图">使用demo版本生成流程图</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/358dbd0e/#参考链接">参考链接</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
## 前言 ##
最近我写了点操作数据库的代码，但是呢，要在报告里画上流程图。手动来画的话很繁琐，于是我就想着有没有工具可以根据java源代码直接生成流程图。网上找了一番找到一个可以免费`试用`的流程图生成工具(`visustin`)。
## 工具软件 ##
**visustin**这个软件是一个`代码转换成流程图`的神器，支持43种语言，包括C/C++，Java等等等等。这是一款收费的软件，不过好在其官网提供了一个demo版本可供用户下载使用。使用demo版，就可以根据Java代码生成流程图了，不过这个图你只能看，不能保存，也不能导出到word或者Visio中。但是这样就足够了，我们可以使用截图软件把流程图保存下来即可。
## 安装步骤 ##
### 下载demo版安装包 ###
进入官方网站:[http://www.aivosto.com/visustin.html](http://www.aivosto.com/visustin.html)：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/codetoflow/welcome.png)
然后下来找到**Download for free**标题下面的`Download demo`链接地址：[http://www.aivosto.com/getshareware.html](http://www.aivosto.com/getshareware.html)：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/codetoflow/downloadDemo.png)
点击进入，然后点击`Go download`链接:[http://www.aivosto.com/download.html](http://www.aivosto.com/download.html)跳过问卷直接下载：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/codetoflow/quitQues.png)
然后找到**Free downloads for Windows**标题，选择最新的版本，点击`Download demo`链接[http://www.aivosto.com/shareware/visus805.zip](http://www.aivosto.com/shareware/visus805.zip)下载即可：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/codetoflow/dowmdemofree.png)
### 安装demo版本 ###
下载到的Demo程序是个压缩包，解压下载的压缩包，然后点击`setup.exe`进行安装。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/codetoflow/unzip_install.png)
### 使用demo版本生成流程图 ###
java代码：
```java
// 事件监听
public void actionPerformed(ActionEvent e)
{
    // 如果按下的录入按钮
    if (e.getSource() == insert)
    {
        Student student = Student.getInstance();
        // 获取文本框中的文本
        getAllInputs(student);
        // 检查是否全都输入了
        if (!isInputAll(student))
        {
            JOptionPane.showMessageDialog(this, "请全部填写所有输入项");
        } else
        {
            // 判断
            if (canBeInsert())
            {
                insetIntoStudent(student);
                JOptionPane.showMessageDialog(this, "录入成功!", "信息管理系统",
                        JOptionPane.INFORMATION_MESSAGE);
            }
        }
    }
    // 如果按下了重置按钮
    else if (e.getSource() == reset)
    {
        // 清空所有的输入框
        cleanInput();
    }
}
```
打开软件，选择开发语言为:Java:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/codetoflow/useJava.png)
开始界面如下：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/codetoflow/startupshow.png)
取消勾选，下次不再显示。
然后在code输入框中，粘贴java代码，点击下方的Drow生成流程图，生成的流程图可以在右侧的窗口中显示。点击下方的Editor按钮可以编辑生成的流程图：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/codetoflow/shiyong.png)
双击流程图的各个文本框，就可以改变里面的文本：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/codetoflow/edit.png)
修改完毕后使用截图工具，截图保存即可：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Others/codetoflow/editResult.png)
使用demo版本可以实现基本功能。但是如果想到处到Word或者Visio中就要使用付费版的。如果你嫌弃画面太丑了，可以用其他工具照着着重新画一遍这里推荐[https://www.processon.com/](https://www.processon.com/)这个在线工具。不过差不多啦，能看就行了。
## 参考链接 ##
[https://www.cnblogs.com/aademeng/articles/6905351.html](https://www.cnblogs.com/aademeng/articles/6905351.html)