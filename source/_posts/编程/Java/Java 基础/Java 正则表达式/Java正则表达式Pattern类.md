---
title: Java正则表达式Pattern类
categories: 
  - 编程
  - Java
  - Java 基础
  - Java 正则表达式
abbrlink: 4ea1809c
date: 2019-01-11 22:02:27
updated: 2021-04-13 22:04:02
---
# Pattern类
Pattern在java.util.regex包中，是正则表达式的编译表示形式，此类的实例是不可变的，**可供多个并发线程安全使用**。
## 组和捕获
捕获组可以通过从左到右计算**其开括号`(`**来编号。

在表达式 ((A)(B(C))) 中，存在四个组： 

|编号|捕获组|
|:---|:---|
|1|ABC|
|2|A|
|3|BC|
|4|C|

组零始终代表整个表达式。 

## Pattern.compile方法 创建Pattern对象
Pattern类构造器是私有的，不能通过new创建Pattern对象。Pattern调用静态方法compile返回Pattern实例。

|方法|描述|
|:--|:--|
|`static Pattern compile(String regex)`|将给定的正则表达式编译为模式。|
|`static Pattern compile(String regex, int flags)`|将给定的正则表达式编译为带有给定标志的模式。|

### Pattern.compile(String regex)
```java
// 创建模板
String regex = "[a-z]";
// 创建模式
Pattern p=Pattern.compile(regex);
```
### Pattern.compile(String regex, int flags)

### 匹配标志flags
第二个compile方法的flags可以传入如下值

|属性|描述|
|:--|:--|
|`Pattern.CANON_EQ`|Enables canonical equivalence.|
|`Pattern.CASE_INSENSITIVE`|Enables case-insensitive matching.|
|`Pattern.COMMENTS`|Permits whitespace and comments in pattern.|
|`Pattern.DOTALL`|Enables dotall mode.|
|`Pattern.LITERAL`|Enables literal parsing of the pattern.|
|`Pattern.MULTILINE`|Enables multiline mode.|
|`Pattern.UNICODE_CASE`|Enables Unicode-aware case folding.|
|`Pattern.UNICODE_CHARACTER_CLASS`|Enables the Unicode version of Predefined character classes and POSIX character classes.|
|`Pattern.UNIX_LINES`|Enables Unix lines mode.|

### 嵌入式标志表达式
嵌入式标志表达式是 compile 的双参数版本的替代，并且在正则表达式本身中指定。
与 Pattern 的可公开访问的字段对应的嵌入式标志表达式如下表所示：

|常量|等效嵌入式标志表达式|
|:---|:---|
|Pattern.CANON_EQ|无|
|Pattern.CASE_INSENSITIVE|(?i)|
|Pattern.COMMENTS|(?x)|
|Pattern.MULTILINE|(?m)|
|Pattern.DOTALL|(?s)|
|Pattern.LITERAL|无|
|Pattern.UNICODE_CASE|(?u)|
|Pattern.UNIX_LINES|(?d)|

### 不区分大小写的Pattern Pattern.CASE_INSENSITIVE
可以在compile方法中传入Pattern.CASE_INSENSITIVE来创建不区分大小写的模板
```java
// 创建模板，不区分大小写
Pattern p2=Pattern.compile(regex,Pattern.CASE_INSENSITIVE);
```
也可以通过嵌入式标志表达式`(?i)`启用不区分大小写的匹配。
```java
String upCase = "HELLOWORLD";
// 方式1，创建模板，不区分大小写
Pattern p2 = Pattern.compile("[a-z]+", Pattern.CASE_INSENSITIVE);
System.out.println(p2.matcher(upCase).matches());//true
// 方式2，使用嵌入式标志表达式(?i)
System.out.println(Pattern.matches("(?i)[a-z]+", upCase));//true
```

### 启用多行模式Pattern Pattern.MULTILINE
默认情况下，表达式`^`和`$`**仅在整个输入序列的开头和结尾匹配**。
在多行模式下，表达式`^`和`$`分别在**行终止符**或**输入序列的结尾之后或之前**匹配。

也可以通过嵌入式标志表达式`(?m)`启用多行模式。
```java
// 创建模板，不区分大小写
Pattern p3=Pattern.compile(regex,Pattern.CASE_INSENSITIVE);
```
### 编译带有多个标志的模式
要编译带有多个标志的模式，请使用按位或运算符 "|" 分隔要包含的标志。
```java
pattern = Pattern.compile("[az]$", Pattern.MULTILINE | Pattern.UNIX_LINES);
```
也可以先把多个模式保存在int变量中，然后在compile方法中传入该int变量：
```java
final int flags = Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE;
Pattern pattern = Pattern.compile("aa", flags);
```

