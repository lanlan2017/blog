---
title: Java String对象
categories: 
  - 编程
  - Java
  - Java 基础
  - API整理
date: 2019-01-12 20:49:25
updated: 2021-03-20 07:58:28
abbrlink: 14ce793e
---
我们经常使用 String 类来定义一个字符串。字符串是`常量`，它们的值在创建之后不能更改。字符串缓冲区支持可变的字符串。
## 父类
```
java.lang.Object
```
## 实现的接口
```
Serializable, CharSequence, Comparable<String>
```
## 字段:使用该字段可以对String进行排序
```
static Comparator<String> CASE_INSENSITIVE_ORDER一个对 String 对象进行排序的 Comparator，作用与 compareToIgnoreCase 相同 
```
### 实例
```java
public static void main(String[] args)
{
    String[] rawStrings ={"B", "com.lan", "b", "A", "a", "c", "C"};
    System.out.println(Arrays.toString(rawStrings));
    // 使用String.CASE_INSENSITIVE_ORDER进行排序
    Arrays.sort(rawStrings, String.CASE_INSENSITIVE_ORDER);
    System.out.println(Arrays.toString(rawStrings));
}
```
运行结果：
```
[B, com.lan, b, A, a, c, C][A, a, B, b, c, C, com.lan]
```
现在只知道可以进行排序，具体后面再研究，先接着写下去。好像可以参考的博客：http://blog.51cto.com/lavasoft/68380
**4.构造方法：**
**(1)默认构造方法：**
```
String()初始化一个新创建的 String 对象，使其表示一个空字符序列。 
```
**(2)使用整个byte数组创建String对象且使用默认字符集：**

