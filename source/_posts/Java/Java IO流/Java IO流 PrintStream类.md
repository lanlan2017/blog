---
title: Java IO流 PrintStream类
categories: 
  - Java
  - Java IO流
date: 2018-08-14 15:19:37
updated: 2019-12-17 05:17:09
abbrlink: '82040860'
---
<div id='my_toc'><a href="/blog/82040860/#继承关系" class="header_2">继承关系</a><br><a href="/blog/82040860/#构造方法" class="header_2">构造方法</a><br><a href="/blog/82040860/#成员方法" class="header_2">成员方法</a><br><a href="/blog/82040860/#write-...-方法" class="header_3">write(...)方法</a><br><a href="/blog/82040860/#write-int-b-源码：" class="header_4">write(int b)源码：</a><br><a href="/blog/82040860/#write-int-b-详细描述" class="header_4">write(int b)详细描述</a><br><a href="/blog/82040860/#关于自动刷新" class="header_4">关于自动刷新</a><br><a href="/blog/82040860/#write-byte-buf-,-int-off,-int-len-源码" class="header_4">write(byte buf[], int off, int len)源码</a><br><a href="/blog/82040860/#write-byte-buf-,-int-off,-int-len-详细描述" class="header_4">write(byte buf[], int off, int len)详细描述</a><br><a href="/blog/82040860/#print-...-方法" class="header_3">print(...)方法</a><br><a href="/blog/82040860/#print-boolean-b-方法源码" class="header_4">print(boolean b)方法源码</a><br><a href="/blog/82040860/#print-boolean-b-方法详细描述" class="header_4">print(boolean b)方法详细描述</a><br><a href="/blog/82040860/#print-char-c-方法源码" class="header_4">print(char c)方法源码</a><br><a href="/blog/82040860/#print-char-c-方法详细描述" class="header_4">print(char c)方法详细描述</a><br><a href="/blog/82040860/#print-long-l-方法源码" class="header_4">print(long l)方法源码</a><br><a href="/blog/82040860/#其他print-...-方法源码" class="header_4">其他print(...)方法源码</a><br><a href="/blog/82040860/#println-...-方法" class="header_3">println(...)方法</a><br><a href="/blog/82040860/#println-...-方法源码" class="header_4">println(...)方法源码</a><br><a href="/blog/82040860/#format-...-方法" class="header_3">format(...)方法</a><br><a href="/blog/82040860/#format-...-方法源码" class="header_4">format(...)方法源码</a><br><a href="/blog/82040860/#append-...-方法" class="header_3">append(...)方法</a><br><a href="/blog/82040860/#错误相关方法" class="header_3">错误相关方法</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 继承关系 ##
```
java.lang.Object
  |----> java.io.OutputStream
      |----> java.io.FilterOutputStream
          |----> java.io.PrintStream
```
`public class PrintStream extends FilterOutputStream implements Appendable`, `Closeable`
**`PrintStream` 为其他输出流添加了功能，使它们能够方便地打印各种数据值表示形式。**它还提供其他两项功能。与其他输出流不同，`PrintStream` 永远不会抛出 `IOException`；而是，异常情况仅设置可通过 `checkError` 方法测试的内部标志。另外，为了自动刷新，可以创建一个 `PrintStream`；这意味着可在写入 `byte` 数组之后自动调用 `flush` 方法，可调用其中一个 `println` 方法，或写入一个换行符或字节 ('`\n`')。 

`PrintStream` 打印的所有字符都使用平台的默认字符编码转换为字节。在需要写入字符而不是写入字节的情况下，应该使用 `PrintWriter` 类。 

## 构造方法 ##

|方法|描述|
|:-|:-|
|`PrintStream(File file)`|创建具有指定文件且不带自动行刷新的新打印流。 |
|`PrintStream(File file, String csn)`|创建具有指定文件名称和字符集且不带自动行刷新的新打印流。 |
|`PrintStream(OutputStream out)`|创建新的打印流。 |
|`PrintStream(OutputStream out, boolean autoFlush)`|创建新的打印流。 |
|`PrintStream(OutputStream out, boolean autoFlush, String encoding)`|创建新的打印流。 |
|`PrintStream(String fileName)`|创建具有指定文件名称且不带自动行刷新的新打印流。 |
|`PrintStream(String fileName, String csn)`|创建具有指定文件名称和字符集且不带自动行刷新的新打印流。 |
## 成员方法 ##

