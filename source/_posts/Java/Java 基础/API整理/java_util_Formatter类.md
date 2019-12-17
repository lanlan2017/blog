---
title: java_util_Formatter类
categories: 
  - Java
  - Java 基础
  - API整理
date: 2018-08-13 14:50:18
updated: 2019-12-17 05:17:09
abbrlink: 7906d867
---
<div id='my_toc'><a href="/blog/7906d867/#formatter方法" class="header_1">formatter方法</a><br><a href="/blog/7906d867/#格式化规则" class="header_1">格式化规则</a><br><a href="/blog/7906d867/#-常规类型-、-字符类型-和-数值类型-的-格式说明符语法" class="header_2">` 常规类型`、`字符类型`和`数值类型`的`格式说明符语法`</a><br><a href="/blog/7906d867/#用来表示-日期和时间类型-的格式说明符语法" class="header_2">用来表示`日期和时间类型`的格式说明符语法</a><br><a href="/blog/7906d867/#与参数不对应的格式说明符语法" class="header_2">与参数不对应的格式说明符语法</a><br><a href="/blog/7906d867/#语法规则详细说明" class="header_1">语法规则详细说明</a><br><a href="/blog/7906d867/#可选项-argument_index$" class="header_2">可选项`[argument_index$]`</a><br><a href="/blog/7906d867/#必选项-conversion" class="header_2">必选项`conversion`</a><br><a href="/blog/7906d867/#-conversion-分类：" class="header_3">`conversion`分类：</a><br><a href="/blog/7906d867/#常规格式符" class="header_3">常规格式符</a><br><a href="/blog/7906d867/#Unicode字符" class="header_3">Unicode字符</a><br><a href="/blog/7906d867/#整数格式符" class="header_3">整数格式符</a><br><a href="/blog/7906d867/#浮点数格式符号" class="header_3">浮点数格式符号</a><br><a href="/blog/7906d867/#日期/时间转换前缀" class="header_3">日期/时间转换前缀</a><br><a href="/blog/7906d867/#日期/时间转换后缀" class="header_3">日期/时间转换后缀</a><br><a href="/blog/7906d867/#格式化时间后缀" class="header_4">格式化时间后缀</a><br><a href="/blog/7906d867/#格式化日期后缀" class="header_4">格式化日期后缀</a><br><a href="/blog/7906d867/#常见的日期/时间组合简写" class="header_4">常见的日期/时间组合简写</a><br><a href="/blog/7906d867/#格式化百分号" class="header_3">格式化百分号</a><br><a href="/blog/7906d867/#格式化行分隔符" class="header_3">格式化行分隔符</a><br><a href="/blog/7906d867/#可选项-width" class="header_3">可选项`[width]`</a><br><a href="/blog/7906d867/#可选项-.precision" class="header_3">可选项`[.precision]`</a><br><a href="/blog/7906d867/#可选项-flags" class="header_2">可选项`[flags]`</a><br><a href="/blog/7906d867/#设置左右对齐,0补齐" class="header_3">设置左右对齐,0补齐</a><br><a href="/blog/7906d867/#正负数符号表示" class="header_3">正负数符号表示</a><br><a href="/blog/7906d867/#加进制标志加小数点" class="header_3">加进制标志加小数点</a><br><a href="/blog/7906d867/#组分隔符" class="header_3">组分隔符</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# formatter方法

|方法|描述|
|:-|:-|
|`void close()`|关闭此 formatter。 |
|`void flush()`|刷新此 formatter。 |
|`Formatter format(Locale l, String format, Object... args)`|使用指定的语言环境、格式字符串和参数，将一个格式化字符串写入此对象的目标文件中。 |
|`Formatter format(String format, Object... args)`|使用指定格式字符串和参数将一个格式化字符串写入此对象的目标文件中。 |
|`IOException ioException()`|返回由此 formatter 的 Appendable 方法上次抛出的 IOException 异常。 |
|`Locale locale()`|返回构造此 formatter 时设置的语言环境。 |
|`Appendable out()`|返回输出的目标文件。 |
|`String toString()`|返回对输出的目标文件调用 toString() 的结果。 |