## flags方法 返回匹配标志

|方法|描述|
|:--|:--|
|`int flags()`|Returns this pattern's match flags.|

```java
// 创建模板，启用多行模式
Pattern p3 = Pattern.compile("^\\w+$", Pattern.MULTILINE);
if (p3.flags() == Pattern.MULTILINE) {
    System.out.println("多行模式");//true
}
```

## matcher方法 创建Matcher类

|方法|描述|
|:--|:--|
|`Matcher matcher(CharSequence input)`|Creates a matcher that will match the given input against this pattern.|

此方法返回一个Matcher对象。Matcher类的构造方法也是私有的,不能随意创建,只能通过Pattern.matcher(CharSequence input)方法得到该类的实例。
Pattern类只能做一些简单的匹配操作,要想得到更强更便捷的正则匹配操作,那就需要将Pattern与Matcher一起合作.Matcher类提供了对正则表达式的分组支持,以及对正则表达式的多次匹配支持。

## pattern方法toString方法返回正则表达式字符串

|方法|描述|
|:--|:--|
|`String toString()`|Returns the string representation of this pattern.|
|`String pattern()`|Returns the regular expression from which this pattern was compiled.|

```java
Pattern p3 = Pattern.compile("^\\w+$", Pattern.MULTILINE);
System.out.println(p3.toString());//^\w+$
System.out.println(p3.pattern());//^\w+$
```
这两个方法的返回值都是一样的，查看源码可以看到这两个方法的代码也是一样的

```java java.util.regex.Pattern
    // ......
    public String pattern() {
        return pattern;
    }
    // ......
    public String toString() {
        return pattern;
    }
    // ......
```
## quote(str)生产正则表达式字面量

|方法|描述|
|:--|:--|
|`static String quote(String s)`|Returns a literal pattern String for the specified String.|

返回指定 String 的文字模式 String。此方法生成 String，可用于创建与 String s 匹配的 Pattern，就像它是文字模式一样。输入序列中的元字符或转义序列将没有特殊含义。

> Java中Pattern类的quote方法将任何字符串（包括正则表达式）都转换成字符串常量，不具有任何匹配功能。


> Returns a literal pattern String for the specified String.
> This method produces a String that can be used to create a Pattern that would match the string s as if it were a literal pattern.
> Metacharacters or escape sequences in the input sequence will be given no special meaning.(使给定的正则表达式没有任何的特殊意义)
> Parameters:
> s - The string to be literalized
> Returns:
> A literal string replacement