### write(...)方法 ###
|方法|描述|
|:-|:-|
|`void write(byte[] buf, int off, int len)`|将 len 字节从指定的初始偏移量为 off 的 byte 数组写入此流。 |
|`void write(int b)`|将指定的字节写入此流。 |
#### write(int b)源码： ####
```
public void write(int b) {
    try {
        synchronized (this) {
            ensureOpen();
            out.write(b);
            //如果这个字符是换行符,而且开启了自动刷新的话
            if ((b == '\n') && autoFlush)
                out.flush();//调用flush()方法
        }
    }
    catch (InterruptedIOException x) {
        Thread.currentThread().interrupt();
    }
    catch (IOException x) {
        trouble = true;//设置标志
    }
}
```
#### write(int b)详细描述 ####
> 将指定的字节写入此流，如果这个字节是换行符而且开启了自动刷新的话，就会调用flush()方法
> 注意，字节是按给定的方式写入的。 要根据平台的默认字符编码编写一个字符，请使用print(char)或println(char)方法。 
> 参数: b 将要写入的字节
> 覆盖：类 FilterOutputStream 中的 write

<!--
    /**
     * Writes the specified byte to this stream.  If the byte is a newline and
     * automatic flushing is enabled then the <code>flush</code> method will be
     * invoked.
     *
     * <p> Note that the byte is written as given; to write a character that
     * will be translated according to the platform's default character
     * encoding, use the <code>print(char)</code> or <code>println(char)</code>
     * methods.
     *
     * @param  b  The byte to be written
     * @see #print(char)
     * @see #println(char)
     */
-->

#### 关于自动刷新 ####
所以如果开启了自动刷新，write(int b)方法在写入回车符的时候会调用flush()方法
#### write(byte buf[], int off, int len)源码 ####
```
public void write(byte buf[], int off, int len) {
    try {
        synchronized (this) {
            ensureOpen();
            out.write(buf, off, len);
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
```
#### write(byte buf[], int off, int len)详细描述 ####
将 len 字节从指定的初始偏移量为 off 的 byte 数组写入此流。如果启用自动刷新，则调用 flush 方法。 
注意，字节将按给定的方式写入；
要根据平台的默认字符编码来写入，请使用`print(char)`或`println(char)`方法。
参数: buf 字节数组
参数: off 相对于字节数组开始位置的偏移量
参数: len 需要写入的字节数

<!--
```
/**
 * Writes <code>len</code> bytes from the specified byte array starting at
 * offset <code>off</code> to this stream.  If automatic flushing is
 * enabled then the <code>flush</code> method will be invoked.
 *
 * <p> Note that the bytes will be written as given; to write characters
 * that will be translated according to the platform's default character
 * encoding, use the <code>print(char)</code> or <code>println(char)</code>
 * methods.
 *
 * @param  buf   A byte array
 * @param  off   Offset from which to start taking bytes
 * @param  len   Number of bytes to write
 */
```
-->

### print(...)方法 ###
|方法|描述|
|:-|:-|
|`void print(boolean b)`|打印 boolean 值。 |
|`void print(char c)`|打印字符。 |
|`void print(char[] s)`|打印字符数组。 |
|`void print(double d)`|打印双精度浮点数。 |
|`void print(float f)`|打印浮点数。 |
|`void print(int i)`|打印整数。 |
|`void print(long l)`|打印 long 整数。 |
|`void print(Object obj)`|打印对象。 |
|`void print(String s)`|打印字符串。 |

#### print(boolean b)方法源码 ####
```
public void print(boolean b) {
    write(b ? "true" : "false");
}
```
#### print(boolean b)方法详细描述 ####
> 描述：
> 打印 boolean 值。按照平台的默认字符编码将 String.valueOf(boolean) 生成的字符串转换为字节，并完全以 write(int) 方法的方式写入这些字节。 
> 
> 参数：
> b - 要打印的 boolean

<!--
    /**
     * Prints a boolean value.  The string produced by <code>{@link
     * java.lang.String#valueOf(boolean)}</code> is translated into bytes
     * according to the platform's default character encoding, and these bytes
     * are written in exactly the manner of the
     * <code>{@link #write(int)}</code> method.
     *
     * @param      b   The <code>boolean</code> to be printed
     */