`Formatter`是广泛被用到的格式化方法，它能让一些东西变得更加有规范，例如：超市小票，信息单，用这个方法来格式化就显得很不错。

参考：[https://blog.csdn.net/ouyang_peng/article/details/16355237](https://blog.csdn.net/ouyang_peng/article/details/16355237)

有时会想把数字，日期，字符串`按照给定规则给格式化`。`SUN JDK`为我们提供了这个`API`，它是`java.util.Formatter`。

`Formatter`提供了对布局对齐和排列的支持，以及对数值、字符串和日期/时间数据的常规格式和特定于语言环境的输出的支持。

# 格式化规则 #
要想按照自己的想法格式化必须事先编写一个规则。这个规则的语法如下。

## ` 常规类型`、`字符类型`和`数值类型`的`格式说明符语法` ##
```
%[argument_index$][flags][width][.precision]conversion
```
## 用来表示`日期和时间类型`的格式说明符语法 ##
```
   %[argument_index$][flags][width]conversion
```
## 与参数不对应的格式说明符语法 ##
```
  %[flags][width]conversion
```
`API`中有这样三种规则，很显然第一个规则的内容是最全面的。其它规则的内容和第一规则的内容有重复，那单说第一规则内容，其它规则依次类推。

注意：规则一中的`precision`前面要加英文句号“`.`”

# 语法规则详细说明 #

## 可选项`[argument_index$]` ##
- 可选的 `argument_index` 是一个`十进制整数`，**用于表明参数在参数列表中的位置**。
- 第一个参数由 "1$"引用，第二个参数由"2$"引用，依此类推。
`argument_index`很好理解，就是一参数占位符，用来表示要被格式化的参数。

```
String str1="hello";
String str2="world";
Formatter formatter=new Formatter();
formatter.format("%2$s,%1$s", str1,str2);
System.out.println(formatter);
```
运行结果：
```
world,hello
```
上面的`%2$s`,中的`s`表示这个参数字符串。详细往后看

## 必选项`conversion` ##
注意：`conversion`和前面的`%`是格式化规则中必须要有的,这两者是必选项。其他的都是可以选项。

`conversion` 是一个表明应该如何格式化参数的字符。用这个来确定被格式内容的类型，如果类型不匹配会报错。

### `conversion`分类： ###

- **常规**-可应用于任何参数类型

- **字符**-可应用于表示Unicode字符的基本类型：char、Character、byte、Byte、short和Short。当Character.isValidCodePoint(int) 返回 true时，可将此转换应用于 int和Integer 类型
- **数值**
    - **整数**-可应用于Java的整数类型：byte、Byte、short、Short、int、Integer、long、Long 和 BigInteger
    - **浮点数**-可用于Java的浮点数类型：float、Float、double、Double 和 BigDecimal
-  **日期/时间**-可应用于Java的、能够对日期或时间进行编码的类型：long、Long、Calendar 和 Date。

-  **百分比**-产生字面值'%' ('\u0025')
-  **行分隔符**-产生特定于平台的行分隔符

### 常规格式符 ###

|常规格式符|描述|
|:-|:-|
|`B b`|格式化为布尔字符串，如果参数arg 为 null，则结果为 "false"。如果arg 是一个 boolean 值或Boolean，则结果为String.valueOf() 返回的字符串。否则结果为 "true"。|
|`H h`|格式化为哈希码，如果参数arg 为 null，则结果为 "null"。否则，结果为调用Integer.toHexString(arg.hashCode()) 得到的结果。|
|`S s`|格式化为字符串，如果参数arg 为 null，则结果为 "null"。如果arg 实现 Formattable，则调用arg.formatTo。否则，结果为调用 arg.toString() 得到的结果。|

实例：
```java
public static void test_conversion_s()
{
    Formatter formatter=new Formatter();
    String name = "World";
    formatter.format("Hello %s !", name);
    System.out.println(formatter.toString());
}
public static void test_conversion_S()
{
    Formatter formatter=new Formatter();
    String name = "World";
    formatter.format("Hello %S !", name);
    System.out.println(formatter.toString());
}
public static void test_conversion_b()
{
    Formatter formatter=new Formatter();
    String name = "World";
    formatter.format("Hello %b !", name);
    System.out.println(formatter.toString());
}
public static void test_conversion_B()
{
    Formatter formatter=new Formatter();
    String name = "World";
    formatter.format("Hello %B !", name);
    System.out.println(formatter.toString());
}
public static void test_conversion_h()
{
    Formatter formatter=new Formatter();
    String name = "World";
    formatter.format("Hello %h !", name);
    System.out.println(formatter.toString());
}
public static void test_conversion_H()
{
    Formatter formatter=new Formatter();
    String name = "World";
    formatter.format("Hello %H !", name);
    System.out.println(formatter.toString());
}
```

运行结果：
```java
Hello World !
Hello WORLD !
Hello true !
Hello TRUE !
Hello 4fe2b72 !
Hello 4FE2B72 !
```
从结果中我们可以看出：大写`%S`就会格式化为大写的字符串，小写的`%s`就会格式化成小写的字符串。大写的`%B`就会格式化为大写的布尔字符串，小写的`%b`就格式化为小写的。`%H`格式化为大写的哈希码，`%h`格式化为小写的哈希码

### Unicode字符 ###

|字符格式符|描述|
|:-|:-|
|`C c`|结果是一个 Unicode字符|

实例：中文对应的Unicode字符(Utf-16be)为`\u4E2D\u6587`
```java
public static void test_conversion_c(Formatter formatter)
{
    char[] chs={'\u4E2D','\u6587'};
    for (char c : chs)
    {
        formatter.format("%c", c);
    }
    System.out.println(formatter);
}
```
运行结果为：
```
中文
```
这里提一下，中文转为Unicode字符这个我还没去研究，暂时想到下面这种方式实现：
```java
String str = "中文";
try
{
    String encodeStr = URLEncoder.encode(str, "utf-16be");
    encodeStr = encodeStr.replaceAll("%(.{2})%(.{2})", "\\\\u$1$2");
    System.out.println(encodeStr);
} catch (UnsupportedEncodingException e)
{
    // TODO Auto-generated catch block
    e.printStackTrace();
}
```
运行结果:
```
\u4E2D\u6587
```
### 整数格式符 ###

|整数格式符|描述|
|:-|:-|
|`d`|结果被格式化为十进制整数|
|`o`|结果被格式化为八进制整数|
|`X x`|结果被格式化为十六进制整数|

实例：
```
Formatter formatter=new Formatter();
int value=233;
formatter.format("十进制:%d\n", value);
formatter.format("八进制:%o\n", value);
formatter.format("小写十六进制:%x\n", value);
formatter.format("大写十六进制:%X\n", value);
System.out.println(formatter);
```
运行结果:
```
十进制:233
八进制:351
小写十六进制:e9
大写十六进制:E9

```

### 浮点数格式符号

|浮点数格式符|描述|
|:-|:-|
|`f`|结果被格式化为十进制数|
|`E e`|结果被格式化为用计算机科学记数法表示的十进制数|
|`G g`|根据精度和舍入运算后的值，使用计算机科学记数形式或十进制格式对结果进行格式化。|
|`A a`|结果被格式化为带有效位数和指数的十六进制浮点数|

实例：
```
Formatter formatter=new Formatter();
double value=1230000.45678;
formatter.format("十进制浮点数:%f\n", value);
formatter.format("科学计数法十进制浮点数:%e\n", value);
formatter.format("科学计数法十进制浮点数:%E\n", value);
formatter.format("根据精度和舍入运算后的值:%g\n", value);
formatter.format("根据进度和舍入运算后的值:%G\n", value);
value=12345.456789;
formatter.format("根据精度和舍入运算后的值:%g\n", value);
formatter.format("根据进度和舍入运算后的值:%G\n", value);
formatter.format("带有效位数和指数的十六进制浮点数:%a\n", value);
formatter.format("带有效位数和指数的十六进制浮点数:%A\n", value);
System.out.println(formatter);
```
运行结果：
```
十进制浮点数:1230000.456780
科学计数法十进制浮点数:1.230000e+06
科学计数法十进制浮点数:1.230000E+06
根据精度和舍入运算后的值:1.23000e+06
根据进度和舍入运算后的值:1.23000E+06
根据精度和舍入运算后的值:12345.5
根据进度和舍入运算后的值:12345.5
带有效位数和指数的十六进制浮点数:0x1.81cba780fdc16p13
带有效位数和指数的十六进制浮点数:0X1.81CBA780FDC16P13
```
### 日期/时间转换前缀 ###

|日期格式符|描述|
|:-|:-|
|`T t`|日期和时间转换字符的`前缀`|
注意这里的`t/T`只是一个缀，它必须加上后缀才起作用。

### 日期/时间转换后缀 ###

后缀如下

以下日期和时间转换的后缀字符是为 't' 和 'T' 转换定义的。这些类型相似于但不完全等同于那些由 GNU date 和 POSIX strftime(3c) 定义的类型。提供其他转换类型是为了访问特定于 Java 的功能（如将 'L' 用作秒中的毫秒）。 

#### 格式化时间后缀 ####

以下转换字符用来`格式化时间`：   

|时间后缀|描述|
|:-|:-|
|'`H`'|`24 小时制的小时`，被格式化`为必要时带前导零的两位数`，即 00 - 23。|
|'`I`'|`12 小时制的小时`，被格式化为`必要时带前导零的两位数`，即 01 - 12。|
|'`k`'|`24 小时制的小时`，即 0 - 23。|
|'`l`'|`12 小时制的小时`，即 1 - 12。|
|'`M`'`|小时中的分钟`，被格式化为`必要时带前导零的两位数`，即 00 - 59。|
|'`S`'|`分钟中的秒`，被格式化为`必要时带前导零的两位数`，即 00 - 60 （"60" 是支持闰秒所需的一个特殊值）。|
|'`L`'|`秒中的毫秒`，被格式化为`必要时带前导零的三位数`，即 000 - 999。|
|'`N`'|秒中的`毫微秒`，被格式化为`必要时带前导零的九位数`，即 000000000 - 999999999。|
|'`p`'|特定于语言环境的 `上午或下午` 标记以小写形式表示，例如 "am" 或 "pm"。使用转换前缀 'T' 可以强行将此输出转换为大写形式。|
|'`z`'|相对于 GMT 的 RFC 822 格式的数字时区偏移量，例如 -0800。|
|'`Z`'|表示`时区缩写形式`的字符串。Formatter 的语言环境将取代参数的语言环境（如果有）。|
|'`s`'|自`协调世界时` (UTC) 1970 年 1 月 1 日 00:00:00 `至现在所经过的秒数`，即 Long.MIN_VALUE/1000 与 Long.MAX_VALUE/1000 之间的差值。|
|'`Q`'|自`协调世界时` (UTC) 1970 年 1 月 1 日 00:00:00 `至现在所经过的毫秒数`，即 Long.MIN_VALUE 与 Long.MAX_VALUE 之间的差值。|

#### 格式化日期后缀 ####

以下转换字符用来`格式化日期`：

**大写表示全称，小写表示简称**

|日期后缀|描述|
|:-|:-|
|'`B`'|特定于语言环境的`月份全称`，例如 "January" 和 "February"。|
|'`b`'|特定于语言环境的`月份简称`，例如 "Jan" 和 "Feb"。|
|'`h`'|与 '`b`' 相同。也就是月份的简称|
|'`A`'|特定于语言环境的`星期几全称`，例如 "Sunday" 和 "Monday"|
|'`a`'|特定于语言环境的`星期几简称`，例如 "Sun" 和 "Mon"|
|'`C`'|`除以 100 的四位数表示的年份`，被格式化为必要时带前导零的两位数，即 00 - 99|
|'`Y`'|`年份`，被格式化为`必要时带前导零的四位数`（至少），例如，0092 等于格里高利历的 92 CE。|
|'`y`'|`年份的最后两位数`，被格式化为`必要时带前导零的两位数`，即 00 - 99。|
|'`j`'|`一年中的天数`，被格式化为必要时带前导零的三位数，例如，对于格里高利历是 001 - 366。|
|'`m`'|`月份`，被格式化为`必要时带前导零的两位数`，即 01 - 13。|
|'`d`'|`一个月中的天数`，被格式化为`必要时带前导零两位数`，即 01 - 31|
|'`e`'|`一个月中的天数`，被格式化为两位数，即 1 - 31。|

#### 常见的日期/时间组合简写 ####

以下转换字符用于格式化`常见的日期/时间组合`。 

|日期/时间组合|描述|
|:-|:-|
|'`R`'|`24 小时制的时间`，被格式化为 "`%tH:%tM`"|
|'`T`'|`24 小时制的时间`，被格式化为 "`%tH:%tM:%tS`"。|
|'`r`'|`12 小时制的时间`，被格式化为 "`%tI:%tM:%tS %Tp`"。上午或下午标记 ('%Tp') 的位置可能与语言环境有关。|
|'`D`'|`日期`，被格式化为 "`%tm/%td/%ty`"。|
|'`F`'|`ISO 8601 格式的完整日期`，被格式化为 "`%tY-%tm-%td`"。|
|'`c`'|`日期和时间`，被格式化为 "`%ta %tb %td %tT %tZ %tY`"，例如 "`Sun Jul 20 16:17:00 EDT 1969`"。|

任何未明确定义为转换的字符都是非法字符，并且都被保留，以供将来扩展使用。

实例：
```
Formatter formatter = new Formatter();
Date date = new Date();
formatter.format("年月日:%1$tY-%1$tm-%1$td\n", date);
formatter.format("时分秒:%1$tH:%1$tM:%1$tS\n", date);
formatter.format("月份    :%1$tB 星期:%1$tA\n", date);
formatter.format("年月日时分秒:%1$tY-%1$tm-%1$td %1$tH:%1$tM:%1$tS\n", date);
formatter.format("日期年份        :%1$tc\n", date);
formatter.format("年月日时分    简写:%1$tF %1$tR\n", date);
formatter.format("年月日时分秒简写:%1$tF %1$tT\n", date);
System.out.println(formatter);
```
运行结果：
```
年月日:2018-08-12
时分秒:19:02:20
月份    :八月 星期:星期日
年月日时分秒:2018-08-12 19:02:20
日期年份        :星期日 八月 12 19:02:20 CST 2018
年月日时分    简写:2018-08-12 19:02
年月日时分秒简写:2018-08-12 19:02:20
```
### 格式化百分号 ###
|百分号|描述|
|:-|:-|
|`%`|结果为字面值 '`%`'|
这是因为`%`在格式语法中是必选项，`%`有特殊含义所以在格式的时候，使用`%%`来表示`%`这个符号本身。

实例：
```
public static void testFormatPercent()
{
    Formatter formatter = new Formatter();
    String string="Hello World!";
    formatter.format("%% %s %%", string);
    System.out.println(formatter);
}
```
运行结果：
```
% Hello World! %
```
### 格式化行分隔符 ###

|行分隔符|描述|
|:-|:-|
|`n`|结果为特定于平台的行分隔符|

实例：
```
Formatter formatter = new Formatter();
String string="Hello%nWorld!";
formatter.format(string);
System.out.println(formatter);
```
运行结果：

```
Hello
World!
```

### 可选项`[width]` ###
可选项`width` 是一个非负十进制整数，表明要向输出中写入的最少字符
`width` 就表示一最少字符数，被格式化参数字符个数如果小于`width` ，则补上字符让字符宽度等于`width` 。如果被格式化字符宽度大于`width`则不用补齐，`width`不起作用。所以`width` 的作用就是`为少补齐`
实例：
```
public static void testWidth()
{
    int value = 123;
    Formatter formatter = new Formatter();
    formatter.format("%4d%6d%10d\n", value,value,value);
    formatter.format("%1$4d%1$6d%1$10d", value);
    System.out.println(formatter);
}
```
运行结果：
```
 123   123       123
 123   123       123
```
### 可选项`[.precision]` ###
可选 `precision` 是一个非负十进制整数，通常用来限制字符数。特定行为取决于转换类型。
`precision` 是一个截取器，用于截取被格式化参数。被格式化参数用`precision` 截取器截取后与`width` 相比，
实例：
```
double value=321.123456789;
Formatter formatter=new Formatter();
formatter.format("只精确到小数点后三位:%1$.3f\n", value);
formatter.format("总共占10位,只精确到小数点后三位:%10.3f\n", value);
System.out.println(formatter);
```
运行结果：
```
只精确到小数点后三位:321.123
总共占10位,只精确到小数点后三位:   321.123
```
要注意的是`[width]`选项掌管的是整个格式化字符串的宽度，`[.precision]`设置的是小数点后面能显示几位。小数点和小数点后面的宽度都在都包含在width宽度之内，例如上面的`321.123`占7个字符，而**`%10.3f`表示整个占`10`个字符，这十个字符里面小数点后面占`3`**位，所以会在`321.123`前面补上三个空格占满10个字符。如果设置为`%6.3f`则真正的宽度为`7`大于`6`，`width`属性失效。


## 可选项`[flags]` ##
可选项`flags` 是修改输出格式的字符集。有效标志集取决于转换类型。

|标记|含义|示例|
|-|-|-|
|`-`|结果将是`左对齐`的。|`%-4d` 宽度最小为四位并且左对齐|
|`0`|结果将用`零来填充`|`%010d` 所有宽度不满10位的数字填充前导0|
|`#`|如果是浮点数则结果加小数点，十六进制和八进制分别加`0x`和`0`|`%#x` 最后输出结果变为16进制并且加0x|
|`,`|结果将包括特定于语言环境的`组分隔符`|`%，d` 每三位数字来个逗号，看起来清晰|
|`+`|正数数字会额外显示一个`+`号|`%+d` 结果如果是正数则显示＋号|
|`一个空格`|对于正值，结果中将包括一个前导空格|`% d` 如果结果是正数则在前面加个空格|
|`(`|结果将是用圆括号括起来的负数|`%（d` 如果结果是负数，不写符号而是用（）括起来|

注意支持的类型：

下表总结了受支持的标志。`y` 表示该标志受指示参数类型支持。 

|标志|常规|字符|整数|浮点|日期/时间|说明|
|-|-|-|-|-|
|'`-`'|y|y|y|y|y|结果将是左对齐的。|
|'`#`'|y1|-|y3|y|-|结果应该使用依赖于转换类型的替换形式|
|'`+`'|-|-|y4|y|-|结果总是包括一个符号|
|'` `'|-|-|y4|y|-|对于正值，结果中将包括一个前导空格|
|'`0`'|-|-|y|y|-|结果将用零来填充|
|'`,`'|-|-|y2|y5|-|结果将包括特定于语言环境的组分隔符|
|'`(`'|-|-|y4|y5|-|结果将是用圆括号括起来的负数|
 


### 设置左右对齐,0补齐 ###
|标记|含义|示例|
|-|-|-|
|`-`|结果将是左对齐的。|`%-4d` 宽度最小为四位并且左对齐|
|`0`|结果将用零来填充|`%010d` 所有宽度不满10位的数字填充前导0|

实例：
```
public static void testAlign()
{
    double value=321.123456789;
    Formatter formatter=new Formatter();
    formatter.format("总共占10位,只精确到小数点后三位:%10.3f##\n", value);
    formatter.format("左对齐,总共占10位,不足0填充,只精确到小数点后三位:%010.3f##\n", value);
    formatter.format("左对齐,总共占10位,只精确到小数点后三位:%-10.3f##\n", value);
    System.out.println(formatter);
}
```
运行结果：
```
总共占10位,只精确到小数点后三位:   321.123##
左对齐,总共占10位,不足0填充,只精确到小数点后三位:000321.123##
左对齐,总共占10位,只精确到小数点后三位:321.123   ##
```

### 正负数符号表示 ###

|标记|含义|示例|
|-|-|-|
|`+`|正数数字会额外显示一个`+`号|`%+d` 结果如果是正数则显示＋号|
|`一个空格`|对于正值，结果中将包括一个前导空格|`% d` 如果结果是正数则在前面加个空格|
|`(`|结果将是用圆括号括起来的负数|`%（d` 如果结果是负数，不写符号而是用（）括起来|

实例：

```
double value=321.123456789;

StringBuilder builder=new StringBuilder();
//格式化结果输出到StringBuilder中
Formatter formatter = new Formatter(builder);

formatter.format("显示正负号        ,左对齐,总共占10位,只精确到小数点后三位:%+-10.3f##\n", value);
formatter.format("用空格表示正数,左对齐,总共占10位,只精确到小数点后三位:% -10.3f##\n", value);
formatter.format("用空格表示正数,左对齐,总共占10位,只精确到小数点后三位:%(-10.3f##\n", value);
value=-value;
formatter.format("显示正负号        ,左对齐,总共占10位,只精确到小数点后三位:%+-10.3f##\n", value);
formatter.format("用空格表示正数,左对齐,总共占10位,只精确到小数点后三位:% -10.3f##\n", value);
formatter.format("用空格表示正数,左对齐,总共占10位,只精确到小数点后三位:%(-10.3f##\n", value);
formatter.close();
System.out.println(builder);
```
运行结果：
![](https://i.imgur.com/m6maPtX.png)

### 加进制标志加小数点 ###
|标记|含义|示例|
|-|-|-|
|`#`|如果是浮点数则结果加小数点，十六进制和八进制分别加`0x`和`0`|`%#x` 最后输出结果变为16进制并且加0x|

先来回顾一下java，二进制，八进制，十六进制整数的静态初始化：
```
int a=0123;//8进制数
int b=0xAA;//16进制数
int c=0b1010;//二进制数
```
也可以使用：
```
//解析16进制数为十进制数
int x=Integer.parseInt("FF", 16);
```
这种方式来把其他进制转成10进制。
实例：
```
int a = 0123;// 8进制数
int b = 0xAA;// 16进制数
int c = 0b1010;// 二进制数
StringBuilder builder=new StringBuilder();
//格式化结果输出到StringBuilder中
Formatter formatter = new Formatter(builder);
// 解析16进制数为十进制数
int x = Integer.parseInt("FF", 16);
formatter.format("十进制:%1$-4d 等于%2$-3d进制:%1$#o\n", a, 8);
formatter.format("十进制:%1$-4d 等于%2$-3d进制:%1$#x\n", a, 16);
formatter.format("十进制:%1$-4d 等于%2$-3d进制:%1$#o\n", b, 8);
formatter.format("十进制:%1$-4d 等于%2$-3d进制:%1$#x\n", b, 16);
formatter.format("十进制:%1$-4d 等于%2$-3d进制:%1$#o\n", c, 8);
formatter.format("十进制:%1$-4d 等于%2$-3d进制:%1$#x\n", c, 16);
formatter.format("十进制:%1$-4d 等于%2$-3d进制:%1$#o\n", x, 8);
formatter.format("十进制:%1$-4d 等于%2$-3d进制:%1$#x\n", x, 16);
// formatter.format("%#b\n",c);
formatter.close();
System.out.println(builder.toString());
```
运行结果：
```
十进制:83   等于8  进制:0123
十进制:83   等于16 进制:0x53
十进制:170  等于8  进制:0252
十进制:170  等于16 进制:0xaa
十进制:10   等于8  进制:012
十进制:10   等于16 进制:0xa
十进制:255  等于8  进制:0377
十进制:255  等于16 进制:0xff
```
中英文混合输出的情况下英文应该使用左对齐，这样排列起来才整齐，还有就是使用等宽字体。
### 组分隔符 ###
|标记|含义|示例|
|-|-|-|
|`,`|结果将包括特定于语言环境的`组分隔符`|`%，d` 每三位数字来个逗号，看起来清晰|
```
StringBuilder builder=new StringBuilder();
//格式化结果输出到StringBuilder中
Formatter formatter = new Formatter(builder);
//formatter.close();
//System.out.println(builder);
int value=123456789;
formatter.format("%,d\n",value);
formatter.close();
System.out.println(builder);
```
运行结果：
```
123,456,789
```
