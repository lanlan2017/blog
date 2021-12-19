---
title: Java网络编程 TCP编程 发送接收对象 对象序列化反序列化
categories: 
  - 编程
  - Java
  - Java 网络编程
date: 2019-05-30 18:31:18
updated: 2021-03-20 09:28:56
abbrlink: e303557d
---
# Java网络编程 TCP编程 发送接收对象 对象序列化反序列化

## 对象序列化
前提条件:必须实现`java.io.Serializable`接口.
```java
//ObjectOutputStream(OutputStream out)
// 1.所以传入的参数正确就行,我这里是对服务器的输出流
outputToServer = new ObjectOutputStream(client.getOutputStream());
// 2.把命令行参数序列化到服务器
outputToServer.writeObject(args);
// 3.一定要刷新,对象不会发送出去
outputToServer.flush();
// 4.在最后关闭
//outputToServer.close();
```
## 对象反序列化
```java
// 接收服务端的序列化信息
inputByServer = new ObjectInputStream(client.getInputStream());
// 反序列化成对象(字符串数组)
String[] inputArg = (String[]) inputByServer.readObject();
```
## 实例
### 通信流程
客户端和服务端通信流程如下
客户端会把接收到的命令行参数(String数组)发送给服务端,
服务端接收该字符串数组,然后、打印到服务端的控制台上,并把这个字符串数组原样发送给客户端,
然后客户端接收服务端发送过来的字符串数组,转换之后打印到控制台上.
### 服务端主线程
```java
package tcp.arg;
import java.net.ServerSocket;
import java.net.Socket;
public class EchoThreadServerByArgs
{
    // 静态变量,可以更改该标记以便停止服务端
    private static boolean isServerAlive = true;
    private static int clientNum = 0;
    public static void main(String args[]) throws Exception
    {
        // 1.定义服务器的引用
        ServerSocket server = null;
        // 2.客户端的引用
        Socket client = null;
        // 3.建立服务器，监听本地6666端口
        server = new ServerSocket(6666);
        while (isServerAlive)
        {
            System.out.println("等待客户端连接...");
            // 4.取得连接，客户端没连接之前先等待连接。
            client = server.accept();
            System.out.println("    客户端连接成功,当前客户端数量:" + clientNum);
            if (isServerAlive)
            {
                // 一个客户端连接之后，为该客户端启动一个服务线程进行服务
                new Thread(new EchoThreadByArgs(client)).start();
            }
        }
        server.close();
        client.close();
        System.out.println("服务端已经停止...");
    }
    public static void addClientNum()
    {
        clientNum = clientNum + 1;
        // 注意了,下面的赋值方法错误
        // 后++:先取值,再增加,这将达不到增加的效果
        // clientNum = clientNum ++;
    }
    public static void minusClientNum()
    {
        clientNum = clientNum - 1;
    }
    public static int getClientNum()
    {
        return clientNum;
    }
    public static void shutdownServer()
    {
        isServerAlive = false;
    }
    public static boolean isServerAlive()
    {
        return isServerAlive;
    }
}
```
### 服务端响应线程
```java
package tcp.arg;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import tcp.EchoThreadServer;
public class EchoThreadByArgs implements Runnable
{
    // 客户端引用
    private Socket client = null;
    int clienId;
    // 构造函数
    public EchoThreadByArgs(Socket client)
    {
        this.client = client;
        // 设置服务线程编号
        this.clienId = EchoThreadServer.getClientNum();
        // 服务线程数量加1
        EchoThreadServer.addClientNum();
    }
    // 线程执行体
    public void run()
    {
        // 接收客户端的输入
        ObjectInputStream inoutFromClient = null;
        ObjectOutputStream outputToClient = null;
        try
        {
            // 接收客户端的输入
            inoutFromClient = new ObjectInputStream(client.getInputStream());
            String[] inputArg = (String[]) inoutFromClient.readObject();
            for (String string : inputArg)
            {
                System.out.println(string);
            }
            // 输出对象到客户端
            outputToClient = new ObjectOutputStream(client.getOutputStream());
            outputToClient.writeObject(inputArg);
            // 一定要刷新,不然客户端接收不到
            outputToClient.flush();
        } catch (Exception e)
        {
            e.printStackTrace();
        } finally
        {
            if (inoutFromClient != null)
            {
                try
                {
                    inoutFromClient.close();
                } catch (IOException e)
                {
                }
            }
            if (outputToClient != null)
            {
                try
                {
                    outputToClient.close();
                } catch (IOException e)
                {
                }
            }
        }
    }
}
```
### 客户端线程
```java
package tcp.arg;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
public class EchoClientByArgs
{
    public static void main(String[] args)
    {
        // 定义客户端引用
        Socket client = null;
        try
        {
            // 创建客户端监听本机的6666端口
            client = new Socket("localhost", 6666);
        } catch (UnknownHostException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        ObjectOutputStream outputToServer = null;
        ObjectInputStream inputByServer = null;
        try
        {
            outputToServer = new ObjectOutputStream(client.getOutputStream());
            // 把命令行参数序列化到服务器
            outputToServer.writeObject(args);
            outputToServer.flush();
            // 注意先后顺序,一定要写在发送之前
            // 接收服务端的序列化信息
            inputByServer = new ObjectInputStream(client.getInputStream());
            // 反序列化成对象(字符串数组)
            String[] inputArg = (String[]) inputByServer.readObject();
            // 遍历数组
            for (String string : inputArg)
            {
                System.out.println(string);
            }
        } catch (IOException | ClassNotFoundException e)
        {
            e.printStackTrace();
        } finally
        {
            if (outputToServer != null)
            {
                try
                {
                    outputToServer.close();
                } catch (IOException e)
                {
                }
            }
            if (inputByServer != null)
            {
                try
                {
                    inputByServer.close();
                } catch (IOException e)
                {
                }
            }
        }
    }
}
```
### 运行效果
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/net/TCP/6.png)