-->
#### print(char c)方法源码 ####
```
    public void print(char c) {
        write(String.valueOf(c));
    }
```
#### print(char c)方法详细描述 ####
打印一个字符，根据平台默认字符编码把这个字符转换为一个或者多个字节,然后这些字节完全以`write(int)`方法的方式进行写入。
<div><!--
    /**
     * Prints a character.  The character is translated into one or more bytes
     * according to the platform's default character encoding, and these bytes
     * are written in exactly the manner of the
     * <code>{@link #write(int)}</code> method.
     *
     * @param      c   The <code>char</code> to be printed
     */
--></div>

 #### print(int i)方法源码 ####
```
public void print(int i) {
    write(String.valueOf(i));
}
```
 #### print(int i)方法详细描述 ####
打印整数。按照平台的默认字节编码将 `String.valueOf(i)` 生成的字符串转换为字节，并完全以 `write(int)` 方法的方式写入这些字节。 

参数：
i - 要打印的 int

<div><!--
    /**
     * Prints an integer.  The string produced by <code>{@link
     * java.lang.String#valueOf(int)}</code> is translated into bytes
     * according to the platform's default character encoding, and these bytes
     * are written in exactly the manner of the
     * <code>{@link #write(int)}</code> method.
     *
     * @param      i   The <code>int</code> to be printed
     * @see        java.lang.Integer#toString(int)
     */
--></div>

#### print(long l)方法源码 ####
```
    public void print(long l) {
        write(String.valueOf(l));
    }
```
> 打印`long`整数，按照平台默认字节编码将`String.valueOf(l)`生成的字符串转换为字节，并完全以`write(int)`方法的方式写入这些字节

<div><!--
    /**
     * Prints a long integer.  The string produced by <code>{@link
     * java.lang.String#valueOf(long)}</code> is translated into bytes
     * according to the platform's default character encoding, and these bytes
     * are written in exactly the manner of the
     * <code>{@link #write(int)}</code> method.
     *
     * @param      l   The <code>long</code> to be printed
     * @see        java.lang.Long#toString(long)
     */
--></div>

```
    public void print(float f) {
        write(String.valueOf(f));
    }
```
<div><!--
    /**
     * Prints a floating-point number.  The string produced by <code>{@link
     * java.lang.String#valueOf(float)}</code> is translated into bytes
     * according to the platform's default character encoding, and these bytes
     * are written in exactly the manner of the
     * <code>{@link #write(int)}</code> method.
     *
     * @param      f   The <code>float</code> to be printed
     * @see        java.lang.Float#toString(float)
     */
--></div>

#### 其他print(...)方法源码 ####

```
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

### println(...)方法 ###

|方法|描述|
|:-|:-|
|`void println()`|通过写入行分隔符字符串终止当前行。 |
|`void println(boolean x)`|打印 boolean 值，然后终止行。 |
|`void println(char x)`|打印字符，然后终止该行。 |
|`void println(char[] x)`|打印字符数组，然后终止该行。 |
|`void println(double x)`|打印 double，然后终止该行。 |
|`void println(float x)`|打印 float，然后终止该行。 |
|`void println(int x)`|打印整数，然后终止该行。 |
|`void println(long x)`|打印 long，然后终止该行。 |
|`void println(Object x)`|打印 Object，然后终止该行。 |
|`void println(String x)`|打印 String，然后终止该行。 |

#### println(...)方法源码 ####
```
/* Methods that do terminate lines */

