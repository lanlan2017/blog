---
title: JavaIO流 File类
categories: 
  - 编程
  - Java
  - Java IO流
  - 基础
date: 2018-08-11 16:19:23
updated: 2021-03-20 08:44:48
abbrlink: 833486b4
---
<div id='my_toc'><a href="/blog/833486b4/#File类简介" class="header_1">File类简介</a>&nbsp;<br><a href="/blog/833486b4/#File类方法" class="header_1">File类方法</a>&nbsp;<br><a href="/blog/833486b4/#继承关系" class="header_2">继承关系</a>&nbsp;<br><a href="/blog/833486b4/#字段" class="header_2">字段</a>&nbsp;<br><a href="/blog/833486b4/#构造函数" class="header_2">构造函数</a>&nbsp;<br><a href="/blog/833486b4/#判断方法" class="header_2">判断方法</a>&nbsp;<br><a href="/blog/833486b4/#详细说明：" class="header_3">详细说明：</a>&nbsp;<br><a href="/blog/833486b4/#创建文件或目录方法" class="header_2">创建文件或目录方法</a>&nbsp;<br><a href="/blog/833486b4/#当文件不存在时创建该文件" class="header_3">当文件不存在时创建该文件</a>&nbsp;<br><a href="/blog/833486b4/#当目录不存在时创建该目录" class="header_3">当目录不存在时创建该目录:</a>&nbsp;<br><a href="/blog/833486b4/#删除文件或目录" class="header_2">删除文件或目录</a>&nbsp;<br><a href="/blog/833486b4/#获取文件信息方法" class="header_2">获取文件信息方法</a>&nbsp;<br><a href="/blog/833486b4/#路径相关方法" class="header_2">路径相关方法</a>&nbsp;<br><a href="/blog/833486b4/#返回目录列表" class="header_3">返回目录列表</a>&nbsp;<br><a href="/blog/833486b4/#6-代码实例" class="header_1">6.代码实例</a>&nbsp;<br><a href="/blog/833486b4/#-1-构造函数实例：" class="header_2">(1)构造函数实例：</a>&nbsp;<br><a href="/blog/833486b4/#-2-创建文件或目录实例：" class="header_2">(2)创建文件或目录实例：</a>&nbsp;<br><a href="/blog/833486b4/#-3-判断文件函数：exists-isFile-isAbsolute-isDirectory-canRead-canWrite-isHidden" class="header_2">(3)判断文件函数：exists(),isFile(),isAbsolute(),isDirectory(),canRead(),canWrite(),isHidden()</a>&nbsp;<br><a href="/blog/833486b4/#-4-获取，操作文件属性函数" class="header_2">(4)获取，操作文件属性函数</a>&nbsp;<br><a href="/blog/833486b4/#7-有些困惑的地方" class="header_2">7.有些困惑的地方</a>&nbsp;<br><a href="/blog/833486b4/#-3-list-和listFile-的区别" class="header_3">(3) list()和listFile()的区别</a>&nbsp;<br><a href="/blog/833486b4/#-4-使用listFiles-函数-递归遍历所有的目录：" class="header_3">(4)使用listFiles()函数,递归遍历所有的目录：</a>&nbsp;<br><a href="/blog/833486b4/#8-文件过滤器FilenameFilter接口" class="header_3">8.文件过滤器FilenameFilter接口</a>&nbsp;<br><a href="/blog/833486b4/#一、FilenameFilter介绍" class="header_1">一、FilenameFilter介绍</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# File类简介

`File`是`java.io`包下面的一个类，代表与平台无关的文件或者目录。`Java`中，无论文件还是目录，都可以看作`File`类的一个对象。`File`类能对文件或目录新建，删除，获取属性等操作，但是不能直接操作文件内容（文件内容需要用数据流访问）。也就是`File`类只用于表示文件(目录)的信息(名称、大小等),不能用于文件内容的访问。

`JVM`默认会将`workspace`作为相对路径，即`user.dir`系统变量所指路径, 即如果这样初始化`file`对象，`File file = new File(".");` 就是获取了`user.dir`路径。

