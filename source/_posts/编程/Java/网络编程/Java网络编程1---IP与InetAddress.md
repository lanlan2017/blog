---
title: Java 网络编程1---IP与InetAddress
categories:
  - 编程
  - Java
  - 网络编程
abbrlink: ef25533d
date: 2019-05-30 16:59:00
updated: 2022-05-13 21:31:07
---
网络可以使不同物理位置上的计算机达到资源共享和通信的目的，在Java中也提供了专门的网络开发程序包----java.net,以方便开发者进行网络程序的开发。
Java的网络编程提供了两种通信协议：TCP(传输控制协议)，UDP(数据报协议)。
**关于TCP和UDP**
TCP和UDP都属于传输层协议，TCP(Transmission Control Protocol)是可靠的传输协议，传输前会采用`三次握手`的方式建立连接，以保证传输的可靠性。
而UDP(User Datagram Protocol)协议是不可靠的传输协议，即发送出去的数据不一定接收得到，网上的聊天工具一般使用UDP协议。
## IP(Internet Protocal)与InetAddress
### IP地址简介
互联网上的每一台计算机都有一个唯一表示自己的标记，这个标记就是IP地址。
IP地址使用32位长度的二进制数据表示，一般在实际中看到的大部分IP地址都是以点分十进制形式表示的，如`192.168.1.1`。
### IP地址格式
IP地址=网络地址+主机地址

 - 网络号：用于识别主机所在的网络。
 - 主机号：用于识别该网络中的主机。
 IP地址分为5类，A类地址保留给政府机构，B类地址分配给中等规模的公司，C类地址分配给任何需要的人，D类地址用户组播，E类地址用于实验，各类地址可以容纳的地址数目不同，这5类地址的范围如下表所示。
|序号|地址分类|地址范围|
|:-:|:-:|:-:|
|1|A类地址|1.0.0.1~126.255.255.254|
|2|B类地址|128.0.0.1~191.255.255.254|
|3|C类地址|192.0.0.1~233.255.255.254|
|4|D类地址|224.0.0.1~239.255.255.254|
|5|E类地址|240.0.0.1~255.255.255.254|
在上面的地址分类表中可以发现没哟`127.X.X.X`的表示，**这是因为`127.X.X.X`是保留地址，用做循环测试**，在开发测试中经常使用127.0.0.1表示本机的IP地址。
####IPv4,IPv6
IPv4(Internet Protocal version 4)是互联网协议的第4个版本，也是使用最广泛的版本，但是IPv4已经无法满足当今互联网上的主机数量，所以在此基础之上有产生的新的版本IPv6,使用IPv6可以比IPv4容纳更多的主机。
### InetAddress
InetAddress类主要表示IP地址，这个类有两个子类：Inet4Address,Inet6Address,一个用于表示IPv4，另一个用于表示IPv6。InetAddress类的常用方法如下表所示。
|序号| |描述|
|-|-|-|
|1|public static InetAddress getByName(String host)throws UnknownHostException|在给定主机名的情况下确定主机的 IP 地址(InetAddress对象)。|
|2|public static InetAddress getLocalHost() throws UnknownHostException|返回本地主机的IP地址(InetAddress对象)|
|3|public String getHostName()|获取此 IP 地址(InetAddress对象)的主机名。|
|4|public boolean isReachable(int timeout) throws IOException|测试是否可以达到该地址。|
实例: 测试InetAddress类

```java
package java1.net.ip;

import java.net.InetAddress;
public class InetAddressDemo
{
	public static void main(String args[]) throws Exception
	{	
		InetAddress locAdd = null;
		InetAddress csdn = null;
		locAdd = InetAddress.getLocalHost();// 得到本机
		//https://www.csdn.net/---注意要把"https://"去掉
		csdn = InetAddress.getByName("blog.csdn.net");
		System.out.println("本机的        IP地址：" + locAdd.getHostAddress());
		System.out.println("   CSDN博客地址：" + csdn.getHostAddress());
		System.out.println("    本机是否可达：" + locAdd.isReachable(5000));
		System.out.println("CSDN博客是否可达：" + csdn.isReachable(5000));
	}
}
```
运行结果：

```
本机的   IP地址：192.168.45.9
   CSDN博客地址：47.95.47.253
    本机是否可达：true
CSDN博客是否可达：true

```