```
String(byte[] bytes)通过使用平台的默认字符集解码指定的 byte 数组，构造一个新的 String。String(byte[] bytes, int offset, int length)通过使用平台的默认字符集解码指定的 byte 子数组，构造一个新的 String。
```
**(3)使用整个byte数组创建String对象且指定字符集**
```
String(byte[] bytes, String charsetName)通过使用指定的 charset 解码指定的 byte 数组，构造一个新的 String。String(byte[] bytes, Charset charset)通过使用指定的 charset 解码指定的 byte 数组，构造一个新的 String。 
```
**(4)使用byte数组的一部分创建String对象且指定字符集，指定在byte数组中的起始下标和长度:**
```
String(byte[] bytes, int offset, int length, Charset charset)通过使用指定的 charset 解码指定的 byte 子数组，构造一个新的 String。String(byte[] bytes, int offset, int length, String charsetName)通过使用指定的字符集解码指定的 byte 子数组，构造一个新的 String。 
```
**(5)使用字符数组(char[])创建String对象：**
```
String(char[] value)分配一个新的 String，使其表示字符数组参数中当前包含的字符序列。String(char[] value, int offset, int count)分配一个新的 String，它包含取自字符数组参数一个子数组的字符。 
```
**(6)使用Unicode代码点数组创建String对象：**
```
String(int[] codePoints, int offset, int count)分配一个新的 String，它包含 Unicode 代码点数组参数一个子数组的字符。 
```
**(7)使用变长字符串StringBuffer,StringBuilder做为参数创建String对象：**
```
String(StringBuffer buffer)分配一个新的字符串，它包含字符串缓冲区参数中当前包含的字符序列。String(StringBuilder builder)分配一个新的字符串，它包含字符串生成器参数中当前包含的字符序列。 
```
**(8)使用String对象作为参数创建String对象,相当于创建一个旧的String对象的副本**
```
String(String original)初始化一个新创建的 String 对象，使其表示一个与参数相同的字符序列；换句话说，新创建的字符串是该参数字符串的副本。 
```
**5. 方法**
**(1)字符串的长度，判断字符串是否为空字符串。**
```
 boolean isEmpty()当且仅当 length() 为 0 时返回 true。int length()返回此字符串的长度。 
```
**(2)判断该字符串中是否包含指定的字符串，获取字符**
```
 boolean contains(CharSequence s)当且仅当此字符串包含指定的 char 值序列时，返回 true。
```
**(3)返回指定索引处的字符值：**
```
 char charAt(int index)返回指定索引处的 char 值。
```
**(4)字符串连接：**
```
 String concat(String str)将指定字符串连接到此字符串的结尾。 
```
**(5)从前向后扫描，返回字符或者字符串参数在该字符串中第一次出现的索引：**
```
int indexOf(int ch)返回指定字符在此字符串中第一次出现处的索引。int indexOf(String str)返回指定子字符串在此字符串中第一次出现处的索引。int indexOf(int ch, int fromIndex)返回在此字符串中第一次出现指定字符处的索引，从指定的索引开始搜索。int indexOf(String str, int fromIndex)返回指定子字符串在此字符串中第一次出现处的索引，从指定的索引开始。 
```
**(6)从后向前扫描，返回字符或字符串参数在该字符串中第一次出现的索引：**
```
 int lastIndexOf(int ch)返回指定字符在此字符串中最后一次出现处的索引。int lastIndexOf(String str)返回指定子字符串在此字符串中最右边出现处的索引。int lastIndexOf(int ch, int fromIndex)返回指定字符在此字符串中最后一次出现处的索引，从指定的索引处开始进行反向搜索。int lastIndexOf(String str, int fromIndex)返回指定子字符串在此字符串中最后一次出现处的索引，从指定的索引开始反向搜索。 
```
**(7)获取该字符串的一部分子字符串：**
```
tring substring(int beginIndex)返回一个新的字符串，它是此字符串的一个子字符串。String substring(int beginIndex, int endIndex)返回一个新字符串，它是此字符串的一个子字符串。
```
**这个方法经常与上面两个方法String.lastIndexOf()和String.indexOf()方法一起使用，使用这两个方法查找分割的位置，然后再使用String.subString()方法进行分割。**
**(8)获取该字符串的一部分，以字符序列返回：**
```
 CharSequence subSequence(int beginIndex, int endIndex)返回一个新的字符序列，它是此序列的一个子序列。 
```
**(9)重写Object的方法：**
```
 boolean equals(Object anObject)将此字符串与指定的对象比较。int hashCode()返回此字符串的哈希码。String toString()返回此对象本身（它已经是一个字符串！）。
```
**(10)实现comparable接口的比较方法：**
```
 int compareTo(String anotherString)按字典顺序比较两个字符串。 
```
**(11)不按大小写的比较方法**
```
 int compareToIgnoreCase(String str)按字典顺序比较两个字符串，不考虑大小写。boolean equalsIgnoreCase(String anotherString)将此 String 与另一个 String 比较，不考虑大小写。 
```
**(12)基本类型：int,long,float,double,char,char数组，Object(对象)转换成String的方法:String.valueOf(xxx)**
```
static String valueOf(int i)返回 int 参数的字符串表示形式。static String valueOf(long l)返回 long 参数的字符串表示形式。static String valueOf(float f)返回 float 参数的字符串表示形式。static String valueOf(double d)返回 double 参数的字符串表示形式。static String valueOf(boolean b)返回 boolean 参数的字符串表示形式。static String valueOf(char c)返回 char 参数的字符串表示形式。static String valueOf(char[] data)返回 char 数组参数的字符串表示形式。static String valueOf(char[] data, int offset, int count)返回 char 数组参数的特定子数组的字符串表示形式。static String valueOf(Object obj)返回 Object 参数的字符串表示形式。 
```
## String字符串转为字节数组
|方法|描述|
|:---|:--|
|byte[] getBytes()|使用平台的默认字符集将此 String 编码为 byte 序列，并将结果存储到一个新的 byte 数组中。|
|byte[] getBytes(Charset charset)|使用给定的 charset 将此 String 编码到 byte 序列，并将结果存储到新的 byte 数组。|
|byte[] getBytes(String charsetName)|使用指定的字符集将此 String 编码为 byte 序列，并将结果存储到一个新的 byte 数组中。 |