# File类方法
## 继承关系
```
java.lang.Object
  |----> java.io.File
```
## 字段
|方法|描述|
|:-|:-|
|`static String pathSeparator`|与系统有关的路径分隔符，为了方便，它被表示为一个字符串。 |
|`static char pathSeparatorChar`|与系统有关的路径分隔符。 |
|`static String separator`|与系统有关的默认名称分隔符，为了方便，它被表示为一个字符串。 |
|`static char separatorChar`|与系统有关的默认名称分隔符。 |

其中常用的是第三个`File.separator`,这个表示与系统相关的路径分隔符，因为在Windows下的路径分隔符为:`\`而在Linux下的路径分隔符为:`/`，所以当直接使用"`\`"或者"`/`"时作为路径分隔符时，在跨平台使用时会报`No Such file or diretory`异常。
所以需要跨平台使用时，应该使用`File.separator`作为路径分隔符。

例如window下平常使用路径为：
```
File file=new File(".\\test\\demo.txt");
```
应该改为：
```
File file = new File("."+ File.separator +"demo.txt");
```
这样编译好的代码可以在linux中正常运行。

```java
package test.before;

import java.io.File;
import java.io.IOException;

public class TestFile
{
        public static void main(String[] args) throws IOException
        {
                File file=new File("."+File.separator+"gbk.txt");
//              File file=new File(".\\gbk.txt");
                System.out.println(file.getAbsolutePath());
                System.out.println(file.isFile());
        }
}
```
首先在工程目录下创建以名为`gbk.txt`的文件
Window中的输出结果：
```
D:\dev\workspace\IO\.\gbk.txt
true
```
Linux中的输出结果：
```
/home/lan/桌面/java/test/./gbk.txt
true
```
可以看到虽然文件分隔符都不一样的使用了`File.separator`可以跨平台。如果改成`File file=new File(".\\gbk.txt");`将在Linux中运行出错。
```
/home/lan/桌面/java/test/.\gbk.txt
false
```
## 构造函数

|方法|描述|
|:-|:-|
|`File(String pathname);`|根据字符串路径来创建File对象|
|`File(String parent, String child) ;`|根据父路径字符串，和文件或者目录名来创建File对象|
|`File(File parent, String child);`|根据父路径的File对象，和子文件(子目录)的名称来创建File对象|
## 判断方法

|方法|描述|
|:-|:-|
|`public boolean exists()`|判断文件或目录是否存在|
|`public boolean isFile()`|判断该File对象是不是一个文件|
|`public boolean isDirectory()`|判断该File对象是不是目录|
|`public boolean isAbsolute()`|判断该File对象是不是绝对路径|
|`public boolean canRead()`|判断程序是否可读该文件|
|`public boolean canWrite()`|判断程序是否可写该文件|
|`public boolean isHidden()`|判断该文件是不是隐藏文件|

### 详细说明：

> - `public boolean exists()`测试此抽象路径名表示的文件或目录是否存在。 
> 返回：
> &emsp;&emsp;&emsp;&emsp;当且仅当此抽象路径名表示的`文件或目录存在时，返回 true`；否则返回 false 
> - `public boolean isFile()` 测试此抽象路径名表示的文件`是否是一个标准文件`。如果该文件不是一个目录，并且满足其他与系统有关的标准，那么该文件是标准 文件。由 Java 应用程序创建的所有非目录文件一定是标准文件。 
> 返回：
> &emsp;&emsp;&emsp;&emsp;当且仅当此抽象路径名表示的`文件存在且 是一个标准文件时，返回 true`；否则返回 false 。
>- ` public boolean isDirectory()` 测试此抽象路径名表示的文件`是否是一个目录`。 
> 返回：
> &emsp;&emsp;&emsp;&emsp;当且仅当此抽象路径名表示的文件`存在且 是一个目录时，返回 true`；否则返回 false 

所以,这三个方法都会去判断文件是否存在，isFile()和isDirectory()会在文件存在的基础之上判断该文件是标准文件还是目录

>-  `public boolean isAbsolute()` 测试此抽象路径名是否为绝对路径名。绝对路径名的定义与系统有关。
>    - 在 UNIX 系统上，如果路径名的前缀是 "/"，那么该路径名是绝对路径名。
>    - 在 Microsoft Windows 系统上，如果路径名的前缀是后跟 "\\" 的盘符，或者是 "\\\\"，那么该路径名是绝对路径名。
>     
> 返回：
> &emsp;&emsp;&emsp;&emsp;如果此抽象路径名是绝对路径名，则返回 true；否则返回 false

> - `public boolean canRead()` 测试应用程序是否可以读取此抽象路径名表示的文件。 
>  返回：
> &emsp;&emsp;&emsp;&emsp;当且仅当此抽象路径名指定的文件存在且 可被应用程序读取时，返回 true；否则返回 false 

> - `public boolean isHidden()`测试此抽象路径名指定的文件是否是一个隐藏文件。隐藏 的具体定义与系统有关
>     - 在 UNIX 系统上，如果文件名以句点字符 ('.') 开头，则认为该文件被隐藏。
>     - 在 Microsoft Windows 系统上，如果在文件系统中文件被标记为隐藏，则认为该文件被隐藏。 
>     
>  返回：
>  &emsp;&emsp;&emsp;&emsp;当且仅当此抽象路径名表示的文件根据底层平台约定是隐藏文件时，返回 true 

**总结：我还是应该多看看API**

## 创建文件或目录方法

|方法|描述|
|:-|:-|
|`boolean createNewFile()`|当文件不存在的时候创建一个文件。如果指定的文件不存在则创建，则返回 true；如果指定的文件已经存在，则返回 false|
|`boolean mkdir();`|创建一个该抽象路径对应的目录，如果新建的目录的上级目录不存在则mkdir()回报异常，创建文件夹|
|`boolean mkdirs();`|创建多级目录，创建此抽象路径名指定的目录，包括所有必需但不存在的父目录。注意，此操作失败时也可能已经成功地创建了一部分必需的父目录。|
<!--上次看到这里-->
**实例：**

### 当文件不存在时创建该文件
```java
File file=new File("file2.txt");
if(!file.exists())
{
    file.createNewFile();
}
```
### 当目录不存在时创建该目录:
```java
File file=new File("file2.txt");
if(!file.exists())
{
    file. mkdir();
}
```

## 删除文件或目录

|方法|描述|
|:-|:-|
|`boolean delete();`|删除此抽象路径名表示的文件或目录。**如果此路径名表示一个目录，则该目录必须为空才能删除。**|

## 获取文件信息方法
|方法|描述|
|:-|:-|
|`public long length()`|返回文件的大小 以字节为单位；如果文件不存在，则返回 0L。对于表示特定于系统的实体比如设备或管道）的路径名，某些操作系统可能返回0L|
|`public String getName()`|返回由此File对象表示的文件或目录的名称。该名称是路径名名称序列中的最后一个名称。如果路径名名称序列为空，则返回空字符串。|
|`public long lastModified()`|返回文件最后一次被修改的时间,用与时间点（1970 年 1 月 1 日，00:00:00 GMT）之间的毫秒数表示；|
|`public boolean renameTo(File dest)`|重命名该文件为dest.如果文件名为dest的文件不存在|

## 路径相关方法
|方法|描述|
|:-|:-|
|`public String getParent()`|返回父路径名称字符串|
|`public File getParentFile()`|返回父路径的File对象|
|`public String getPath();`|获取相对路径字符串|
|`public String getAbsolutePath();`|获取绝对路径字符串。|
|`public String getCanonicalPath();`|返回规范化路径字符串|
|`public File getAbsoluteFile();`|返回此File对象的副本？等同于new File(this.getAbsolutePath())|

### 返回目录列表

|方法|描述|
|:-|:-|
|`public String[] list()`|获取该目录下的文件或目录名的字符串列表，如果此抽象路径名不表示一个目录，那么此方法将返回 null。否则返回一个字符串数组，每个数组元素对应目录中的每个文件名或目录名|
|`public File[] listFiles()`|获取该目录下面的所有文件或者目录的File对象列表，如果此抽象路径名不表示一个目录，那么此方法将返回 null。否则返回一个File对象数组，每个数组元素对应目录中的每个文件或目录的File对象|


# 6.代码实例

## (1)构造函数实例：
```java
public static void main(String[] args) 
{
 
        //构造函数File（String pathname）
        File f1 = new File("D:\\a\\1.txt");
        System.out.println(f1);
        //File(String parent,String child)
        File f2 = new File("D:\\a", "2.txt");
        System.out.println(f2);
        //File(File parent,String child)
        //File.separactor:表示路径分割符，在Windows系统中是"\",在Linux系统中是"/"
        File f3 = new File("D:"+File.separator+"a");
        System.out.println(f3);
        File f4 = new File(f3,"3.txt");
        System.out.println(f4);
}
```
运行结果：
```
D:\a\1.txt
D:\a\2.txt
D:\a
D:\a\3.txt
```

## (2)创建文件或目录实例：

```java
public class FileDemo1
{
    public static void main(String[] args) throws IOException
    {
        File file = new File("D:\\a\\file.txt");
        File directory = new File("D:\\a");
        File dir = new File("D:\\a\\test1\\test2");
        if (!directory.exists()) {
            //创建目录
            System.out.println("创建目录-"+directory);
            System.out.println(directory.mkdir());
        }
        else {
            System.out.println("删除目录-"+dir);
            System.out.println(directory.delete());//删除目录
            //删除此抽象路径名表示的文件或目录。如果此路径名表示一个目录，则该目录必须为空才能删除。
        }
        if (!dir.exists()) {
            //创建多级目录
            System.out.println("创建多级目录-"+dir);
            System.out.println(dir.mkdirs());
        }
        else {
            System.out.println("删除多级目录-"+dir);
            System.out.println(dir.delete());//
        }
        if (!file.exists()) {
            //创建文件
            System.out.println("创建文件-"+file);
            System.out.println(file.createNewFile());
        }
        else {
            System.out.println("删除文件-"+file);
            System.out.println(file.delete());//删除文件
        }
    }
}
```
结果：

1) 第一次运行的时候，尚未创建文件或目录。
```java
创建目录-D:\a
true
创建多级目录-D:\a\test1\test2
true
创建文件-D:\a\file.txt
true
```
分析：全部创建成功

2) 第2次运行，文件和目录以及多级目录都创建成功了。

```
删除目录-D:\a\test1\test2
false
删除多级目录-D:\a\test1\test2
true
删除文件-D:\a\file.txt
true
```

分析：

    文件file可以删除掉,而目录directory(D:\a)不是空目录，无法删除。目录dir(D:\a\test1\test2) test2下面没有目录和文件，可以删除掉目录test2,delete()函数只能删除掉最下面的目录test2,不会删除掉test2的父目录test1.这与mkdirs()函数不是互逆操作。

## (3)判断文件函数：exists(),isFile(),isAbsolute(),isDirectory(),canRead(),canWrite(),isHidden()

代码验证：

```java
public class FileDemo2
{
    public static void main(String[] args)
    {
        File file=new File("D:\\a\\file.txt");
        File noAbsolute=new File("我当然不是绝对路径啦");
        File dir=new File("D:\\a");
        System.out.println("file对象是否是文件："+file.isFile());
        System.out.println("dir对象是否是目录："+dir.isDirectory());
        System.out.println("file对象的路径是否是绝对路径: "+file.isAbsolute());
        System.out.println("noAbsolute对象的路径是否是绝对路径: "+noAbsolute.isAbsolute());
        System.out.println("file.txt是否存在："+file.exists());
        System.out.println("file.txt是否可读："+file.canRead());
        System.out.println("file.txt是否可写："+file.canWrite());
        System.out.println("file.txt是否是隐藏文件："+file.isHidden());
    }
}
```
运行结果：
```
file对象是否是文件：true
dir对象是否是目录：true
file对象的路径是否是绝对路径: true
noAbsolute对象的路径是否是绝对路径: false
file.txt是否存在：true
file.txt是否可读：true
file.txt是否可写：true
file.txt是否是隐藏文件：false
```

## (4)获取，操作文件属性函数

lastModified(),length()，getName(),getParent(),getPath(),getAbsolutePath():

```java
public class FileAPIDemo1
{
    public static void main(String[] args)
    {
        File file=new File("D:\\a\\file.txt");
        System.out.println("file.txt最后一次修改的时间："+timeStampToDate(file.lastModified()));
        System.out.println("file.txt长度(字节)："+file.length()+"B");
        System.out.println("file的文件名："+file.getName());
        System.out.println("file.txt的父路径字符串："+file.getParent());
        File fileParent=file.getParentFile();//获取父路径的File对象。
        System.out.println("父路径File对象fileParent的目录名："+fileParent.getName());
        System.out.println("file对象的抽象路径字符串："+file.getPath());
        System.out.println("file对象的绝对路径字符串："+file.getAbsolutePath());
        File AbsolutePathFile=file.getAbsoluteFile();//获取绝对路径的File对象
        System.out.println("AbsolutePathFile的名字："+file.getName());
        System.out.println("file和AbsolutePathFile引用的是相同的文件？："+file.equals(AbsolutePathFile));
    }
    //把时间戳转换成格式化时间字符串
    static String timeStampToDate(long timeStamp)
    {
        Date date =new Date(timeStamp);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return format.format(date);
    }
}
```
运行结果：

```
file.txt最后一次修改的时间：2018-05-03 16:15:00
file.txt长度(字节)：15B
file的文件名：file.txt
file.txt的父路径字符串：D:\a
父路径File对象fileParent的目录名：a
file对象的抽象路径字符串：D:\a\file.txt
file对象的绝对路径字符串：D:\a\file.txt
AbsolutePathFile的名字：file.txt
file和AbsolutePathFile引用的是相同的文件？：true
```

## 7.有些困惑的地方

(1)getAbsoluteFile()函数其实就是获取当前File对象的一个副本？
(2)规范化路径getCanonicalPath()，相对路径getPath()，绝对路径getAbsolutePath()三者的区别：
1)当输入为绝对路径时，3个方法返回的都是绝对路径。
2)当输入为相对路径时：
    getPath() 返回的是File构造方法里的路径
    getAbsolutePath() 返回的其实是user.dir+getPath()的内容
    getCanonicalPath() 返回的是去掉多余点号(.)等的规范化路径

测试代码：

```java
public class FileDemo3
{
    public static void main(String[] args) throws IOException
    {
        // 打印当前工程的父路径
        // System.out.println(System.getProperty("user.dir"));
        File file = new File("D:\\a\\file.txt");
        System.out.println("相对路径    :" + file.getPath());
        System.out.println("绝对路径    :" + file.getAbsolutePath());
        System.out.println("规范化路径    :" + file.getCanonicalPath());
        System.out.println("-----------------------------");
        File file2 = new File(".\\file.txt");
        System.out.println("user.dir:" + System.getProperty("user.dir"));
        System.out.println("相对路径    :" + file2.getPath());
        System.out.println("绝对路径    :" + file2.getAbsolutePath());
        System.out.println("规范化路径    :" + file2.getCanonicalPath());
 
        // 当输入为绝对路径时，3个方法返回的都是绝对路径。
        // 当输入为相对路径时：
        // getPath()返回的是File构造方法里的路径
        // getAbsolutePath()返回的其实是user.dir+getPath()的内容
        // getCanonicalPath()返回的就是标准的将符号完全解析的路径
    }
}
```
### (3) list()和listFile()的区别

看返回类型就知道了：

        list()函数获取的是当前目录下的所有文件和目录的名字列表(String数组)

        listFiles()获取的是当前目录下面的所有文件和目录的File对象列表(File数组)。

测试代码：

```java
public class FileAPIDemo2
{
    public static void main(String[] args)
    {
        //工程路径
        File dir=new File(System.getProperty("user.dir"));
        String[] list=dir.list();//返回当前目录下的所有文件和目录的名字
        for (String string : list)
        {
            System.out.println(string);
        }
        System.out.println("--------------------");
        File[] fileList=dir.listFiles();//获取当前下所有目录和文件的File对象
        for (File file : fileList)
        {
            System.out.println(file.getName());
        }
        
    }
}
```
运行结果:

```
.classpath
.project
.settings
bin
demo
demo1
src
--------------------
.classpath
.project
.settings
bin
demo
demo1
src
```

### (4)使用listFiles()函数,递归遍历所有的目录：

```java
public class FileAPIDemo4
{
    // 递归遍历所有的子目录和文件
    static void forEachAllDir(File dir)
    {
        if (dir == null)
        {
            System.out.println(dir + " 不是File对象");
            return;
        }
        if (!dir.isDirectory())
        {
            System.out.println(dir + " 不是目录");
        }
 
        File[] lists = dir.listFiles();// 获取当前目录下子文件和子目录的File对象
        for (File file : lists)
        {
            if (file.isDirectory())// 如果是目录的话
            {
                System.out.println(file);//输出目录的绝对路径
                // 递归调用
                forEachAllDir(file);//继续显示子目录
            } 
                        else//如果是文件的话，就直接输出文件的绝对路径
            {
                System.out.println(file);
            }
        }
    }
    public static void main(String[] args)
    {
        File dir = new File(System.getProperty("user.dir"));
        forEachAllDir(dir);
    }
}
```

运行结果：

```java
D:\dev\workspace\TestLearned\.classpath
D:\dev\workspace\TestLearned\.project
D:\dev\workspace\TestLearned\.settings
D:\dev\workspace\TestLearned\.settings\org.eclipse.jdt.core.prefs
D:\dev\workspace\TestLearned\bin
D:\dev\workspace\TestLearned\bin\lan
D:\dev\workspace\TestLearned\bin\lan\csdn
D:\dev\workspace\TestLearned\bin\lan\csdn\c
D:\dev\workspace\TestLearned\bin\lan\csdn\c\java
D:\dev\workspace\TestLearned\bin\lan\csdn\c\java\Myint.class
......
D:\dev\workspace\TestLearned\src\string
D:\dev\workspace\TestLearned\src\string\Test_IndexOf.java
D:\dev\workspace\TestLearned\src\string\Test_LastIndexOf.java
D:\dev\workspace\TestLearned\src\string\Test_Substring.java
```

分析：可以看到当前工程下的所有目录中的文件和目录都已经遍历了一遍，通过这样递归遍历整个目录可以用来拷贝整个目录

### 8.文件过滤器FilenameFilter接口

看下面的File类的方法：

[java] view plain copy

    <code class="language-java">public String[] list(FilenameFilter filter) ;   //返回一个字符串数组，这些字符串是目录中满足指定过滤器的文件和目录名字符串。  
    public File[] listFiles(FilenameFilter filter);  
                                                 //返回File数组，数组中的元素是该目录下的所有满足指定过滤器filter的文件和目录的File对象</code>  

上述方法可以实现文件过滤，返回符合条件的文件，过滤掉不符合条件的文件(不返回)

# 一、FilenameFilter介绍

java.io.FilenameFilter是文件名过滤器，用来过滤不符合规格的文件名，并返回合格的文件;

一般地：

(1)String[] fs = f.list();

(2)File[] fs = f.listFiles();

这两个方法返回f下的所有文件或目录；

FilenameFilter用来返回符合要求的文件或目录,不符合的文件的目录不返回(过滤掉)；

因此可以调用：

(1)String []fs = f.list(FilenameFilter filter);

(2)File[]fs = f.listFiles(FilenameFilter filter);

FilenameFilter中有一个方法：

boolean accept(File dir,String name); //dir表示文件的当前目录，name表示文件名；

实现该方法即可对文件进行过滤：

使用方式：

(1)使用匿名内部类

(2)实现FilenameFilter

代码实现：

(1)匿名内部类方式实现文件过滤：

```java
public static void printAllFile(File dir,final String ends)
{
    String[] listStr=dir.list(new FilenameFilter()
    {
        @Override
        // dir表示文件的当前目录，name表示当前文件的文件名；
        public boolean accept(File dir, String name)
        {
            //该目录是文件，而且文件以.java结尾
            return new File(dir, name).isFile() && name.endsWith(ends);
        }
    });
    for (String string : listStr)
    {
        System.out.println(string);
    }
}
```

(2)实现FilenameFilter方式实现文件过滤：

```java
//静态内部类可以直接new不用加上外部类的类名
//实现FilenameFilter
static class MyFilenameFilter implements FilenameFilter
{
    String ends;
    public MyFilenameFilter(){}
    public MyFilenameFilter(String ends)
    {
        this.ends=ends;
    }
    @Override
    public boolean accept(File dir, String name)
    {
        return new File(dir, name).isFile() && name.endsWith(ends);
    }
}
public static void printAllFile2(File dir, String ends)
{
    String[] listStr=dir.list(new MyFilenameFilter(ends));
    for (String string : listStr)
    {
        System.out.println(string);
    }
}
```

完整代码：

```java
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import com.lan.filepath.FilePath;
 