public void println() {
    newLine();
}
```
通过写入行分隔符字符串终止当前行。行分隔符字符串由系统属性` line.separator` 定义，不一定是单个换行符 ('`\n`')。 

<div><!--
/**
 * Terminates the current line by writing the line separator string.  The
 * line separator string is defined by the system property
 * <code>line.separator</code>, and is not necessarily a single newline
 * character (<code>'\n'</code>).
 */
--></div>

```
public void println(boolean x) {
    synchronized (this) {
        print(x);
        newLine();
    }
}
```

打印 boolean 值，然后终止行。此方法的行为就像先调用 print(boolean) 然后调用 println() 一样。 

参数：
x - 要打印的 boolean


<div><!--
/**
 * Prints a boolean and then terminate the line.  This method behaves as
 * though it invokes <code>{@link #print(boolean)}</code> and then
 * <code>{@link #println()}</code>.
 *
 * @param x  The <code>boolean</code> to be printed
 */
--></div>

```
public void println(char x) {
    synchronized (this) {
        print(x);
        newLine();
    }
}
```
打印字符，然后终止该行。此方法的行为就像先调用 print(char) 然后调用 println() 一样。 

参数：
x - 要打印的 char。

<div><!--
/**
 * Prints a character and then terminate the line.  This method behaves as
 * though it invokes <code>{@link #print(char)}</code> and then
 * <code>{@link #println()}</code>.
 *
 * @param x  The <code>char</code> to be printed.
 */
--></div>

```
public void println(int x) {
    synchronized (this) {
        print(x);
        newLine();
    }
}
```
打印整数，然后终止该行。此方法的行为就像先调用 print(int) 然后调用 println() 一样。 

参数：
x - 要打印的 int。


<div><!--
/**
 * Prints an integer and then terminate the line.  This method behaves as
 * though it invokes <code>{@link #print(int)}</code> and then
 * <code>{@link #println()}</code>.
 *
 * @param x  The <code>int</code> to be printed.
 */
--></div>

```
public void println(long x) {
    synchronized (this) {
        print(x);
        newLine();
    }
}
```
打印 long，然后终止该行。此方法的行为就像先调用 print(long) 然后调用 println() 一样。 

参数：
x - 要打印的 long。


<div><!--
/**
 * Prints a long and then terminate the line.  This method behaves as
 * though it invokes <code>{@link #print(long)}</code> and then
 * <code>{@link #println()}</code>.
 *
 * @param x  a The <code>long</code> to be printed.
 */
--></div>

```
public void println(float x) {
    synchronized (this) {
        print(x);
        newLine();
    }
}