## 大小写转换
|方法| 描述|
|-|-|
|String toLowerCase() 使用默认语言环境的规则将此 String 中的所有字符都转换为小写。|
|String toLowerCase(Locale locale)|使用给定 Locale 的规则将此 String 中的所有字符都转换为小写。|
|String toUpperCase()|使用默认语言环境的规则将此 String 中的所有字符都转换为大写。|
|String toUpperCase(Locale locale)|使用给定 Locale 的规则将此 String 中的所有字符都转换为大写。|

### 正则匹配
|方法|描述|
|:-|:-|
|boolean matches(String regex)|判断该字符串是否匹配给定的正则表达式|
### 正则表达式分割
|方法|描述|
|:---------------------------|:-------------------------------------------|
|String[] split(String regex)|根据给定正则表达式的匹配拆分此字符串。|
|String[] split(String regex, int limit)|根据匹配给定的正则表达式来拆分此字符串。 |

**注意，获取的数组中不包含作为分割符的字符(或字符串)**
**(17)判断字符串的前缀后缀：**
```
 boolean startsWith(String prefix)测试此字符串是否以指定的前缀开始。boolean startsWith(String prefix, int toffset)测试此字符串从指定索引开始的子字符串是否以指定前缀开始。boolean endsWith(String suffix)测试此字符串是否以指定的后缀结束。 
```
**(18)该字符串与指定的字符序列或者StringBuffer比较**
```
 boolean contentEquals(CharSequence cs)将此字符串与指定的 CharSequence 比较。boolean contentEquals(StringBuffer sb)将此字符串与指定的 StringBuffer 比较。 
```
**(19)把字符数组转换成String**
```
static String copyValueOf(char[] data)
返回指定数组中表示该字符序列的 String。
static String copyValueOf(char[] data, int offset, int count)
返回指定数组中表示该字符序列的 String。 
```
**(20)把该字符串中的字符拷贝到指定的字符数组中去：**
```
 void getChars(int srcBegin, int srcEnd, char[] dst, int dstBegin)
将字符从此字符串复制到目标字符数组。
```
**(21)把该字符串转换成字符数组：**
```
 char[] toCharArray()将此字符串转换为一个新的字符数组。
```
**(22)使用新字符替换字符串中的旧字符：**
```
 String replace(char oldChar, char newChar)
返回一个新的字符串，它是通过用 newChar 替换此字符串中出现的所有 oldChar 得到的。
String replace(CharSequence target, CharSequence replacement)
使用指定的字面值替换序列替换此字符串所有匹配字面值目标序列的子字符串。 
```
**(23)使用新子字符串替换该字符串中匹配正则表达式的那些旧子字符串：一个全部替换，一个只替换第一个：**
```
 String replaceAll(String regex, String replacement)
使用给定的 replacement 替换此字符串所有匹配给定的正则表达式的子字符串。
String replaceFirst(String regex, String replacement)
使用给定的 replacement 替换此字符串匹配给定的正则表达式的第一个子字符串。
```
**(24)把该字符串规范化表示，去掉该字符串的前后空白符： **
```
 String intern()
返回字符串对象的规范化表示形式。
String trim()
返回字符串的副本，忽略前导空白和尾部空白。 
```
** (25)Unicode代码点相关：**
```
 int codePointAt(int index)
返回指定索引处的字符（Unicode 代码点）。
int codePointBefore(int index)
返回指定索引之前的字符（Unicode 代码点）。
int codePointCount(int beginIndex, int endIndex)
返回此 String 的指定文本范围中的 Unicode 代码点数。
int offsetByCodePoints(int index, int codePointOffset)
返回此 String 中从给定的 index 处偏移 codePointOffset 个代码点的索引。 
```
**(26)格式化字符串：**
```
static String format(Locale l, String format, Object... args)
使用指定的语言环境、格式字符串和参数返回一个格式化字符串。
static String format(String format, Object... args)
使用指定的格式字符串和参数返回一个格式化字符串。
```
**(27)判断该字符串的子字符串是否相等：**
```
 boolean regionMatches(boolean ignoreCase, int toffset, String other, int ooffset, int len)
测试两个字符串区域是否相等。
boolean regionMatches(int toffset, String other, int ooffset, int len)
测试两个字符串区域是否相等。 
```