public class FilenameFilterTest
{
    public static void printAllFile(File dir, final String ends)
    {
        String[] listStr = dir.list(new FilenameFilter()
        {
            @Override
            // dir表示文件的当前目录，name表示当前文件的文件名；
            public boolean accept(File dir, String name)
            {
                // 该目录是文件，而且文件以.java结尾
                return new File(dir, name).isFile() && name.endsWith(ends);
            }
        });
        for (String string : listStr)
        {
            System.out.println(string);
        }
    }
    // 静态内部类可以直接new不用加上外部类的类名
    // 实现FilenameFilter
    static class MyFilenameFilter implements FilenameFilter
    {
        String ends;
        public MyFilenameFilter()
        {
        }
        public MyFilenameFilter(String ends)
        {
            this.ends = ends;
        }
        @Override
        public boolean accept(File dir, String name)
        {
            return new File(dir, name).isFile() && name.endsWith(ends);
        }
    }
    public static void printAllFile2(File dir, String ends)
    {
        String[] listStr = dir.list(new MyFilenameFilter(ends));
        for (String string : listStr)
        {
            System.out.println(string);
        }
    }
 
    public static void main(String[] args) throws IOException
    {
        // 获得当前的包路径
        String packagePath = FilePath
                .getSrcPackagePath(FilenameFilterTest.class);
        File dir = new File(packagePath);
        System.out.println("当前目录下的所有java文件：");
        printAllFile(dir, ".java");
        System.out.println("-----------------------------------------------");
        System.out.println("当前目录下的所有txt文件：");
        printAllFile(dir, ".txt");
        System.out.println("-----------------------------------------------");
        System.out.println("当前目录下的所有txt文件：");
        printAllFile2(dir, ".txt");
    }
}
```

运行结果：
```java
当前目录下的所有java文件：
FileAPIDemo1.java
FileAPIDemo2.java
FileAPIDemo4.java
FileDemo.java
FileDemo1.java
FileDemo2.java
FileDemo3.java
FilenameFilterTest.java
TestFile.java
TestGBK.java
-----------------------------------------------
当前目录下的所有txt文件：
Test.txt
-----------------------------------------------
当前目录下的所有txt文件：
Test.txt
```
可以看到上面两种方式都能实现根据后缀名来过滤目录下面的文件，匿名内部类的方式比较适合于临时使用的情况，实现接口的方式比较适合于多次重复使用的情况。


参考：

JAVA基础知识之IO-File类

FilenameFilter总结
