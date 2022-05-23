---
title: Java 网络编程5---UDP程序设计
categories:
  - 编程
  - Java
  - 网络编程
abbrlink: 6aa2ee08
date: 2019-05-30 17:00:13
updated: 2022-05-13 21:24:25
---
## UDP简介
`TCP`的所有操作都必须建立可靠的连接，这样肯定会消耗大量的系统资源，为了减少这种开销，在网络中又提供了另一种传输协议---`UDP`协议,**`DUP`连接时一种不可靠的连接**，`UDP`协议广泛的使用与各种聊天工具中。
使用`DUP`发送的消息，接收方不一定会接收到，所有的信息使用数据包的形式发送出去，所以这就要求客户端要始终等待服务器发送的消息才能进行接收，在`Java`中使用`DatagramSocket`类和`DatagramPacket`类完成`UDP`程序的开发。
## UDP程序实现
在UDP开发中使用DatagramPacket类包装一条要发送的信息，之后使用DatagramSocket类用于完成信息的发送操作，这两个类的常用方法如下表所示。
|序号|DatagramPacket类常用方法|描述|
|-|-|-|
|1|`DatagramPacket(byte[] buf, int length)`|构造 DatagramPacket(数据报包)对象，指定数据报包的长度为length|
|2|`DatagramPacket(byte[] buf, int length, InetAddress address, int port)`|构造数据报包对象，指定数据的长度，目标地址，目标端口|
|3|`byte[] getData()`|返回接收的数据|
|4|`int getLength()`|返回将要发送或接收到的数据的长度。|

|序号|DatagramSocket类的常用方法|描述|
|-|-|-|
|1|`DatagramSocket(int port)`|创建数据报套接字并将其绑定到本地主机上的指定端口。|
|2|`void send(DatagramPacket p)`|从此套接字发送数据报包。|
|3|`void receive(DatagramPacket p)`|从此套接字接收数据报包。|

实现UDP程序，首先应该从客户端编写，在客户端指定要接收数据的端口和取得数据。
**实例：UDP客户端---UDPClient**
```java
package my.net.udp;

import java.net.DatagramPacket;
import java.net.DatagramSocket;

public class UDPClient
{
	public static void main(String args[]) throws Exception
	{
		//定义用户接收数据报的引用
		DatagramSocket ds = null; 
		// 开辟空间，以接收数据
		byte[] buf = new byte[1024]; 
		// 声明DatagramPacket对象
		DatagramPacket dp = null; 
		//监听本机的6666端口
		ds = new DatagramSocket(6666);
		// 所有的信息使用buf保存
		dp = new DatagramPacket(buf, 1024); 
		//接收数据到数据报包中
		System.out.println("等待接收信息中...");
		ds.receive(dp);
		String receiveStr= new String(dp.getData(), 0, dp.getLength());
		String str=receiveStr + "from "
				+ dp.getAddress().getHostAddress() + "：" + dp.getPort();
		System.out.println("接收到信息:");
		System.out.println(str); // 输出内容
	}
}
```
**程序运行结果：**
![UDP客户端运行结果](https://img-blog.csdn.net/20180713125025829?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIxODA4OTYx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
程序运行之后，客户端已经打开了监听端口，等待服务器端向客户端发送信息。现在来编写服务端向客户端接收信息。
**实例：DUP发送的服务端程序---UDPServer**

```java
package my.net.udp;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class UDPServer
{
	public static void main(String args[]) throws Exception
	{
		// 定义发送数据报的对象
		DatagramSocket ds = null;
		// 声明DatagramPacket对象
		DatagramPacket dp = null; 
		// 服务端在8888端口上发送信息
		ds = new DatagramSocket(8888); 
		String str = "来着服务器的消息";
		byte[] tosend=str.getBytes();
		//向客户端发送消息
		dp = new DatagramPacket(tosend, tosend.length,
				InetAddress.getByName("localhost"), 6666); 
		System.out.println("服务器正在发送信息...");
		ds.send(dp);
		System.out.println("发送完毕...");
		ds.close();
	}
}
```
**运行结果：**
![DUP客户端的运行结果](https://img-blog.csdn.net/2018071312541898?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIxODA4OTYx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
在服务器端运行完成后，客户端可以接收到来自服务端的消息，此时的客户端的运行结果：
![客户端接收到的消息](https://img-blog.csdn.net/20180713125739342?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIxODA4OTYx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
