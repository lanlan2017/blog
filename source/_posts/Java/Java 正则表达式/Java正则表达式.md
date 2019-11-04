---
title: Java正则表达式
categories: 
  - Java
  - Java 正则表达式
date: 2019-01-11 22:02:27
updated: 2019-10-30 13:53:55
abbrlink: 4ea1809c
---
- [java 使用正则表达式步骤](/blog/html/4ea1809c/#java-使用正则表达式步骤)
    - [java的regex库常用类](/blog/html/4ea1809c/#java的regex库常用类)
        - [常用类：Pattern和Matcher](/blog/html/4ea1809c/#常用类：Pattern和Matcher)
        - [**Pattern** 类和**Matcher** 类的关系](/blog/html/4ea1809c/#Pattern-类和Matcher-类的关系)
        - [**PatternSyntaxException** 类](/blog/html/4ea1809c/#PatternSyntaxException-类)
    - [通常使用步骤](/blog/html/4ea1809c/#通常使用步骤)
        - [创建Pattern对象](/blog/html/4ea1809c/#创建Pattern对象)
        - [创建**Matcher**对象](/blog/html/4ea1809c/#创建Matcher对象)
        - [简便用法](/blog/html/4ea1809c/#简便用法)
- [Matcher 类的主要方法介绍](/blog/html/4ea1809c/#Matcher-类的主要方法介绍)
    - [常用方法](/blog/html/4ea1809c/#常用方法)
    - [捕获组](/blog/html/4ea1809c/#捕获组)
        - [捕获组实例](/blog/html/4ea1809c/#捕获组实例)
    - [索引方法](/blog/html/4ea1809c/#索引方法)
        - [start 和 end 方法](/blog/html/4ea1809c/#start-和-end-方法)
        - [实例：统计一个单词出现的次数](/blog/html/4ea1809c/#实例：统计一个单词出现的次数)
    - [判断匹配是否成功](/blog/html/4ea1809c/#判断匹配是否成功)
        - [java matcher 中find,matches,lookingAt三个方法的区别](/blog/html/4ea1809c/#java-matcher-中find,matches,lookingAt三个方法的区别)
    - [替换方法](/blog/html/4ea1809c/#替换方法)
        - [replaceFirst 和 replaceAll 方法](/blog/html/4ea1809c/#replaceFirst-和-replaceAll-方法)
    - [替换第n次匹配的子串](/blog/html/4ea1809c/#替换第n次匹配的子串)
        - [appendReplacement 和 appendTail 方法](/blog/html/4ea1809c/#appendReplacement-和-appendTail-方法)
            - [实例 全部替换](/blog/html/4ea1809c/#实例-全部替换)
                - [实例 全部替换](/blog/html/4ea1809c/#实例-全部替换)
            - [实例2：替换第一次](/blog/html/4ea1809c/#实例2：替换第一次)
                - [实例2：替换第一次](/blog/html/4ea1809c/#实例2：替换第一次)
        - [小结：](/blog/html/4ea1809c/#小结：)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# java 使用正则表达式步骤 #
参考:[https://www.cnblogs.com/haodawang/p/5967219.html](https://www.cnblogs.com/haodawang/p/5967219.html)

## java的regex库常用类 ##

`java`里提供了一个`java.util.regex`库，方便于我们在`java`里操作正则表达式，或者用它来匹配字符串。
### 常用类：Pattern和Matcher ###
其中比较常用的类有 `Pattern` 和 `Matcher` ,`Pattern`是一个编译好的正则表达式，而`Mather`是一个正则表达式适配器，`Mather`的功能很强大，所以我们一般用`pattern` 来获取一个`Matcher`对象，然后用`Matcher`来操作正则表达式。
### `Pattern` 类和`Matcher` 类的关系 ###
首先一个`Pattern`实例订制了一个所用语法与`PERL`的类似的正则表达式经编译后的模式，然后一个`Matcher`实例在这个给定的`Pattern`实例的模式控制下进行字符串的匹配工作。
### `PatternSyntaxException` 类###
`PatternSyntaxException` 是一个非强制异常类，它表示一个正则表达式模式中的语法错误。

## 通常使用步骤 ##

### 创建Pattern对象 ###

创建`pattern`的对象是很简单的，但是由于`pattern`的构造方法是用`private`声明的，所以我们仅能通过工厂模式的`compile()`方法来返回一个`Pattern`的对象,`compile`可以接收一个正则表达式作为参数。
```
Pattern pattern = Pattern.compile("[abc]");
```
### 创建`Matcher`对象 ###
接下来我们创建一个`Matcher`对象。`Matcher`的构造方法也是一个`private`方法，但是我们可以通过`Pattern`的`Matcher`方法来返回一个`Matcher`对象。
```
Matcher matcher = pattern.matcher("hello abc");
```
这里`matcher`可以接收一个字符串作为参数，**准确的说这里所接收的参数类型是`CharSequences`接口类型的参数**，`String`、`StringBuffer`、`StringBuilder`还有`CharBuffer`都实现了`CharSequence`接口，因此这四种类型的对象都可以传入。

### 简便用法 ###
与此同时`Pattern`还提供了一个`matches` 静态方法(`Pattern.matches(regex, input)`)，它允许我们传入一个`String`类型的正则表达式和一个`String`类型的需要匹配的字符串，并返回一个`boolean`类型的值，这个方法的好处在于我们可以不用创建`pattern`对象和`matcher`对象就可以知道所传入的正则表达式能不能匹配所传入的字符串。
#### 实例 ####
使用了正则表达式 `.*groot.*`判断字符串中是否包了 groot 这个子串：

```java
import java.util.regex.*;

class RegexExample1
{
    public static void main(String args[])
    {
        String content = "I am groot";
        String pattern = ".*groot.*";
        boolean isMatch = Pattern.matches(pattern, content);
        System.out.println("字符串中是否包含了 'groot' 子字符串? " + isMatch);
    }
}

```

实例输出结果为：
```
字符串中是否包含了 'groot' 子字符串? true
```

创建Matcher类对象后就可使用Matcher类许多强大的方法了。


# Matcher 类的主要方法介绍 #
## 常用方法 ##
说到`Matcher`,这个东西就很强大了，我们比较常用的方法有:
- `find();`
- `group();`

(1)先来说一下`find()`和`group`这两个方法。
`find`有点像一个迭代器，它能通过正则表达式向前迭代。而`group()`方法返回0号分组，也就是整个正则表达式匹配的文本。
下来看一个例子
```java
public static void testFindGroup()
{
    Pattern pattern = Pattern.compile("\\d+");
    Matcher matcher = pattern.matcher("aaa 111 bbbb 222 333 ccc");
    //find向前迭代,查找匹配的字符串
    while(matcher.find())
    {
        //获取匹配正则表达式的子串
        System.out.println(matcher.group());
    }
}
```
运行结果：
```
111
222
333
```
可以看到这和`Matcher.find()`和`Scanner.hasnext()`方法类似，而`Matcher.group()`和`Scanner.next()`方法类似。


## 捕获组 ##

捕获组是把多个字符当一个单独单元进行处理的方法，它通过对括号内的字符分组来创建。

例如，正则表达式 (dog) 创建了单一分组，组里包含"d"，"o"，和"g"。

**捕获组是通过从左至右计算其开括号来编号**。例如，在表达式`((A)(B(C))）`，有四个这样的组：
- `((A)(B(C)))`
- `(A)`
- `(B(C))`
- `(C)`

可以通过调用 `matcher` 对象的 `groupCount()`方法来查看表达式有多少个分组。`groupCount()` 方法返回一个 `int` 值，表示`matcher`对象当前有多个捕获组。

还有一个特殊的组（`group(0)`），它总是代表整个表达式。该组不包括在 `groupCount` 的返回值中。 

|序号|方法|描述|
|-|-|-|
|1|`public int groupCount()`|返回此匹配器模式中的捕获组数。根据惯例，零组表示整个模式。它不包括在此计数中。|
|2|`String group()`|返回0号捕获组，也就是整个表达式匹配的字符串|
|3|`String group(int group)`|返回指定捕获组捕获到的子串|
### 捕获组实例 ###

#### 查看正则表达式中有多到个捕获组 ####
`int groupCount()`方法：返回此匹配器模式中的捕获组数.不包括0捕获组
```java
	public static void testGroupCount()
	{
		Pattern pattern = Pattern.compile("(\\w+)(\\s+)([0-9]+)");
        Matcher matcher = pattern.matcher("aaa 111 bbbb 222 333 ccc");
        System.out.println(pattern.toString()+"这个正则表达式捕获组数目:"+matcher.groupCount());
	}
```
运行结果：
```
(\w+)(\s+)([0-9]+)这个正则表达式捕获组数目:3
```


#### 捕获方法group()和group(int group)实例 ####
**下面的例子说明如何从一个给定的字符串中捕获数字串：**

```
package java1.regex.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexMatches
{
	public static void main(String args[])
	{
		// 按指定模式在字符串查找
		String line = "I hope that 2018 is also a year full of hope.";
		String pattern = "(\\D*)(\\d+)(.*)";
		// 创建 Pattern 对象
		Pattern r = Pattern.compile(pattern);
		// 现在创建 matcher 对象
		Matcher m = r.matcher(line);
		if (m.find())
		{
			//默认匹配捕获整个表达式-调用m.group(0);
			System.out.println(m.group());
			System.out.println("第0个分组: " + m.group(0));
			System.out.println("第1个分组: " + m.group(1));
			System.out.println("第2个分组: " + m.group(2));
			System.out.println("第3个分组: " + m.group(3));
		} else
		{
			System.out.println("NO MATCH");
		}
	}
}
```
以上实例编译运行结果如下：
```
第0个分组: I hope that 2018 is also a year full of hope.
第1个分组: I hope that 
第2个分组: 2018
第3个分组:  is also a year full of hope.
```
这里要注意的是**第0个分组捕获的是整个正则表达式匹配到的字符串**，而子字符串的捕获是从第1个分组开始的。**使用无参的捕获函数group()默认捕获0号分组**，看源码就知道了：
```
    public String group() {
        return group(0);
    }
```



## 索引方法 ##

索引方法提供了有用的索引值，精确表明输入字符串中在哪能找到匹配：

|序号|索引方法|描述|
|-|-|-|
|1|`public int start()`|返回匹配子序列在原序列的起始下标|
|2|`public int start(int group)`|返回在以前的匹配操作期间，由给定组所捕获的子序列的初始索引|
|3|`public int end()`|返回匹配子序列在原序列的结束下标|
|4|`public int end(int group)`|返回在以前的匹配操作期间，由给定组所捕获子序列的最后字符之后的偏移量。|

### start 和 end 方法 ###
- `start()`是返回匹配成功的子串的第一个字母的索引
- 而`end()`是返回子串最后一个索引的位置+1。
```java
public static void testStartEnd1()
{
    String input = "hello_World";
    Matcher matcher = Pattern.compile("\\w+_").matcher(input);
    matcher.find();
    System.out.println(input.charAt(matcher.start()));
    System.out.println(input.charAt(matcher.end()));
    System.out.println(input.charAt(matcher.end()-1));
}
```
运行结果：
```
h
W
_
```
从运行中可以看到，end方法返回的是最后匹配的字符`_`后面的字符`W`，而不是该字符`_`本身。

### 实例：统计一个单词出现的次数 ###
下面统计单词 "`groot`" 在输入字符串中出现的次数

```java
public static void testStartEnd()
{
    final String regex = "\\bgroot\\b";
    final String text = "I am groot!I am groot!I am groot!I am groot!!!";
//  编译表示的正则表达式
    Pattern p = Pattern.compile(regex);
//  获取  matcher  对象
    Matcher m = p.matcher(text);
    int count = 0;
//  boolean  find()
//  尝试查找与该模式匹配的输入序列的下一个子序列。
//  尝试查找与正则表达式匹配的下一个字序列
    while (m.find())
    {
        count++;
        System.out.println("子序列起始下标:-->" + m.start());
        System.out.println("成功匹配子序列:" + m.group());
        System.out.println("子序列结束下标:<--" + m.end());
    }
    System.out.println("总共匹配次数:" + count);
}

```

以上实例编译运行结果如下：
```
子序列起始下标:-->5
成功匹配子序列:groot
子序列结束下标:<--10
子序列起始下标:-->16
成功匹配子序列:groot
子序列结束下标:<--21
子序列起始下标:-->27
成功匹配子序列:groot
子序列结束下标:<--32
子序列起始下标:-->38
成功匹配子序列:groot
子序列结束下标:<--43
总共匹配次数:4
```
这个例子中使用单词边界，以确保匹配的字符序列是 "`g`" ,"`r`","`o`","`o`","`t`" 而不会匹配到一个较长的字符串的子串(如 gg`groot`tttt)。而统计功能是我们通过计数器`count`实现的。


#### 小结 ####
出处：[https://zhidao.baidu.com/question/443782938.html](https://zhidao.baidu.com/question/443782938.html)
`Mathcer.start()/ Matcher.end()/ Matcher.group()` **这三个方法必须是在有字符匹配到的条件下才能够调用，否则会报错。**
- `start()`返回匹配到的子串在字符串中的索引位置
- `end()`返回匹配到的子串的最后一个字符在字符串中的索引位置+1
- `group()`返回匹配到的子字符串。

`start()`,`end()`,`group()`均有一个重载方法它们是`start(int i)`,`end(int i)`,`group(int i)`专用于分组操作,`Mathcer`类还有一个`groupCount()`用于返回有多少组。


## 判断匹配是否成功 ##

判断方法用来检查字符串并返回一个布尔值，表示是否匹配该正则表达式：

|序号|判断方法|描述|
|-|-|-|
|1|`public boolean matches()`|只有整个字符序列完全匹配成功才返回`true`|
|2|`public boolean lookingAt()`|总是从第一个字符进行匹配,匹配成功了不再继续匹配，匹配失败了,也不继续匹配。|
|3|`public boolean find()`|尝试查找与该模式匹配的输入序列的下一个子序列。|
|4|`public boolean find(int start）`|重置此匹配器，然后尝试查找匹配该模式、从指定索引开始的输入序列的下一个子序列。|

### java matcher 中find,matches,lookingAt三个方法的区别 ###
出处：[https://www.cnblogs.com/wangjunxiao/p/7115559.html](https://www.cnblogs.com/wangjunxiao/p/7115559.html)

在Matcher类中有find都是匹配目标的方法，但容易混淆，整理它们的区别如下：
- ** `matches()`:整个匹配**，matches 要求整个序列，只有整个字符序列完全匹配成功，才返回`True`，否则返回`False`。但如果前部分匹配成功，将移动下次匹配的位置。
- **`lookingAt()`:部分匹配**，总是从第一个字符进行匹配,匹配成功了不再继续匹配，匹配失败了,也不继续匹配。
- **`find()`:部分匹配**，从当前位置开始匹配，找到一个匹配的子串，将移动下次匹配的位置。
- **`reset()`:给当前的`Matcher`对象设置新的位置**，位置是就该方法的参数；如果不给参数，`reset`会把`Matcher`设到当前字符串的开始处。

验证代码如下：
```java
public static void testFindLookingAtMatcher()
{
    Pattern pattern = Pattern.compile("\\d{3,5}");
    String charSequence = "123-34345-234-00";
    Matcher matcher = pattern.matcher(charSequence);
    System.out.println("待匹配字符序列:"+charSequence);
    System.out.println("正则表达式:"+pattern.toString());
    //虽然匹配失败，但由于charSequence里面的"123"和pattern是匹配的,所以下次的匹配从位置4开始
    System.out.println("matcher.matches()返回:"+matcher.matches());
    //查找匹配位置
    matcher.find();
    System.out.println("当前位置:"+matcher.start());
    //使用reset方法重置匹配位置
    matcher.reset();
    //第一次find匹配以及匹配的目标和匹配的起始位置
    System.out.println("matcher.find()返回:"+matcher.find());
    System.out.println("捕获所有匹配的到子串:"+matcher.group()+",位置:"+matcher.start());
    //第二次find匹配以及匹配的目标和匹配的起始位置
    System.out.println("matcher.find()返回:"+matcher.find());
    System.out.println("捕获到子串:"+matcher.group()+",位置:"+matcher.start());
    System.out.println("#####################################################");
    //第一次lookingAt匹配以及匹配的目标和匹配的起始位置
    System.out.println("matcher.lookingAt()返回:"+matcher.lookingAt());
    System.out.println("捕获所有匹配的子串:"+matcher.group()+",位置:"+matcher.start());
    
    //第二次lookingAt匹配以及匹配的目标和匹配的起始位置
    System.out.println("matcher.lookingAt()返回:"+matcher.lookingAt());
    System.out.println("捕获所有匹配的子串:"+matcher.group()+",位置:"+matcher.start());
}

```
测试结果：

```
待匹配字符序列:123-34345-234-00
正则表达式:\d{3,5}
matcher.matches()返回:false
当前位置:4
matcher.find()返回:true
捕获所有匹配的到子串:123,位置:0
matcher.find()返回:true
捕获到子串:34345,位置:4
#####################################################
matcher.lookingAt()返回:true
捕获所有匹配的子串:123,位置:0
matcher.lookingAt()返回:true
捕获所有匹配的子串:123,位置:0

```

## 替换方法 ##
api看的我有点晕头转向，个人总结如下。 
|序号|方法|描述|
|-|-|-|
|1|`public String replaceAll(String replacement)`|用`replacement`替换正则表达式匹配到的所有子串|
|2|`public String replaceFirst(String replacement)`|用`replacement`替换正则表达式匹配到的第一个子串|

|5|`public static String quoteReplacement(String s)`|返回指定字符串的字面替换字符串。这个方法返回一个字符串，就像传递给Matcher类的appendReplacement 方法一个字面字符串一样工作。|

### replaceFirst 和 replaceAll 方法 ###

`replaceFirst` 和 `replaceAll` 方法用来替换匹配正则表达式的文本。不同的是，`replaceFirst` 替换首次匹配的子串，`replaceAll` 替换所有匹配的子串。 
看下面的例子：
```java
public static void testReplaceAll()
{
    String regex = "dog";
    String input = "The dog says meow. " + "All dogs say meow.";
    String replace = "cat";
    Pattern p = Pattern.compile(regex);
//  get  a  matcher  object
    Matcher m = p.matcher(input);
    input = m.replaceAll(replace);
    System.out.println(input);
}

```
运行结果：
```
The cat says meow. All cats say meow.
```
## 替换第n次匹配的子串 ##
而`replaceFirst`方法只能替换第一次匹配的子串，replaceAll方法则全部替换所有匹配的子串。那我如果想替换第2次匹配的子串，替换第3次匹配的子串，...替换第n次匹配的子串。我该怎么办呢，下面的这两个方法就能实现这样的功能。

|序号|方法|描述|
|-|-|-|
|1|`public Matcher appendReplacement(StringBuffer sb, String replacement)`|首先使用replacement替换父串中当前匹配到的子串，然把本次处理过的文本追加到`StringBuffer`里，所谓处理过的文本就是从上一次替换后的结束位置，到这次替换后的结束位置之间的所有文本|
|2|`public StringBuffer appendTail(StringBuffer sb)`|把原来文本中最后一次匹配到的内容之后的字符串追加到`StringBuffer`中。也就是把没有处理过的`剩余字符串`放到sb中|

### appendReplacement 和 appendTail 方法 ###

参考：[https://blog.csdn.net/key_xyes/article/details/78705181](https://blog.csdn.net/key_xyes/article/details/78705181)
- `appendReplacement(sb,replacement)`方法中：`sb`是一个`StringBuffer`，`replacement`用于替换的字符串，这个方法会把匹配到的子串替换为`replacement`，并且把从上次替换的位置到这次替换位置之间的字符串也拿到，然后，加上这次替换后的结果一起追加到`StringBuffer`里（假如这次替换是第一次替换，那就是只追加替换后的字符串啦）。

两个方法一起使用就可以达到所有替换或者替换第一个：

#### 全部替换 ####
```java
//find()方法向前查找匹配的子串
while(m.find())
{
    //获取位置在匹配子串之前的文本strbefore，获取匹配的子串strmacther，然后把匹配的子串strmacther替换为replacement，
    //然后(strbefore+replacement)追加到StringBuffer中
    m.appendReplacement(sb,replacement);
}
//把文本中没有匹配的剩下的文本也加入到StringBuffer中
m.appendTail(sb);
```
##### 实例 全部替换 #####
```java
public static void testAppendReplace_Tail()
{
    Pattern p = Pattern.compile("a");
    String text="before_ONEa_TWOa_THREEa_End";
    Matcher m = p.matcher(text);
    StringBuffer sb = new StringBuffer();
    while (m.find())
    {
//      获取位置在匹配子串之前的文本strbefore，获取匹配的子串strmacther，然后把匹配的子串strmacther替换为replacement，
//      然后之前的文本和替换文本一起(strbefore+replacement)追加到StringBuffer中
        System.out.println("替换之前StringBuffer中的内容-->" + sb);
        m.appendReplacement(sb, "A");
        System.out.println("替换之后StringBuffer中的内容-->" + sb);
        System.out.println("---------------------------------------------");
    }
    //原来文本中把上次匹配结束位置之后剩下的字符串也写到StringBuffer中
    System.out.println("#######################################");
    System.out.println("替换之前StringBuffer中的内容-->" + sb);
    m.appendTail(sb);
    System.out.println("替换之后StringBuffer中的内容-->" + sb);
    System.out.println("替换之前的文本:"+text);
    System.out.println("全部替换之后的:" + sb);
}

```
运行结果：
```
替换之前StringBuffer中的内容-->
替换之后StringBuffer中的内容-->before_ONEA
---------------------------------------------
替换之前StringBuffer中的内容-->before_ONEA
替换之后StringBuffer中的内容-->before_ONEA_TWOA
---------------------------------------------
替换之前StringBuffer中的内容-->before_ONEA_TWOA
替换之后StringBuffer中的内容-->before_ONEA_TWOA_THREEA
---------------------------------------------
#######################################
替换之前StringBuffer中的内容-->before_ONEA_TWOA_THREEA
替换之后StringBuffer中的内容-->before_ONEA_TWOA_THREEA_End
替换之前的文本:before_ONEa_TWOa_THREEa_End
全部替换之后的:before_ONEA_TWOA_THREEA_End
```
**分析：**
**while语句：**
- 第一次替换:sb中是没有内容的，find()方法匹配到before_ONE`a`_TWOa_THREEa_End,这个时候，获取匹配文本前面的字符串`before_NO`，然后把匹配文本`a`替换成`A`,前面的字符串`before_NO`和替换文本`A`组成`before_NOA`追加到StringBuffer中。

- 第二次替换:sb中的内容为`before_NOA`,find()方法匹配到before_ONEa_TWO`a`_THREEa_End，同样获取前面没有匹配的文本`_TWO`(做法是获取从find()方法上次结束的位置,到这次find()方法开始位置之间的字符串：before_ONEa`_TWO`a_THREEa_End),然后把`a`替换成`A`,这样组成新的文本呢`_TWOA`,追加到StringBuffer中，这样就形成`before_NOA_TWOA`

- find()方法会一直向前匹配子串，然后替换,如此类推，直到所有的替换完成

因为原来文本中还有剩下的没有匹配的内容，before_ONEa_TWOa_THREEa`_End`，
使用m.appendTail(sb);把这剩下的内容`_End`也追加到StringBuffer中，这样就实现全部替换了。
#### 替换第一次匹配的子串 ####
```java
if (matcher.find())
{
    matcher.appendReplacement(sb, replacement);
}
matcher.appendTail(sb);

```

##### 实例2：替换第一次 #####
```java
public static void testAppendReplace_TailFrist()
{
    Pattern p = Pattern.compile("a");
    String text="before_ONEa_TWOa_THREEa_End";
    Matcher m = p.matcher(text);
    StringBuffer sb = new StringBuffer();
    if(m.find())
    {
//      获取匹配子串之前的文本strbefore，获取匹配的子串strmacther，然后把匹配的子串strmacther替换为replacement，
//      然后(strbefore+replacement)追加到StringBuffer中
        System.out.println("替换之前StringBuffer中的内容-->" + sb);
        m.appendReplacement(sb, "A");
        System.out.println("替换之后StringBuffer中的内容-->" + sb);
        System.out.println("---------------------------------------------");
    }
    //原来文本中把上次匹配结束位置之后剩下的字符串也写到StringBuffer中
    System.out.println("#######################################");
    System.out.println("上述替换完成后StringBuffer中的内容------>" + sb);
    m.appendTail(sb);
    System.out.println("加上文本中剩余子串后StringBuffer中的内容-->" + sb);
    System.out.println("替换之前的文本:"+text);
    System.out.println("全部替换之后的:" + sb);
}

```
运行结果：
```
替换之前StringBuffer中的内容-->
替换之后StringBuffer中的内容-->before_ONEA
---------------------------------------------
#######################################
上述替换完成后StringBuffer中的内容------>before_ONEA
加上文本中剩余子串后StringBuffer中的内容-->before_ONEA_TWOa_THREEa_End
替换之前的文本:before_ONEa_TWOa_THREEa_End
全部替换之后的:before_ONEA_TWOa_THREEa_End

```
这里我们只替换了第一次，before_ONE`a`_TWOa_THREEa_End,然后StringBuffer中处理完毕的文本为`before_ONEA`，未处理的文本为`_TWOa_THREEa_End`，最后调用m.appendTail(sb);把未处理的文本也追加入到StringBuffer中，处理完毕的文本为:`before_ONEA_TWOa_THREEa_End`

### 小结： ###
- `find()`方法匹配子串的时候都会**记下**本次成功**匹配子串的`开始位置`和`结束位置`**
- `appendReplacement(sb`,`replacement)`方法先获取所有`从上次匹配的结束位置，到本次匹配结束位置的所有字符串`，然后`替换其中匹配的部分`，最后追加到`sb`中。
- `appendReplacement(sb)`方法把结束位置到文本结尾的所有字符追加到`sb`中。
- 使用appendReplace()和appendTail()方法可以更加灵活的进行替换操作，注意要结合find()方法使用。






>原文链接: [Java正则表达式](https://lanlan2017.github.io/blog/4ea1809c/)
