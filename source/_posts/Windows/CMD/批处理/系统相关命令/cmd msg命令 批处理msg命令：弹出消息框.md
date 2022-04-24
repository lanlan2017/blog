---
title: cmd msg命令 批处理msg命令：弹出消息框
categories:
  - Windows
  - CMD
  - 批处理
  - 系统相关命令
abbrlink: 645c3bd2
date: 2022-04-24 15:20:55
updated: 2022-04-24 15:20:55
---
# cmd msg命令 批处理msg命令

msg命令可以弹出一个消息框，我们可以在.bat脚本中使用这个命令来 显示脚本已经运行结束的消息。

<!-- more -->
## MSG命令帮助文档

```cmd
D:\Desktop\test\CMD>msg
将消息发送给用户。

MSG {username | sessionname | sessionid | @filename | *}
    [/SERVER:servername] [/TIME:seconds] [/V] [/W] [message]

  username            标识指定的用户名。
  sessionname         会话名。
  sessionid           会话 ID。
  @filename           识别这样一个文件，该文件含有将所发消息发送到的用户
                      名、会话名和会话标识号的列表。
  *                   给指定服务器上的所有会话发送信息。
  /SERVER:servername  要联系的服务器(默认值是当前值)。
  /TIME:seconds       等待接收器确认消息的时间延迟。
  /V                  显示有关执行的操作的信息。
  /W                  等待用户的响应，跟 /V 一起有用。
  message             要发送的消息。如果没有指定，发出提示，或者从 stdin
                      读取。
```
## 示例向当前用户发送提示消息
```cmd
msg %username% "hello world"
```
运行效果：

![image-20220424151851957](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220424151852.png)

## 使用VSScript实现

```bat
mshta vbscript:msgbox("hello world!")(window.close)
```
弹窗效果：

![image-20220424160519239](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220424160519.png)

```bat
mshta vbscript:msgbox("hello world!",4096)(window.close)
```
弹窗效果：

![image-20220424160554116](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2022/04/20220424160554.png)

# 参考资料
http://www.bathome.net/thread-36599-1-1.html