```
打印 float，然后终止该行。此方法的行为就像先调用 print(float) 然后调用 println() 一样。 
参数：
x - 要打印的 float。

<div><!--
/**
 * Prints a float and then terminate the line.  This method behaves as
 * though it invokes <code>{@link #print(float)}</code> and then
 * <code>{@link #println()}</code>.
 *
 * @param x  The <code>float</code> to be printed.
 */
--></div>

```
public void println(double x) {
    synchronized (this) {
        print(x);
        newLine();
    }
}
```
打印 double，然后终止该行。此方法的行为就像先调用 print(double) 然后调用 println() 一样。 

参数：
x - 要打印的 double。

<div><!--
/**
 * Prints a double and then terminate the line.  This method behaves as
 * though it invokes <code>{@link #print(double)}</code> and then
 * <code>{@link #println()}</code>.
 *
 * @param x  The <code>double</code> to be printed.
 */
--></div>

```
public void println(char x[]) {
    synchronized (this) {
        print(x);
        newLine();
    }
}
```
打印字符数组，然后终止该行。此方法的行为就像先调用 print(char[]) 然后调用 println() 一样。 
参数：
x - 要打印的字符数组。

<div><!--
/**
 * Prints an array of characters and then terminate the line.  This method
 * behaves as though it invokes <code>{@link #print(char[])}</code> and
 * then <code>{@link #println()}</code>.
 *
 * @param x  an array of chars to print.
 */
--></div>

```
public void println(String x) {
    synchronized (this) {
        print(x);
        newLine();
    }
}
```
打印 String，然后终止该行。此方法的行为就像先调用 print(String) 然后调用 println() 一样。 
参数：
x - 要打印的 String。

<div><!--
/**
 * Prints a String and then terminate the line.  This method behaves as
 * though it invokes <code>{@link #print(String)}</code> and then
 * <code>{@link #println()}</code>.
 *
 * @param x  The <code>String</code> to be printed.
 */
--></div>

```
public void println(Object x) {
    String s = String.valueOf(x);
    synchronized (this) {
        print(s);
        newLine();
    }
}
```
打印 Object，然后终止该行。此方法首先调用 String.valueOf(x) 获取打印对象的字符串值，然后的行为如同先调用 print(String) 再调用 println() 一样。 
参数：
x - 要打印的 Object。

<div><!--
/**
 * Prints an Object and then terminate the line.  This method calls
 * at first String.valueOf(x) to get the printed object's string value,
 * then behaves as
 * though it invokes <code>{@link #print(String)}</code> and then
 * <code>{@link #println()}</code>.
 *
 * @param x  The <code>Object</code> to be printed.
 */
--></div>


### format(...)方法 ###

|方法|描述|
|:-|:-|
|`PrintStream format(Locale l, String format, Object... args)`|使用指定格式字符串和参数将格式化字符串写入此输出流中。 |
|`PrintStream format(String format, Object... args)`|使用指定格式字符串和参数将格式化字符串写入此输出流中。 |
|`PrintStream printf(Locale l, String format, Object... args)`|使用指定格式字符串和参数将格式化的字符串写入此输出流的便捷方法。 |
|`PrintStream printf(String format, Object... args)`|使用指定格式字符串和参数将格式化的字符串写入此输出流的便捷方法。 |
#### format(...)方法源码 ####
```
public PrintStream format(String format, Object ... args) {
    try {
        synchronized (this) {
            ensureOpen();
            if ((formatter == null)
                || (formatter.locale() != Locale.getDefault()))
                formatter = new Formatter((Appendable) this);
            formatter.format(Locale.getDefault(), format, args);
        }
    } catch (InterruptedIOException x) {
        Thread.currentThread().interrupt();
    } catch (IOException x) {
        trouble = true;
    }
    return this;
}
```
使用指定格式字符串和参数将格式化字符串写入此输出流中。
始终使用的语言环境是由 Locale.getDefault() 返回的语言环境，不管以前在此对象上调用了其他什么样的格式化方法。 

<div><!--
/**
 * Writes a formatted string to this output stream using the specified
 * format string and arguments.
 *
 * <p> The locale always used is the one returned by {@link
 * java.util.Locale#getDefault() Locale.getDefault()}, regardless of any
 * previous invocations of other formatting methods on this object.
 *
 * @param  format
 *         A format string as described in <a
 *         href="../util/Formatter.html#syntax">Format string syntax</a>
 *
 * @param  args
 *         Arguments referenced by the format specifiers in the format
 *         string.  If there are more arguments than format specifiers, the
 *         extra arguments are ignored.  The number of arguments is
 *         variable and may be zero.  The maximum number of arguments is
 *         limited by the maximum dimension of a Java array as defined by
 *         <cite>The Java&trade; Virtual Machine Specification</cite>.
 *         The behaviour on a
 *         <tt>null</tt> argument depends on the <a
 *         href="../util/Formatter.html#syntax">conversion</a>.
 *
 * @throws  java.util.IllegalFormatException
 *          If a format string contains an illegal syntax, a format
 *          specifier that is incompatible with the given arguments,
 *          insufficient arguments given the format string, or other
 *          illegal conditions.  For specification of all possible
 *          formatting errors, see the <a
 *          href="../util/Formatter.html#detail">Details</a> section of the
 *          formatter class specification.
 *
 * @throws  NullPointerException
 *          If the <tt>format</tt> is <tt>null</tt>
 *
 * @return  This output stream
 *
 * @since  1.5
 */
--></div>

```
public PrintStream format(Locale l, String format, Object ... args) {
    try {
        synchronized (this) {
            ensureOpen();
            if ((formatter == null)
                || (formatter.locale() != l))
                formatter = new Formatter(this, l);
            formatter.format(l, format, args);
        }
    } catch (InterruptedIOException x) {
        Thread.currentThread().interrupt();
    } catch (IOException x) {
        trouble = true;
    }
    return this;
}
```
使用指定格式字符串和参数将格式化字符串写入此输出流中。 
参数：
- l 格式化过程中应用的 locale。如果 l 为 null，则不应用本地化。
- format 在格式字符串的语法中描述的格式字符串
- args 格式字符串中的格式说明符引用的参数。如果参数多于格式说明符，则忽略额外的参数。参数的数量是可变的，并且可以为零。参数的最大数量受到 Java Virtual Machine Specification 定义的 Ja
- 
- va 数组的最大维数的限制。针对 null 参数的行为依赖于 conversion。 
返回： 此输出流 
抛出： 
- IllegalFormatException 如果格式字符串包含非法语法、与给定参数不兼容的格式说明符、对给定格式字符串而言不够充足的参数或其他非法条件。有关所有可能的格式错误的规范，请参阅 formatter 类规范的详细信息部分。 
- NullPointerException 如果 format 为 null
从以下版本开始： 
1.5 

<div><!--
/**
 * Writes a formatted string to this output stream using the specified
 * format string and arguments.
 *
 * @param  l
 *         The {@linkplain java.util.Locale locale} to apply during
 *         formatting.  If <tt>l</tt> is <tt>null</tt> then no localization
 *         is applied.
 *
 * @param  format
 *         A format string as described in <a
 *         href="../util/Formatter.html#syntax">Format string syntax</a>
 *
 * @param  args
 *         Arguments referenced by the format specifiers in the format
 *         string.  If there are more arguments than format specifiers, the
 *         extra arguments are ignored.  The number of arguments is
 *         variable and may be zero.  The maximum number of arguments is
 *         limited by the maximum dimension of a Java array as defined by
 *         <cite>The Java&trade; Virtual Machine Specification</cite>.
 *         The behaviour on a
 *         <tt>null</tt> argument depends on the <a
 *         href="../util/Formatter.html#syntax">conversion</a>.
 *
 * @throws  java.util.IllegalFormatException
 *          If a format string contains an illegal syntax, a format
 *          specifier that is incompatible with the given arguments,
 *          insufficient arguments given the format string, or other
 *          illegal conditions.  For specification of all possible
 *          formatting errors, see the <a
 *          href="../util/Formatter.html#detail">Details</a> section of the
 *          formatter class specification.
 *
 * @throws  NullPointerException
 *          If the <tt>format</tt> is <tt>null</tt>
 *
 * @return  This output stream
 *
 * @since  1.5
 */
--></div>


### append(...)方法 ###
|方法|描述|
|:-|:-|
|`PrintStream append(char c)`|将指定字符添加到此输出流。 |
|`PrintStream append(CharSequence csq)`|将指定字符序列添加到此输出流。 |
|`PrintStream append(CharSequence csq, int start, int end)`|将指定字符序列的子序列添加到此输出流。 |

```
public PrintStream append(CharSequence csq, int start, int end) {
    CharSequence cs = (csq == null ? "null" : csq);
    write(cs.subSequence(start, end).toString());
    return this;
}

