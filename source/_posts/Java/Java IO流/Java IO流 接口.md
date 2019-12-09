---
title: Java IO流 接口
categories: 
  - Java
  - Java IO流
date: 2018-08-13 15:04:36
updated: 2019-12-09 20:34:56
abbrlink: df6c2340
---
<div id='my_toc'><a href="/blog/df6c2340/#Closeable接口">Closeable接口</a><br/><a href="/blog/df6c2340/#Flushable接口">Flushable接口</a><br/><a href="/blog/df6c2340/#Appendable接口">Appendable接口</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
Java IO流 接口

# Closeable接口 #
`public interface Closeable`
`Closeable `是可以关闭的数据源或目标。调用 `close` 方法可释放对象保存的资源（如打开文件）。 
Closeable接口

> `void close() throws IOException`关闭此流,并释放与此流关联的所有系统资源。如果已经关闭该流，则调用此方法无效。
> 抛出： 
> &emsp;&emsp;&emsp;&emsp;`IOException` - 如果发生 I/O 错误

# Flushable接口 #

> `public interface Flushable`
> 
> `Flushable `是可刷新数据的目标地。**调用 `flush` 方法将所有已缓冲输出写入底层流。** 
> 
> 方法详细信息 
> `void flush() throws IOException`通过将所有已缓冲输出写入底层流来刷新此流。 
> 
> 抛出： 
>&emsp;&emsp;&emsp;&emsp; `IOException` - 如果发生 `I/O` 错误



# Appendable接口 #

`public interface Appendable`能够被添加 `char` 序列和值的对象。

**如果某个类的实例打算接收取自 `Formatter` 的格式化输出，那么该类必须实现 `Appendable` 接口。** 

要添加的字符应该是有效的 `Unicode` 字符，正如 `Unicode Character Representation` 中描述的那样。注意，增补字符可能由多个 16 位 `char` 值组成。 

`Appendable` 对于多线程访问而言没必要是安全的。线程安全由扩展和实现此接口的类负责。 

由于此接口可能由具有不同的错误处理风格的现有类实现，所以无法保证错误不会传播给调用者。 

|方法|描述|
|:-|:-|
|`Appendable append(char c)`|向此 Appendable 添加指定字符。 |
|`Appendable append(CharSequence csq)`|向此 Appendable 添加指定的字符序列。 |
|`Appendable append(CharSequence csq, int start, int end)`|向此 Appendable 添加指定字符序列的子序列。 |

>原文链接: [Java IO流 接口](https://lanlan2017.github.io/blog/df6c2340/)