参考资料：
[https://www.cnblogs.com/theRhyme/p/10310709.html](https://www.cnblogs.com/theRhyme/p/10310709.html)
[https://stackoverflow.com/questions/15409296/what-is-the-use-of-pattern-quote-method](https://stackoverflow.com/questions/15409296/what-is-the-use-of-pattern-quote-method)
[https://blog.csdn.net/yin380697242/article/details/52050023](https://blog.csdn.net/yin380697242/article/details/52050023)

```java
String str = ".*";
//获取该字符串对应的字面量
String literalStr=Pattern.quote(str);
//输出字面量
System.out.println("literalStr = " + literalStr);
//使用正则表达式  进行匹配
System.out.println(Pattern.matches(str, "HelloWorld"));
//使用 正则表达式的字面量 进行匹配
System.out.println(Pattern.matches(literalStr, "HelloWorld"));
//字面量匹配原来的字符串
System.out.println(Pattern.matches(literalStr, str));
```
## matches 直接匹配整个字符序列

|方法|描述|
|:--|:--|
|`static boolean matches(String regex, CharSequence input)`|Compiles the given regular expression and attempts to match the given input against it.|

此方法是一个静态方法,用于快速匹配字符串,该方法适合用于只匹配一次,且匹配全部字符串的情况.

```java
Pattern.matcher(String regex,CharSequence input)
```
它与下面这段代码等价：
```java
Pattern.compile(regex).matcher(input).matches()
```
示例代码：
```java
String str="hello";
System.out.println(Pattern.matches("^hello$", str));// true
```

## split 分割字符序列

|方法|描述|
|:--|:--|
|`String[] split(CharSequence input, int limit)`|Splits the given input sequence around matches of this pattern.|
|`String[] split(CharSequence input)`|Splits the given input sequence around matches of this pattern.|
|`Stream<String> splitAsStream(CharSequence input)`|Creates a stream from the given input sequence around matches of this pattern.|

`split`方法是一个很好的工具，用于收集位于匹配模式两侧的文本。
### split(CharSequence, int)
参考资料：[http://www.51gjie.com/java/772.html](http://www.51gjie.com/java/772.html)
方法split(CharSequence input, int limit)中的limit表示要分割成多少段，
- 如果limit>0，则分割成limit-1段。
  - 如果limit-1大于可以最终可以分割的段数，则分割到不能分割就停止。
- 如果limit<=0，则尽可能的分割，直到无法分割为止。

- input 要拆分的字符序列
- limit 结果阈值
- return 根据围绕此模式的匹配来拆分输入后所计算的字符串数组

limit参数控制应用模式的次数，从而影响结果数组的长度。
1. 如果 limit >0，那么模式至多应用 limit- 1 次，数组的长度不大于limit，并且数组的最后条目将包含除最后的匹配定界符之外的所有输入。
2. 如果 limit <=0，那么将应用模式的次数不受限制，并且数组可以为任意长度。
3. 如果 limit ==0，那么应用模式的次数不受限制，数组可以为任意长度，并且将丢弃尾部空字符串。

此方法返回的数组包含输入序列的子字符串，由匹配此模式的另一子序列或输入序列的结尾终止。数组中子字符串的顺序与其在输入中出现的顺序相同。
如果此模式与输入的任何子序列都不匹配，那么得到的数组仅包含一个元素，即字符串形式的输入序列。

```java
private static void testSplit2() {
    String str=" 1_Hello 2_World 3_Welcome 4_To 5_Learn 6_Java ";
    Pattern p=Pattern.compile(" ");
    // 分割成1段，等于不分割
    testSplitLimit(str, p,1);
    // 分割成3段，切两刀
    testSplitLimit(str, p,3);
    // 分成10段，实际上无法分割成10段
    testSplitLimit(str, p,10);
    // 分割成-10段，表示全部分割，保留最后的空字符串
    testSplitLimit(str, p,-10);
    // 分割成0段，表示全部分割，并且不保留最后的空字符串。
    testSplitLimit(str, p,0);
}

private static void testSplitLimit(String str, Pattern p, int limit) {
    // 分割成limit段，或者说应用模式limit-1次
    String[] strs= p.split(str, limit);
    for (int i = 0; i < strs.length; i++) {
        System.out.println("strs["+i+"]=" + strs[i]);
    }
    System.out.println("====================");
}
```
运行结果：
```
strs[0]= 1_Hello 2_World 3_Welcome 4_To 5_Learn 6_Java 
====================
strs[0]=
strs[1]=1_Hello
strs[2]=2_World 3_Welcome 4_To 5_Learn 6_Java 
====================
strs[0]=
strs[1]=1_Hello
strs[2]=2_World
strs[3]=3_Welcome
strs[4]=4_To
strs[5]=5_Learn
strs[6]=6_Java
strs[7]=
====================
strs[0]=
strs[1]=1_Hello
strs[2]=2_World
strs[3]=3_Welcome
strs[4]=4_To
strs[5]=5_Learn
strs[6]=6_Java
strs[7]=
====================
strs[0]=
strs[1]=1_Hello
strs[2]=2_World
strs[3]=3_Welcome
strs[4]=4_To
strs[5]=5_Learn
strs[6]=6_Java
====================
```
### split(CharSequence)
等于上面的split(CharSequence, 0)，因此，得到的数组中不包括尾部空字符串。
```java
String str="_Welcome_To_Learn_Java_";
Pattern p=Pattern.compile("_");
String[] strs=p.split(str);
for (int i = 0; i < strs.length; i++) {
    System.out.println("strs["+i+"]=" + strs[i]);
}
```
运行结果：
```
strs[0]=
strs[1]=Welcome
strs[2]=To
strs[3]=Learn
strs[4]=Java
```
#### split小结
- 如果分隔符(模式)在字符串的头部和尾部都出现，分割得到的数组的第一个和最后一个元素为空字符串。
    - 如果是split(str)方法的话，不会把最后一个空字符串保存到数组中，但第一个空字符会保留。

## java8新特性

|方法|描述|
|:--|:--|
|`Predicate<String> asPredicate()`|Creates a predicate that tests if this pattern is found in a given input string.|
|`Stream<String> splitAsStream(CharSequence input)`|Creates a stream from the given input sequence around matches of this pattern.|


## java11新特性

|方法|描述|
|:--|:--|
|`Predicate<String> asMatchPredicate()`|Creates a predicate that tests if this pattern matches a given input string.|


# 参考资料
[https://pingfangx.github.io/java-tutorials/essential/regex/pattern.html](https://pingfangx.github.io/java-tutorials/essential/regex/pattern.html)
[http://www.51gjie.com/java/758.html](http://www.51gjie.com/java/758.html)
[http://www.51gjie.com/java/772.html](http://www.51gjie.com/java/772.html)