```
> 将指定字符序列添加到此输出流。 
> 此方法调用 out.append(csq) 的行为与调用下列方法完全相同： 
> ```
> out.print(csq.toString()) 
> ```
> 可能不添加整个序列，也可能添加，具体取决于字符序列 csq 的 toString 规范。例如，调用一个字符缓冲区的 toString 方法将返回一个子序列，其内容取决于缓冲区的位置和限制。 
> 指定者：接口 Appendable 中的 append
> 参数：csq - 要添加的字符序列。如果 csq 为 null，则向此输出流添加四个字符 "null"。 
> 返回：此输出流
> 从以下版本开始： 1.5 

<div><!--
/**
 * Appends a subsequence of the specified character sequence to this output
 * stream.
 *
 * <p> An invocation of this method of the form <tt>out.append(csq, start,
 * end)</tt> when <tt>csq</tt> is not <tt>null</tt>, behaves in
 * exactly the same way as the invocation
 *
 * <pre>
 *     out.print(csq.subSequence(start, end).toString()) </pre>
 *
 * @param  csq
 *         The character sequence from which a subsequence will be
 *         appended.  If <tt>csq</tt> is <tt>null</tt>, then characters
 *         will be appended as if <tt>csq</tt> contained the four
 *         characters <tt>"null"</tt>.
 *
 * @param  start
 *         The index of the first character in the subsequence
 *
 * @param  end
 *         The index of the character following the last character in the
 *         subsequence
 *
 * @return  This output stream
 *
 * @throws  IndexOutOfBoundsException
 *          If <tt>start</tt> or <tt>end</tt> are negative, <tt>start</tt>
 *          is greater than <tt>end</tt>, or <tt>end</tt> is greater than
 *          <tt>csq.length()</tt>
 *
 * @since  1.5
 */
--></div>

```
/**
 * Appends the specified character to this output stream.
 *
 * <p> An invocation of this method of the form <tt>out.append(c)</tt>
 * behaves in exactly the same way as the invocation
 *
 * <pre>
 *     out.print(c) </pre>
 *
 * @param  c
 *         The 16-bit character to append
 *
 * @return  This output stream
 *
 * @since  1.5
 */
public PrintStream append(char c) {
    print(c);
    return this;
}
```


### 错误相关方法 ###
|方法|描述|
|:-|:-|
|`boolean checkError()`|刷新流并检查其错误状态。 |
|`protected  void clearError()`|清除此流的内部错误状态。 |
|`void close()`|关闭流。 |
|`void flush()`|刷新该流的缓冲。 |
|`protected  void setError()`|将该流的错误状态设置为 true。 |
