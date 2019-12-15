---
title: Java IO流 Console类
categories: 
  - Java
  - Java IO流
date: 2018-08-12 12:51:31
updated: 2019-12-09 20:34:56
abbrlink: eaae884d
---
Console类
# Java中Console类的用法 #
参考1:[https://blog.csdn.net/ChengXuYuanXingCheng/article/details/71430068、](https://blog.csdn.net/ChengXuYuanXingCheng/article/details/71430068、)
参考2：[https://www.jb51.net/article/118527.htm](https://www.jb51.net/article/118527.htm)


`java`的`Console`类的使用方法及实例

`JDK` 6中提供了`java.io.Console`类专用来访问基于字符的控制台设备。如果你的`Java`程序要与`Windows`下的`cmd`或者`Linux`下的`Terminal`交互，就可以用这个`Java Console`类代劳。由于`Scanner`类输入是可见的，故`Scanner`类不适用于从控制台读取密码。从`Java se 6`开始加入了`Console`类来解决此问题。

要注意的是，**以`javaw`所执行的应用程序，没有主控台（`Console`），也就取不到`Console`对象（例如在`Eclipse`中）。**

## 读控制台方法 ##
|方法|描述|
|:-|:-|
|`String readLine()`|从控制台读取单行文本。 |
|`String readLine(String fmt, Object... args)`|提供一个格式化提示，然后从控制台读取单行文本。 |
|`char[] readPassword()`|从控制台读取密码，禁用回显。 |
|`char[] readPassword(String fmt, Object... args)`|提供一个格式化提示，然后从控制台读取密码，禁用回显。 |


`Console`类也提供有`reader()`与`writer()`方法，可以传回 `Reader`、 `Writer` 对象，以便进行其它的`IO`处理，例如结合`Scanner`一同使用：

`Scanner scanner = new Scanner(System.console().reader());`

### 实例：读密码不回显 ###
```
package study.news;

import java.io.Console;
public class TestConsole
{
    public static void main(String[] args)
    {
        Console console = System.console();
        //读入用户名
        String username = console.readLine("User name:");
        //读入密码
        char[] passwd = console.readPassword("Password:");
        console.printf("user:" + username + "\n");
        console.printf(String.valueOf(passwd));
    }
}
```
**因为`Java.io.Console` 只能用在标准输入、输出流未被重定向的原始控制台中使用，在 `Eclipse` 或者其他 `IDE` 的控制台是用不了的。**
所以我们到cmd控制台中来编译运行这个实例：
编译:`javac -d . TestConsole.java`
运行:`study.news.TestConsole`
输入密码：`123456`，可以看到密码`123456`没有显示在控制台上。
![](https://i.imgur.com/w4pe1YY.png)

运行结果：

![](https://i.imgur.com/PH5Eyc1.png)

readLine()和readPassword()方法，还可以像c语言中的printf,使用变参和格式符那样打印输出信息。
```
Console console = System.console();
String username = console.readLine("%s", "你是谁:");
char[] password = console.readPassword("%s!请输入口令:", username);
System.out.println("username:"+username);
System.out.println("password:"+new String(password));
```
运行结果：
```
你是谁:xiaoming
xiaoming!请输入口令:
username:xiaoming
password:qunide
```
## 获取控制台的输入输出流 ##

|方法|描述|
|:-|:-|
|`Reader reader()`|获取与此控制台关联的唯一 Reader 对象。 |
|`PrintWriter writer()`|获取与此控制台关联的唯一 PrintWriter 对象。 |
|`void flush()`|刷新控制台，并强制立即写入所有缓冲的输出。 |


### 获取来自控制台的输入流 ###

```java

public static void testConsoleReader()
{
    Console console = System.console();
    if (console != null)
    {
        System.out.print("输入以#结束");
        Pattern endRegex = Pattern.compile("([^#]*)#");
        Matcher isEnd;
        // 获取控制台的字符输入流,这样可以读取到我们在控制台上打的字
        Scanner scan = new Scanner(console.reader());
        String str;
        StringBuilder builder = new StringBuilder();
        while (scan.hasNext())
        {
            str = scan.next();
            isEnd = endRegex.matcher(str);
            // matches()会匹配整个字符串匹配后匹配的下表
            if (isEnd.matches())
            {
                // 使用group()进行捕获的前提一定要是在匹配的情况下
                // 可以在matches(),find(),lonkingAt()返回true的时候调用
                builder.append(isEnd.group(1));
                break;
            }
            builder.append(str);
            // System.out.println(str);
        }
        System.out.println("接收到控制台输入：");
        System.out.println(builder.toString());
    }
}
```
运行结果：
![](https://i.imgur.com/F8tFJ50.png)
使用这种方式，可以一次读入多行字符。不过这样其实和new Scanner(System.in)没啥区别了。
也可以使用`BufferedReader`类包装`console.reader()`
```java
public static void testConsoleReader2() throws IOException
{
    Console console = System.console();
    if (console != null)
    {
        System.out.print("输入以#结束");
        Pattern endRegex = Pattern.compile("([^#]*)#");
        Matcher isEnd;
        // 获取控制台的字符输入流,这样可以读取到我们在控制台上打的字
//            Scanner scan = new Scanner(console.reader());
        
        BufferedReader reader=new BufferedReader(console.reader());
        String line;
        //设置默认大小为100,面输入字符过多使得StringBuilder频繁扩容,每次扩容的长度是当前长度(length*2+2)
        StringBuilder builder = new StringBuilder(100);
        while ((line=reader.readLine())!=null)
        {
            isEnd = endRegex.matcher(line);
            // matches()会匹配整个字符串匹配后匹配的下表
            if (isEnd.matches())
            {
                // 使用group()进行捕获的前提一定要是在匹配的情况下
                // 可以在matches(),find(),lonkingAt()返回true的时候调用
                builder.append(isEnd.group(1));
                break;
            }
            builder.append(line);
        }
        System.out.println("接收到控制台输入：");
        System.out.println(builder.toString());
        reader.close();
    }
}
```
### 获取对控制台的输出流 ###
console.writer()可以获取对控制台的输出流(PrintWriter)
```java
public static void testConsoleWriter()
{
    Console console = null;
    PrintWriter out = null;
    try
    {
        console = System.console();
        if (console != null)
        {
            // 获取控制台的PrintWriter实例，也就是对控制台的输出
            out = console.writer();
            out.println("这句话将输出到控制台中");
        }
    } catch (Exception ex)
    {
        ex.printStackTrace();
    }
}
```
运行结果：
![](https://i.imgur.com/NnYKwnM.png)

### 使用Console类自己的控制台输入和输出方法 ###
上面的控制台输出，我们借助于System.out.prinln()方法实现的。既然讲Console类，那就使用Console类自己的方式来进行输入和输出。
```java
public static void testReaderWriter()
{
    Console console =null;
    console=System.console();
    if(console!=null)
    {
        PrintWriter consoleOut=console.writer();
        BufferedReader consoleIn=new BufferedReader(console.reader());
        String line=null;
        try
        {
            while((line=consoleIn.readLine())!=null)
            {
                if(line.equals("exit"))
                    break;
                consoleOut.println("你输入了："+line);
            }
        } catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
```
## 控制台格式化输出方法 ##
|方法|描述|
|:-|:-|
|`Console format(String fmt, Object... args)`|使用指定格式字符串和参数将格式化字符串写入此控制台的输出流中。 |
|`Console printf(String format, Object... args)`|使用指定格式字符串和参数将格式化字符串写入此控制台输出流的便捷方法。 |

printf()源码：
```java
public Console printf(String format, Object ... args) 
{
    return format(format, args);
}
```
可以看到`printf()`方法还是原封不动的调用`format`方法来实现
`format`源码：
```java
private Formatter formatter;
......
public Console format(String fmt, Object ...args) 
{
    formatter.format(fmt, args).flush();
    return this;
}
```
可以看到这里的`format`方法是使用`Formatter`类的`formatter`方法来实现的。
