---
title: eclipse常用设置
categories: 
  - IDE
  - eclipse
abbrlink: 2b8e86b
date: 2018-12-11 20:43:57
updated: 2022-04-04 00:51:45
---
# eclipse for JavaEE下载
## 下载URL
到[https://www.eclipse.org/downloads/packages/](https://www.eclipse.org/downloads/packages/)中找到Eclipse IDE for Java EE Developers,然后点击64位的版本
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/downEclipse/forJavaEEDevelopers.png)
## 选择镜像
点击`>> Select Another Mirror`选择中国的镜像，这样下载可能快一点。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/downEclipse/selectMirror.png)
我这里选上海大学的镜像:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/downEclipse/shanghaiUniversityMirror.png)
## 解压安装
下载好后解压缩即可使用
# eclipse创建工作空间workspace
## 新建文件夹
先创建一个文件夹作为workspace，如下图所示:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/workspace/newWorkSpace/newMulu.png)
## 选择该文件夹作为workspace
然后在eclipse中，依次点击file->switch workspace->others,选择这个新建的目录
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/workspace/newWorkSpace/switchWorkSpace_others.png)
点击ok即可：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/workspace/newWorkSpace/copysettings.png)
# eclipse删除多余的工作区间
之前在eclipse中创建了太多的WorkSpace来放demo了,现在记录一下怎么从eclipse中删除掉这些无用的工作区间。
`window`->`Preferences`->`General`->`startup and shutdown`->`Workspaces`,然后选中，`remove`掉即可。如下图所示:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/removeUselessWorkSpace.png)
# eclipse设置字体
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/settings/textFont/font.png)
# 自动补全
自动补全`Content Assist`
## Java自动补全
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/settings/contentAssist/java.png)
```
.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
```
## XML自动补全
`Window`--`Preferences`--`XML`--`XML Files`--`Editor`--`Content Assist`
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/settings/contentAssist/xml.png)
"`<=:`"替换成:
```
<=: abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
```
注意a前面还有一个空格）
## HTML自动补全
`Window`--`Preferences`--`Web`--`HTML Files`--`Editor`---`Content Assist`，勾选上`Automatically make suggestions`
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/settings/contentAssist/html.png)
"`<=:`"替换成"
```
<=: abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
```
(注意a前面还有一个空格)
## JavaScript自动补全
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/settings/contentAssist/javascript.png)
`Window`--`Preferences`--`JavaScript`--`Editor`---`Content Assist`,勾选上`Enable auto activation`启用自动补全。然后，在`Auto activation triggers for Java Script:`框中，把点号`.`设置为：
```
.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
```
## eclipse 按下syso没有自动提示
### 问题描述
在`eclipse`中按下`syso`时,没有出现`System.out.println()`的自动提示,按下`alt+/`也没有出现自动提示.
### 原因
这是因为没有开启`Template Proposals`(模板建议)引起的,勾选上这个功能就行了。
### 步骤
在`eclipse`中依次点击`Window->Preferences->Java->Editor->Content Assist->Advanced`,然后勾选上右边方框中的`Template Proposals`,最后点击`Apply and Close`即可,如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/CanNotSYSO/1.png)

# 使用外部浏览器打开JavaWeb项目
Window--preferences--General--Web Brower​，选择Use external web browser
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/settings/externalWeb/browser.png)
# eclipse 使用自带暗色主题
`Window`->`Preferences`->`General`->`Appearance`,`Theme:`->`Dark`如下图所示
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/theme/defaultDark/defaultDark.png)
# 设置工作区间为UTF-8
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/encoding/workspace_enchoding.png)
# 设置创建JSP文件使用的编码
在eclipse中，JSP文件的默认编码是ISO-8859-1，每次新增一个JSP文件，就必须手动的将JSP文件的编码格式改为UTF-8。这个挺烦人的。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/encoding/jsp.png)
这样新建的jsp就是UTF-8编码的了。
## 参考链接
[Eclipse设置打开的默认浏览器](https://blog.csdn.net/qq193423571/article/details/76146046)
[https://blog.csdn.net/erlian1992/article/details/53706736](https://blog.csdn.net/erlian1992/article/details/53706736)
[Eclipse怎样删除多余workspace](https://jingyan.baidu.com/article/046a7b3ebb211df9c27fa926.html)

# 使用空格缩进
## Java代码中设置tab键为4个空格
`eclipse`中依次点击`windows`,`preferences`,然后在搜索框中输入`Formatter`,然后选中`Java`>`Code Style`下的`Formatter`,在右侧的界面中点击`Edit`进行编辑
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/TabUse4Space.png)
然后点击展开`Indentation`,在`Tab policy`:下拉框中选择`Spaces only`
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/TabUse4Space/1.png)
最后点击`Apply`即可
## JavaScript代码中设置tab键为4个空格
类似上面的操作,选择`JavaScript`>`Code Style`下的`Formatter`进行设置即可：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/TabUse4Space/2.png)
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/TabUse4Space/3.png)
## XML代码中设置tab键为4个空格
在`preferences`的搜索框中输入`XML`,选择`XML`>`XML Files`下的`Editor`,然后在`Formatting`方框中选择`Indent using spaces`;
`indentation size`:选择`4`,如下图所示:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/TabUse4Space/4.png)
## CSS代码中设置tab键为4个空格
在`preferences`的搜索框中输入`Editor`,找到`Web`>`CSS Files`下的`Editor`
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/TabUse4Space/5.png)
## HTML JSP代码中设置tab键为4个空格
`preferences`>`Web`>`HTML Files`>`Editor`
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/TabUse4Space/6.png)
因为`JSP`代码使用的是`HTML`的模板来渲染的,所以设置好了`HTML`,也是设置好了`JSP`
## 参考资料
[https://blog.csdn.net/qq_37932863/article/details/73611785](https://blog.csdn.net/qq_37932863/article/details/73611785)

# eclipse中安装Spring MVC插件
## 步骤
- `help`
- `Eclipse Marketplace...`
- 在搜索框中输入`spring`查找插件
- 安装第二个插件:`Spring Tools 3 Add-On for Spring Tools 4 3.9.13. RELEASE`

## eclipse中直接创建Spring配置文件
安装好之后就可以直接使用插件来创建Spring的配置文件了,步骤如下:
- 在一个目录(`WEB-INF`)下按下**右键**
- `New`
- `Other... Ctrl+N`
- 搜索框中输入`spring`,或者下拉,找到Spring目录
- 选则`Spring Bean Configuration File`,即可创建Spring配置文件

## eclipse中自动导入Spring名字空间(namespace)
- 在Spring配置文件(`springmvc-connig.xml`)上**右键**
- `Open With`
- `Spring Config Editor`

即可在**文件编辑器下方**找到以下功能:
- `Source`,这个对应的是源代码
- `Namespaces`,点击这个按钮即可导入名字空间
- `Overview`
- `Beans`
- `Context`
- `Mvc`
