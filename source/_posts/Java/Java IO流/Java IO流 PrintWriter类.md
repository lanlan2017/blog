---
title: Java IO流 PrintWriter类
categories: 
  - Java
  - Java IO流
date: 2018-08-13 20:36:12
updated: 2019-12-15 22:01:44
abbrlink: 492ea8e8
---
<div id='my_toc'>

- [继承关系](/blog/492ea8e8/#继承关系)
- [构造函数](/blog/492ea8e8/#构造函数)
- [成员方法](/blog/492ea8e8/#成员方法)
    - [可以自动刷新的方法](/blog/492ea8e8/#可以自动刷新的方法)
    - [追加方法](/blog/492ea8e8/#追加方法)
    - [print(...)方法](/blog/492ea8e8/#print-方法)
    - [write(...)方法](/blog/492ea8e8/#write-方法)
    - [错误相关方法](/blog/492ea8e8/#错误相关方法)
    - [刷新方法](/blog/492ea8e8/#刷新方法)
- [实例](/blog/492ea8e8/#实例)
    - [不自动刷新的例子](/blog/492ea8e8/#不自动刷新的例子)
    - [PrintWriter自动刷新实例](/blog/492ea8e8/#PrintWriter自动刷新实例)
    - [PrintWriter不会自动刷新的方法](/blog/492ea8e8/#PrintWriter不会自动刷新的方法)
- [疑惑的地方**write()**方法和**print(...)**方法**append()**方法的区别？](/blog/492ea8e8/#疑惑的地方write-方法和print-方法append-方法的区别？)
    - [**write()**方法和**print(...)**方法的区别](/blog/492ea8e8/#write-方法和print-方法的区别)
- [看源码](/blog/492ea8e8/#看源码)
    - [字段](/blog/492ea8e8/#字段)
    - [构造方法](/blog/492ea8e8/#构造方法)
    - [print(...)方法源码](/blog/492ea8e8/#print-方法源码)
    - [write(...)方法源码](/blog/492ea8e8/#write-方法源码)
    - [append(...)方法源码](/blog/492ea8e8/#append-方法源码)
    - [println(...)方法源码](/blog/492ea8e8/#println-方法源码)
    - [format()方法源码](/blog/492ea8e8/#format-方法源码)
    - [printf()方法源码](/blog/492ea8e8/#printf-方法源码)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
## 继承关系 ##
```
java.lang.Object
  |----> java.io.Writer
      |----> java.io.PrintWriter
```
`public class PrintWriter extends Writer`向文本输出流打印对象的格式化表示形式。此类实现在 `PrintStream` 中的所有 `print` 方法。它不包含用于写入原始字节的方法，对于这些字节，程序应该使用未编码的字节流进行写入。 

与 `PrintStream` 类不同，如果**启用了自动刷新，则只有在调用 `println`、`printf` 或 `format` 的其中一个方法时才可能完成此操作**，而不是每当正好输出换行符时才完成。这些方法使用平台自有的行分隔符概念，而不是换行符。 

此类中的方法不会抛出 `I/O` 异常，尽管其某些构造方法可能抛出异常。客户端可能会查询调用 `checkError()` 是否出现错误。

## 构造函数 ##

|方法|描述|
|:-|:-|
|`PrintWriter(File file)`|打印到文件中,不自动刷新|
|`PrintWriter(File file, String csn)`|打印到文件中，指定字符集，自动刷新|
|`PrintWriter(OutputStream out)`|打印到OutputStream中，不自动刷新|
|`PrintWriter(OutputStream out, boolean autoFlush)`|打印到输出流中,autoFlush为true就自动刷新|
|`PrintWriter(String fileName)`|打印到文件名为fileName的文件中|
|`PrintWriter(String fileName, String csn)`|打印到文件名为fileName的文件中，指定字符编码|
|`PrintWriter(Writer out)`|打印到字符输出流中 |
|`PrintWriter(Writer out, boolean autoFlush)`|打印到字符输出流中,autoFlush为true时自动刷新 |

## 成员方法 ##
这个方法有点多，分开写比较好。
### 可以自动刷新的方法 ###
注意了，只有下表的方法可以自动刷新，其他方法是不会自动刷新的。
自动刷新的情况：
- 调用println()方法
- 调用printf()方法
- 调用format()方法

|方法|描述|
|:-|:-|
|`PrintWriter format(Locale l, String format, Object... args)`|使用指定格式字符串和参数将一个格式化字符串写入此 writer 中。 |
|`PrintWriter format(String format, Object... args)`|使用指定格式字符串和参数将一个格式化字符串写入此 writer 中。 |
|`PrintWriter printf(Locale l, String format, Object... args)`|使用指定格式字符串和参数将格式化的字符串写入此 writer 的便捷方法。 |
|`PrintWriter printf(String format, Object... args)`|使用指定格式字符串和参数将格式化的字符串写入此 writer 的便捷方法。 |
|`void println()`|通过写入行分隔符字符串终止当前行。 |
|`void println(boolean x)`|打印 boolean 值，然后终止该行。 |
|`void println(char x)`|打印字符，然后终止该行。 |
|`void println(char[] x)`|打印字符数组，然后终止该行。 |
|`void println(double x)`|打印双精度浮点数，然后终止该行。 |
|`void println(float x)`|打印浮点数，然后终止该行。 |
|`void println(int x)`|打印整数，然后终止该行。 |
|`void println(long x)`|打印 long 整数，然后终止该行。 |
|`void println(Object x)`|打印 Object，然后终止该行。 |
|`void println(String x)`|打印 String，然后终止该行。 |

### 追加方法 ###
|方法|描述|
|:-|:-|
|`PrintWriter append(char c)`|将指定字符添加到此 writer。 |
|`PrintWriter append(CharSequence csq)`|将指定的字符序列添加到此 writer。 |
|`PrintWriter append(CharSequence csq, int start, int end)`|将指定字符序列的子序列添加到此 writer。 |

### print(...)方法 ###
|方法|描述|
|:-|:-|
|`void print(boolean b)`|打印 boolean 值。 |
|`void print(char c)`|打印字符。 |
|`void print(char[] s)`|打印字符数组。 |
|`void print(double d)`|打印 double 精度浮点数。 |
|`void print(float f)`|打印一个浮点数。 |
|`void print(int i)`|打印整数。 |
|`void print(long l)`|打印 long 整数。 |
|`void print(Object obj)`|打印对象。 |
|`void print(String s)`|打印字符串。 |

### write(...)方法 ###
|方法|描述|
|:-|:-|
|`void write(char[] buf)`|写入字符数组。 |
|`void write(char[] buf, int off, int len)`|写入字符数组的某一部分。 |
|`void write(int c)`|写入单个字符。 |
|`void write(String s)`|写入字符串。 |
|`void write(String s, int off, int len)`|写入字符串的某一部分。 |

### 错误相关方法 ###
|方法|描述|
|:-|:-|
|`boolean checkError()`|如果流没有关闭，则刷新流且检查其错误状态。 |
|`protected  void clearError()`|清除此流的错误状态。 |
|`protected  void setError()`|指示已发生错误。 |

### 刷新方法 ###
|方法|描述|
|:-|:-|
|`void close()`|关闭该流并释放与之关联的所有系统资源。 |
|`void flush()`|刷新该流的缓冲。 |

## 实例 ##

### 不自动刷新的例子 ###

来看一个不自动刷新的例子
```
public static void main(String[] args) throws IOException
{
    BufferedWriter writer=new BufferedWriter(new FileWriter("xiaoming.txt"));
    writer.write("小明");
}
```
这样会不会在`xiaoming.txt`文件中写入“小明”这个字符串呢？答案是不会，因为，现在写的这个`小明`保存在`BufferedWriter`的内部字符数组中，并没有写到本地，想写到本地的话需要调用`flush()`方法刷新内部字符数组，把放在内部字符数组中的“小明”这个字符串写到本地中去。BufferedWriter内部缓存放满了，或者放不下了，会自动把内部缓存刷到本地中去。或者调用`close()`方法的时候也会刷新一下内部缓存。
现在小明两个字符没有充满内部缓存，`BufferedWriter`不会自动刷新内部缓存。而我们没有调用`flush()`方法，也没有关闭`BufferdWriter`。所以文件不会写入数据,`main()`方法结束后数据丢失。
### PrintWriter自动刷新实例 ###
使用`PrintWriter`并使用自动刷新刷新：
```java
public static void main(String[] args) throws IOException
{
       //自动刷新到文件xiaoming.txt中
    PrintWriter writer=new PrintWriter(new FileWriter("xiaoming.txt"),true);
       //使用下面三个方法会自动刷新
    writer.println("小明");
    writer.printf("%-10s#\n","小明");
    writer.format("%-10d#", 12345);
}
```
运行结果，`xiaoming.txt`文件中的内容：
```
小明
小明        #
12345     #
```
### PrintWriter不会自动刷新的方法 ###
`PrintWriter`的其他不会自动刷新的方法：
- write()方法
- print()方法
- append()方法

```java
public static void main(String[] args) throws IOException
{
    PrintWriter writer=new PrintWriter(new FileWriter("xiaoming.txt"),true);
    writer.println("小明");
    writer.printf("%-10s#\n","小明");
    writer.format("%-10d#\n", 12345);
    writer.write("我是不会写到文件中去的");
    writer.print("我也不会自动写到文件中去的");
    writer.append("我也一样不会写到文件中去的");
}
```
运行后，`xiaoming.txt`中的内容如下：
```
小明
小明        #
12345     #
```
可以看到这三个方法是不会自动刷新的，需要显示调用flush()方法进行写入,或者在写文件最后调用close()写入文件。这里调用close()方法在最后关闭文件，close()方法会把缓存的字符刷新到文件中去。
```java
public static void main(String[] args) throws IOException
{
    PrintWriter writer=new PrintWriter(new FileWriter("xiaoming.txt"),true);
    writer.println("小明");
    writer.printf("%-10s#\n","小明");
    writer.format("%-10d#\n", 12345);
    writer.write("我是不会写到文件中去的\n");
    writer.print("我也不会自动写到文件中去的\n");
    writer.append("我也一样不会写到文件中去的\n");
    writer.close();
}
```
运行上面代码后，`xiaoming.txt`文件中的内容如下
```
小明
小明        #
12345     #
我是不会写到文件中去的
我也不会自动写到文件中去的
我也一样不会写到文件中去的

```

## 疑惑的地方`write()`方法和`print(...)`方法`append()`方法的区别？ ##

### `write()`方法和`print(...)`方法的区别 ###
- 共同点：两者都不刷新页面，只在原来的页面写数据.最终都是重写了抽象类Writer里面的write方法.
- 不同点：print方法可以将各种类型的数据转换成字符串的形式输出。重载的write方法只能输出字符、字符数组、字符串等与字符相关的数据。

这些疑惑看下面的源码就知道了。

## 看源码 ##
### 字段 ###
```java
    protected Writer out;//字符输出流
    private final boolean autoFlush;//自动刷新
    private boolean trouble = false;
    private Formatter formatter;
    private PrintStream psOut = null;
    private final String lineSeparator;//换行符

```
### 构造方法 ###
```java
    public PrintWriter (Writer out) {
        //调用另一个:PrintWriter(Writer out, boolean autoFlush)
        this(out, false);
    }
    public PrintWriter(Writer out, boolean autoFlush) {
        super(out);
        //设置字符输出流
        this.out = out;
        //设置自动刷新标志
        this.autoFlush = autoFlush;
        //设置换行符
        lineSeparator = java.security.AccessController.doPrivileged(
            new sun.security.action.GetPropertyAction("line.separator"));
    }
    public PrintWriter(OutputStream out) {
        //调用另一个构造方法:PrintWriter(OutputStream out, boolean autoFlush) 
        this(out, false);
    }
    public PrintWriter(OutputStream out, boolean autoFlush) {
        //把字节流封装成字符流：BufferedWriter后,
        //调用:PrintWriter(OutputStream out, boolean autoFlush)
        this(new BufferedWriter(new OutputStreamWriter(out)), autoFlush);

        // save print stream for error propagation
        if (out instanceof java.io.PrintStream) {
            psOut = (PrintStream) out;
        }
    }
    public PrintWriter(String fileName) throws FileNotFoundException {
        //包装后调用：PrintWriter(OutputStream out, boolean autoFlush)
        this(new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileName))),
             false);
    }
    //搞不懂为什么这里要颠倒一下参数的顺序?
    private PrintWriter(Charset charset, File file)
        throws FileNotFoundException
    {
        //包装后调用:PrintWriter(OutputStream out, boolean autoFlush)
        this(new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), charset)),
             false);
    }
    public PrintWriter(String fileName, String csn)
        throws FileNotFoundException, UnsupportedEncodingException
    {
        //调用:PrintWriter(Charset charset, File file)
        this(toCharset(csn), new File(fileName));
    }
    public PrintWriter(File file) throws FileNotFoundException {
        //调用：PrintWriter(OutputStream out, boolean autoFlush)
        this(new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file))),
             false);
    }
    public PrintWriter(File file, String csn)
        throws FileNotFoundException, UnsupportedEncodingException
    {
        //调用：PrintWriter(Charset charset, File file)
        this(toCharset(csn), file);
    }

```

看源码就知道了：
### print(...)方法源码 ###
```java
public void print(boolean b) {
    write(b ? "true" : "false");
}
public void print(char c) {
    write(c);
}
public void print(int i) {
    write(String.valueOf(i));
}
public void print(long l) {
    write(String.valueOf(l));
}
public void print(float f) {
    write(String.valueOf(f));
}
public void print(double d) {
    write(String.valueOf(d));
}
public void print(char s[]) {
    write(s);
}
public void print(String s) {
    if (s == null) {
        s = "null";
    }
    write(s);
}
public void print(Object obj) {
    write(String.valueOf(obj));
}
```
### write(...)方法源码 ###
```java
protected Writer out;
public void write(int c) {
    try {
        synchronized (lock) {
            ensureOpen();
            //调用低层Writer的write(int)方法
            out.write(c);
        }
    }
    catch (InterruptedIOException x) {
        Thread.currentThread().interrupt();
    }
    catch (IOException x) {
        trouble = true;
    }
}
public void write(char buf[], int off, int len) {
    try {
        synchronized (lock) {
            ensureOpen();
            //调用低层writer的写字符数组方法
            out.write(buf, off, len);
        }
    }
    catch (InterruptedIOException x) {
        Thread.currentThread().interrupt();
    }
    catch (IOException x) {
        trouble = true;
    }
}
public void write(char buf[]) {
    //调用自己的write(char buf[], int off, int len)
    write(buf, 0, buf.length);
}
public void write(String s, int off, int len) {
    try {
        synchronized (lock) {
            ensureOpen();
            //调用低层得写字符串方法
            out.write(s, off, len);
        }
    }
    catch (InterruptedIOException x) {
        Thread.currentThread().interrupt();
    }
    catch (IOException x) {
        trouble = true;
    }
}
public void write(String s) {
    //调用自己的写字符串方法
    write(s, 0, s.length());
}
```
可以看到PrintWriter的writer(...)方法最终调用低层流的writer(..)来实现的。
### append(...)方法源码 ###
```java
public PrintWriter append(CharSequence csq) {
    if (csq == null)
        write("null");
    else
        write(csq.toString());
    return this;
}
public PrintWriter append(CharSequence csq, int start, int end) {
    CharSequence cs = (csq == null ? "null" : csq);
    write(cs.subSequence(start, end).toString());
    return this;
}
public PrintWriter append(char c) {
    write(c);
    return this;
}
```
我们可以看到`append`方法最终也是调用`PrintWriter`的`write()`方法来实现的，`write()`方法和`append`方法不同的地方在于返回值吧，`append`返回值为`PrintWriter`,而`write()`返回值为`void`
`print()`方法和`append()`方法相同的地方是它们都通过`write()`方法实现。

### println(...)方法源码 ###
```java
private void newLine() {
    try {
        synchronized (lock) {
            ensureOpen();
            out.write(lineSeparator);
            if (autoFlush)
                out.flush();
        }
    }
    catch (InterruptedIOException x) {
        Thread.currentThread().interrupt();
    }
    catch (IOException x) {
        trouble = true;
    }
}
public void println() {
    newLine();
}
public void println(boolean x) {
    synchronized (lock) {
        print(x);
        println();
    }
}
public void println(char x) {
    synchronized (lock) {
        print(x);
        println();
    }
}
public void println(int x) {
    synchronized (lock) {
        print(x);
        println();
    }
}
public void println(long x) {
    synchronized (lock) {
        print(x);
        println();
    }
}
public void println(float x) {
    synchronized (lock) {
        print(x);
        println();
    }
}
public void println(double x) {
    synchronized (lock) {
        print(x);
        println();
    }
}
public void println(char x[]) {
    synchronized (lock) {
        print(x);
        println();
    }
}
public void println(String x) {
    synchronized (lock) {
        print(x);
        println();
    }
}
public void println(Object x) {
    String s = String.valueOf(x);
    synchronized (lock) {
        print(s);
        println();
    }
}
```
我们看到println(...)最终调用print(...)和println()方法事项，print(...)方法前面已经说了。
而println()方法，调用newLine()这私有的方法来进行换行和刷新操作：
```java
private void newLine() {
    try {
        synchronized (lock) {
            ensureOpen();
            //写换行符
            out.write(lineSeparator);
            if (autoFlush)
                out.flush();//刷新缓存
        }
    }
    catch (InterruptedIOException x) {
        Thread.currentThread().interrupt();
    }
    catch (IOException x) {
        trouble = true;
    }
}
```
因为println()方法提供和换行和自动刷新功能，所以其他println(...)调用了该方法也就能实现自动刷新的功能了。

### format()方法源码 ###
```java
//格式化类：java.util.Formatter
private Formatter formatter;
......
public PrintWriter format(String format, Object ... args) {
    try {
        synchronized (lock) {
            ensureOpen();
            if ((formatter == null)
                || (formatter.locale() != Locale.getDefault()))
                formatter = new Formatter(this);
            formatter.format(Locale.getDefault(), format, args);
            if (autoFlush)
                out.flush();
        }
    } catch (InterruptedIOException x) {
        Thread.currentThread().interrupt();
    } catch (IOException x) {
        trouble = true;
    }
    return this;
}
public PrintWriter format(Locale l, String format, Object ... args) {
    try {
        synchronized (lock) {
            ensureOpen();
            if ((formatter == null) || (formatter.locale() != l))
                formatter = new Formatter(this, l);
            formatter.format(l, format, args);
            if (autoFlush)
                out.flush();
        }
    } catch (InterruptedIOException x) {
        Thread.currentThread().interrupt();
    } catch (IOException x) {
        trouble = true;
    }
    return this;
}

```
这里的`format()`方法其实就`java.util.Formatter`类的`format()`方法实现的。而且`format()`方法调用了`out.flush()`来实现自动刷新。
### printf()方法源码 ###
```java
public PrintWriter printf(String format, Object ... args) {
    return format(format, args);
}
public PrintWriter printf(Locale l, String format, Object ... args) {
    return format(l, format, args);
}
```
可以看到这里的`printf()`方法最终是调用了`format(``.``.)`方法来实现的。因为`format()`方法中调用了`out.flush()`来自动刷新,所以`printf()`方法也就跟着实现了自动刷新功能。
这些自动刷新功能说的很玄乎,其实不过就是下面两句话：
```java
......
            if (autoFlush)
                out.flush();//刷新缓存
......
```
其他方法如write()方法，print()方法，append()方法没有上面这句话所以就没了自动刷新功能。

就这样吧
