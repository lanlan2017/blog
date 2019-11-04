---
title: String类中的正则表达式
categories: 
  - Java
  - Java 正则表达式
date: 2018-08-06 23:46:40
updated: 2019-10-30 13:53:55
abbrlink: 12fb64fe
---
- [String支持正则表达式是的方法](/blog/html/12fb64fe/#String支持正则表达式是的方法)
- [matches()方法](/blog/html/12fb64fe/#matches-方法)
    - [实例：](/blog/html/12fb64fe/#实例：)
    - [拓展：点号**.**能匹配**\r\n**之外的任意字符](/blog/html/12fb64fe/#拓展：点号-能匹配-r-n之外的任意字符)
- [**split()**方法](/blog/html/12fb64fe/#split-方法)
    - [返回结果](/blog/html/12fb64fe/#返回结果)
    - [limit参数：](/blog/html/12fb64fe/#limit参数：)
    - [分割符不相邻的情况**：**](/blog/html/12fb64fe/#分割符不相邻的情况：)
    - [实例1分隔符相邻的情况:**o**:](/blog/html/12fb64fe/#实例1分隔符相邻的情况-o)
    - [小结：](/blog/html/12fb64fe/#小结：)
- [replaceFirst()方法](/blog/html/12fb64fe/#replaceFirst-方法)
    - [实例](/blog/html/12fb64fe/#实例)
- [replaceAll()方法](/blog/html/12fb64fe/#replaceAll-方法)
    - [实例](/blog/html/12fb64fe/#实例)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## String支持正则表达式是的方法 ##
`String` 有 4 个方法用到了正则表达式 : `matches()`，`split()`, `replaceFirst()`, `replaceAll(` ),如下表所示。

|序号|方法|描述|
|-|-|-|
|1|`boolean matches(String regex)`|告知此字符串是否匹配给定的正则表达式。|
|2|`String[] split(String regex)`|根据给定正则表达式的匹配拆分此字符串。|
|3|`String[] split(String regex, int limit)`|根据匹配给定的正则表达式来拆分此字符串。|
|4|`String replaceFirst(String regex, String replacement)`|使用给定的 replacement 替换此字符串匹配给定的正则表达式的第一个子字符串。|
|5|`String replaceAll(String regex, String replacement)`|使用给定的 replacement 替换此字符串所有匹配给定的正则表达式的子字符串。|

## matches()方法 ##
`public boolean matches(String regex)`
>告知此字符串是否匹配给定的正则表达式。 
调用此方法的 `str.matches(regex)` 形式与以下表达式产生的结果完全相同： 
&emsp;&emsp;&emsp;&emsp;`Pattern.matches(regex, str)`
参数：
&emsp;&emsp;&emsp;&emsp;`regex` - 用来匹配此字符串的正则表达式 
返回：
&emsp;&emsp;&emsp;&emsp;当且仅当此字符串匹配给定的正则表达式时，返回 `true` 
抛出： 
&emsp;&emsp;&emsp;&emsp;`PatternSyntaxException` - 如果正则表达式的语法无效

### 实例： ###
```java
public static void main(String[] args)
{
	String text="I keep saying no\n"+
				"This can't be the way we're supposed to be";
	System.out.println(text.matches(".*saying.*"));
	System.out.println(text.matches(".*saying.*\n.*"));
}
```
运行结果：
```
false
true
```
### 拓展：点号`.`能匹配`\r\n`之外的任意字符 ###
你如果奇怪为什么`text.matches(".*saying.*")`不返回`true`，而是返回`flase`。那你就误解了点号`.`的意思了，点号`.`匹配任意字符是没错，但是这个任意字符不包括换行符`\n`，回车符`\r`。所以点号`.`匹配的是一个除了换行符`\n`,回车符`\r`之外的其他字符。
实例：
```
public static void testMatchersSpecialCharacter()
{
//字符串中的转义字符有：\b  \t  \n  \f  \r  \"  \'  \\
	String text;
	//回车符
	text="I keep saying no\r";
	System.out.println(text.matches(".*saying.*"));
	//换行符
	text="I keep saying no\n";
	System.out.println(text.matches(".*saying.*"));
	//\b退格符
	text="I keep saying no\b";
	System.out.println(text.matches(".*saying.*"));
	//\t水平制表符
	text="I keep saying no\t";
	System.out.println(text.matches(".*saying.*"));
	//\f走页符
	text="I keep saying no\f";
	System.out.println(text.matches(".*saying.*"));
	//\"双引号
	text="I keep saying no\"";
	System.out.println(text.matches(".*saying.*"));
	//\'单引号
	text="I keep saying no\'";
	System.out.println(text.matches(".*saying.*"));
	//\\反斜线
	text="I keep saying no\\";
	System.out.println(text.matches(".*saying.*"));
}
```
运行结果：
```
false
false
true
true
true
true
true
true

```
从运行结果中看，点号`.`可以匹配除了`\r`,`\n`之外的其他任意转义字符。

扯远了，回来继续说`String.matchers(regex)`方法，源码如下。
```java
public boolean matches(String regex) 
{
    return Pattern.matches(regex, this);
}
```
所以前面说，调用此方法的 `str.matches(regex)` 形式与调用`Pattern.matches(regex, str)`方法产生的结果完全相同,是因为低层还是调用了`Pattern.matches(regex, str)`方法实现的，也就少传个参数吧。
## `split()`方法 ##
看源码：
```java
public String[] split(String regex) 
{
    return split(regex, 0);
}
```
可以看到`split(regex)`方法还是直接调用`split(regex, 0);`来实现的。
##split(String regex, int limit)方法##
源码：
```java
public String[] split(String regex, int limit) 
{
  ......
    return Pattern.compile(regex).split(this, limit);
}

```
可以看到`String.split(regex)`方法最终调用了`Pattern.compile(regex).split(this, limit);`方法(这样说有点不准确)，源码太长了，先不看，去看API吧。
>`public String[] split(String regex,int limit)`
>&emsp;&emsp;&emsp;&emsp;&emsp;根据匹配给定的正则表达式来拆分此字符串。

从API中看出：
### 返回结果 ###
- 此方法返回一个**String`数组`**
- 数组中的内容是，该字符串的`子字符串`.
- 数组中的子串按什么分割呢？**按另一个匹配正则表达式的子串(A)分割。**
- 返回的子串的顺序：按子串在要分割子串中的顺序排列
- 如果正则表达式匹配不到任何子串,也就是说找不到作为分割的子串。那就不分割，返回要分割的字符串本身，也就是数组中只有一个元素。

### limit参数： ###
limit 参数控制正则表达式进行匹配的次数，因此影响所得数组的长度。

- 如果该限制 n 大于 0，则模式将被最多应用 n - 1 次，数组的长度将不会大于 n，而且数组的最后一项将包含所有超出最后匹配的**定界符(匹配正则作为分割的子串)**的输入。

- 如果 n 为小于0，那么模式将被应用尽可能多的次数，而且返回的数组可以是任何长度。

- 如果 n 为 0，那么模式将被应用尽可能多的次数，返回的数组可以是任何长度，并且结尾空字符串将被丢弃。 
 
>调用此方法的 str.split(regex, n) 形式与以下表达式产生的结果完全相同： 
Pattern.compile(regex).split(str, n) 

例如，字符串 "boo:and:foo" 使用这些参数可生成以下结果： 

|Regex|Limit|结果 |
|-|-|-|
|`:`|`2`|`{ "boo", "and:foo" } `|
|`:`|`-2`|`{ "boo", "and", "foo" }` |
|`:`|`0`|`{ "boo", "and", "foo" }` |
|`o`|`2`|`{ "b", "o:and:foo" }` |
|`o`|`-2`|`{ "b", "", ":and:f", "", "" }` |
|`o`|`0`|`{ "b", "", ":and:f" }` |

下面写代码验证上面的结果，分为下面两种情况。
### 分割符不相邻的情况`：` ###
```
public static void testSplitLimitGreaterThan0()
{
	String text="boo:and:foo";
	//n=2,最多分割n-1=1次
	String[] arr=text.split(":",2); 
	for (String string : arr)
	{
		System.out.println(string);
	}
	System.out.println("-------------------");
}
public static void testSplitLimitLessThan0()
{
	String text="boo:and:foo";
	//n=2,分割尽可能多次
	String[] arr=text.split(":",-2); 
	for (String string : arr)
	{
		System.out.println(string);
	}
	System.out.println("------------------------------");
}
public static void testSplitLimitEqualTo0()
{
	String text="boo:and:foo";
	//n=2,分割尽可能多次
	String[] arr=text.split(":",0); 
	for (String string : arr)
	{
		System.out.println(string);
	}
	System.out.println("------------------------------");
}
```
运行结果：
```
boo
and:foo
-------------------
boo
and
foo
------------------------------
boo
and
foo
------------------------------
```
### 实例1分隔符相邻的情况:`o`: ###

```
public static void testSplitLimitGreaterThan0Adjacent()
{
	String text="boo:and:foo";
	//n=2,最多分割n-1=1次
	String[] arr=text.split("o",2); 
	for (int i=0;i<arr.length;i++)
	{
		System.out.println(i+"-->"+arr[i]);
	}
	System.out.println("-------------------");
}

public static void testSplitLimitLessThan0Adjacent()
{
	String text="boo:and:foo";
	//n=2,分割尽可能多次
	String[] arr=text.split("o",-2); 
	for (int i=0;i<arr.length;i++)
	{
		System.out.println(i+"-->"+arr[i]);
	}
	System.out.println("------------------------------");
}
public static void testSplitLimitEqualTo0Adjacent()
{
	String text="boo:and:foo";
	//n=2,分割尽可能多次
	String[] arr=text.split("o",0); 
	for (int i=0;i<arr.length;i++)
	{
		System.out.println(i+"-->"+arr[i]);
	}
	System.out.println("------------------------------");
}
```
运行结果：
```
0-->b
1-->o:and:foo
-------------------
0-->b
1-->
2-->:and:f
3-->
4-->
------------------------------
0-->b
1-->
2-->:and:f
------------------------------
```
分析，

因为第一个limit参数n=2,最多分割n-1=2-1=1次，所以遇到第一个o分割成：`b`,`o:and:foo`就停止分割了。返回数组为{"b","o:and:foo"}
第二个方法limit参数是n=-2,小于0，将尽可能多的分割下去。

1. "boo:and:foo"中遇到第一个`o`的时候，分割为`b`和`o:and:foo`。此时结果为`{"b"}`。

1. 然后接着在后面的子串`o:and:foo`继续匹配分割，匹配到第二个o的时候`o`:and:foo,由于前面没有子串，所以用空字符串`""`代替,也就是分割为`""`和`:and:foo`这两个字符串。此时结果为`{"b",""}`。

1. 然后在后面的子串`:and:foo`中继续匹配分割，匹配到o,"&#58;and&#58;f`o`o",然后分割为"`:and:f`",和`o`。此时结果为`{"b","",":and:f"}`.

1. 然后继续在剩下的子串"`o`"中匹配,正则表达式`o`,匹配到`o`,把它分割为`“”`和`“”`。此时没有待匹配的子串了，结束匹配，所以结果为`{"b","",":and:f","",""}`。

第三个方法，limit参数n=0,尽可能多的分割下去，
- 前面三步和上面的三步一样，但是到最后一步的时候不一样。
- 在剩下的子串"`o`"中匹配,正则表达式`o`,匹配到`o`,把它分割为`“”`和`“”`，此时没有待匹配的子串了，结束匹配。因为这是最后一次分割，最后分割的到的这两个字符串是空字符串，就把这两个空字符串**丢弃**,而不是放入数组中。，所以结果为`{"b","",":and:f"}`。

### 小结： ###
如果作为分割的子串相邻，就会生成空字符串。例如上面的`boo:and`,如果用`o`分割，就会在第二个`o`匹配的时候，因为`o:and`中分割点`o`前面没有子串，所以分割出空字符串`""`,和`":and:"`

`split(String regex`, `int limit)`方法用法区别在`limit`的设置上
- 如果limit>0，则最多分割limit-1次
- 如果limit<0，则尽可能的分割下去，如果结尾的子串正好匹配正则表达式，作为分割符，这样就会被分割成多个空字符串，这些无意义的空字符串同样会放入到数组中返回。
- 如果limit=0，则尽可能的分割下去，如果结尾的子串正好匹配正则表达式，作为分割符，这样会分割为空字符串，对于这些结尾生成的空字符串，就会丢弃掉，不放入数组中返回。

我们可以夸张一点，把"`boo:and:foo`"改成`boo:and:fooooo`看看你运行结果就可以很清楚的看到`limit<0`和`limit=0`的区别,代码就不贴了，运行结果如下：
```
0-->b
1-->
2-->:and:f
3-->
4-->
5-->
6-->
7-->
------------------------------
0-->b
1-->
2-->:and:f
------------------------------
```
所以平常使用的时候为了不分割到空字符串，还是设置`limit=0`比较好，可以就是直接调用`String.split(regex)`就行了。

## replaceFirst()方法 ##
>String replaceFirst(String regex, String replacement) 
&emsp;&emsp;&emsp;&emsp;使用给定的 replacement 替换此字符串匹配给定的正则表达式的第一个子字符串。 调用此方法的 str.replaceFirst(regex, repl) 形式与以下表达式产生的结果完全相同： 
&emsp;&emsp;&emsp;&emsp;`Pattern.compile(regex).matcher(str).replaceFirst(repl)`

源码如下：
```java
public String replaceFirst(String regex, String replacement) 
{
    return Pattern.compile(regex).matcher(this).replaceFirst(replacement);
}
```
这个方法简直人如其名，我不知道该怎么详细些了。
### 实例 ###
```java
String text="aaa:hahaha...";
System.out.println(text.replaceFirst("aaa", "I am groot"));
```
运行结果：
```
I am groot:hahaha...
```
##  replaceAll()方法 ##
>`public String replaceAll(String regex,String replacement)`
>使用给定的 `replacement` 替换此字符串所有匹配给定的正则表达式的子字符串。 
调用此方法的 `str.replaceAll(regex, repl)` 形式与以下表达式产生的结果完全相同： &emsp;&emsp;&emsp;&emsp;`Pattern.compile(regex).matcher(str).replaceAll(repl)`

源码：
```java
public String replaceAll(String regex, String replacement) 
{
    return Pattern.compile(regex).matcher(this).replaceAll(replacement);
}

```
### 实例 ###

```java
	String text="A:你好\nGtoot:_\nA:额，听不懂\nGroot:_\nA:。。。";
	text=text.replaceAll("A", "Tony Stark");
	System.out.println(text.replaceAll("_", "I am groot"));
```
运行结果：
```
Tony Stark:你好
Gtoot:I am groot
Tony Stark:额，听不懂
Groot:I am groot
Tony Stark:。。。

```

>原文链接: [String类中的正则表达式](https://lanlan2017.github.io/blog/12fb64fe/)
