---
title: javadoc 文档注释2
categories: 
  - Java
  - Java 基础
  - 基础
abbrlink: a9f85f8d
date: 2019-02-10 18:15:08
updated: 2022-04-04 00:51:44
---
文档注释可以用于对`类`、 `属性`、`方法`等进行说明。 写文档注释时除了需要使用 `/** .... */ ` 限定之外，还需要注意注释内部的一些细节问题。
# 文档注释的格式化
javadoc生成的文档是HTML格式的，而这些HTML格式的标识符并不是javadoc添加的，而是我们在写注释的时候写上去的。比如，需要换行时，不是敲入一个回车符，而是写入`<br>` ，如果要分段，就应该在段前写入`<p>`。
文档注释的正文并不是直接复制到输出文件  ( 文档的 HTML 文件)，而是读取每一行后，删掉前导的  `*`  号及`*`号以前的空格，再输入到文档的。如
```java
/** 
* This is first line. <br> 
***** This is second line. <br> 
This is third line. 
*/
```
编译输出后的  HTML 源码则是:
```html
This is first line. <br> 
This is second line. <br> 
This is third line. 
```
前导的`*`号允许连续使用多个，其效果和使用一个`*`号一样， 但多个`*`号前不能有其它字符分隔，否则分隔符及后面的`*`号都将作为文档的内容。`*`号在这里是作为左边界使用，如上例的第一行和第二行；如果没有前导的`*`号，则边界从第一个有效字符开始，而不包括前面的空格，如上例第三行。
还有一点需要说明， 文档注释只说明紧接其后的类、 属性或者方法。如下例:
```java
/** comment for class */
public class Test { 
/** comment for a attribute */
    int number; 
/** comment for a method */
    public void myMethod() { ...... } 
    ...... 
} 
```
上例中的三处注释就是分别对`类`、 `属性`和`方法`的文档注释。 它们生成的文档分别是说明紧接其后的类、属性、方法的。“`紧接`”二字尤其重要，如果忽略了这一点，就很可能造成生成的文档错误。如
```java
import java.lang.*; 
/** commnet for class */
public class Test { ...... } 
//  此例为正确的例子
```
这个文档注释将生成正确的文档。 但只需要改变其中两行的位置， 变成下例，就会出错：
```java
/** commnet for class */
import java.lang.*; 
public class Test { ...... } 
//  此例为错误的例子
```
调换了位置后，`/** commnet for class */`后紧接的就是不  `class Test`  了，而是一个  `import`  语句。由于文档注释只能说明类、属性和方法.不能说明import语句，所以这个文档注释就被当作`错误的说明`而忽略掉了。
# 文档注释的三部分
根据在文档中显示的效果，文档注释分为三部分。下面是String类的charAt()方法的文档注释和源码
```java
/**
 * Returns the {@code char} value at the
 * specified index. An index ranges from {@code 0} to
 * {@code length() - 1}. The first {@code char} value of the sequence
 * is at index {@code 0}, the next at index {@code 1},
 * and so on, as for array indexing.
 *
 * <p>If the {@code char} value specified by the index is a
 * <a href="Character.html#unicode">surrogate</a>, the surrogate
 * value is returned.
 *
 * @param      index   the index of the {@code char} value.
 * @return     the {@code char} value at the specified index of this string.
 *             The first {@code char} value is at index {@code 0}.
 * @exception  IndexOutOfBoundsException  if the {@code index}
 *             argument is negative or not less than the length of this
 *             string.
 */
public char charAt(int index) {
    if ((index < 0) || (index >= value.length)) {
        throw new StringIndexOutOfBoundsException(index);
    }
    return value[index];
}
```
## 第一部分 简述
第一部分是**简述**。 文档中，对于属性和方法都是先有一个列表， 然后才在后面一个一个的详细的说明。 **列表中属性名或者方法名后面那段说明就是简述**。 如下图中被红框框选的部分：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/java%20JiChu/javadoc/JianShu.png)
简述部分写在一段文档注释的最前面，第一个`点号(.)`  之前 ( 包括点号 )。
换句话说，就是用第一个点号之前是简述,之后是第二部分和第三部分。如上例中的 “`Returns the {@code char} value at the specified index.`”。
## 第二部分 详细说明
第二部分是详细说明部分。 该部分对属性或者方法进行详细的说明， 在格式上没有什么特殊的要求，可以包含若干个点号。它在文档中的位置如下图所示:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/java%20JiChu/javadoc/2.png)
这部分文档在上例中相应的代码是:
```java
/**
 * Returns the {@code char} value at the
 * specified index. An index ranges from {@code 0} to
 * {@code length() - 1}. The first {@code char} value of the sequence
 * is at index {@code 0}, the next at index {@code 1},
 * and so on, as for array indexing.
 *
 * <p>If the {@code char} value specified by the index is a
 * <a href="Character.html#unicode">surrogate</a>, the surrogate
 * value is returned.
 *
```
可以发现简述也在第二部分中。所以不要在详细说明部分中再写一次简述。
## 第三部分 特殊说明
第三部分是`特殊说明部分`。 这部分包括版本说明、 `参数说明`、`返回值说明`等。它在文档中的位置：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/java%20JiChu/javadoc/3.png)
第三部分在上例中相应的代码是:
```java
 * @param      index   the index of the {@code char} value.
 * @return     the {@code char} value at the specified index of this string.
 *             The first {@code char} value is at index {@code 0}.
 * @exception  IndexOutOfBoundsException  if the {@code index}
 *             argument is negative or not less than the length of this
 *             string.
```
# javadoc  标记
javadoc  标记是插入文档注释中的特殊标记， 它们用于标识代码中的特殊引用。javadoc 标记由“`@`”及其后所跟的标记类型和专用注释引用组成。虽然 @ 和 标记类型之间有时可以用空格符分隔， 但是建议将它们紧挨着写，以减少出错机会。
javadoc  标记有如下一些:

|标记|用于|作用|
|:--|:--|:--|
|`@author`|对类的说明|标明开发该类模块的作者|
|`@version`|对类的说明|标明该类模块的版本|
|`@see`|对类、属性、方法的说明|参考转向，也就是相关主题|
|`@param`|对方法的说明|对方法中某参数的说明|
|`@return`|对方法的说明|对方法返回值的说明|
|`@exception`|对方法的说明|对方法可能抛出的异常进行说明|

|单词|读音|
|:--|:--|
|<a href="https://fanyi.baidu.com/?#en/zh/param">param</a>|<img src="/images/play.png" onclick="paly_audioID5Jsw7CXj();" class="shake-little" style="border: 0px;" title="点击播放">|

<audio src="https://fanyi.baidu.com/gettts?lan=en&text=param&spd=5&source=web" id="audioID5Jsw7CXj"></audio>
<script>
    function paly_audioID5Jsw7CXj() {var id = document.getElementById("audioID5Jsw7CXj");if (id != null) {id.play();}}
</script>

下面详细说明各标记。
## @see  的使用
@see 的用法有三种：
- `@see 类名`
- `@see #方法名或属性名`
- `@see 类名#方法名或属性名`

### @see 类名
`@see 类名`，可以根据需要只写出类名  ( 如`@see String`)  或者写出类全名  ( 如`@see java.lang.String`) 。那么什么时候只需要写出类名，什么时候需要写出类全名
呢？
如果 java  源文件中的  import  语句包含了的类， 可以只写出类名， 如果没有包含，则需要写出类全名。 `java.lang`也已经默认被包含了。所以java.lang包中的类可以直接写`@see 类名`就行了,而不用写`@see java.lang.类名`。
可以简单的用javac编译来判断是写`@see 类名`还是`@see 类全名`,源程序中javac能找到的类，javadoc也一定能找到,此时就可以简写为`@see 类名`；javac找不到的类，javadoc也找不到，此时就只能写`@see 类全名`了。
## @see 方法名或者属性名
方法名或者属性名， 如果是属性名， 则只需要写出属性名即可； 如果是方法名，则需要写出方法名以及参数类型，没有参数的方法，需要写出一对括号。如:

|成员类型|成员名称及参数|@see 句法|
|:--|:--|:--|
|属性|number|@see #number|
|属性|count|@see #count|
|方法|count()|@see #count()|
|方法|show(boolean b)|@see #show(boolean)|
|方法|sort(String[] array)|@see #sort(String[])|

有时也可以偷懒：假如上例中，没有 count  这一属性，那么参考方法  count() 就可以简写成  @see count 。不过，为了安全起见，还是写全  @see count()  比较好。
## @see 类名#方法名或属性名
第二个句法`@see #方法名或属性名`中没有指出类名， 则默认为当前类。 所以它定义的参考， 都转向本类中的属性或者方法。 而第三个句法`@see 类名#方法名或属性名`中指出了类名， 则还可以转向其它类的属
性或者方法。
```java
/** 
 * @see String 
 * @see java.lang.StringBuffer 
 * @see #str 
 * @see #str() 
 * @see #sort(String[]) 
 * @see Object#toString() 
 */
public class TestJavaDoc {
    /**
     * 字符串成员变量.
     */
    public String str;
    /**
    *一个方法.
    */
    public void str()
    {
    }
    /**
    *排序方法.
    */
    public static void sort(String[] args)
    {
    }
} 
```
生成的文档的相关部分如下图：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/java%20JiChu/javadoc/4.png)
String  和 StringBuffer  都是在 java.lang  包中，由于这个包是默认导入了的，所以这两个类可以直接写类名，也可以写类全名。 str 、str()  为同名属性和方法，所以方法名需要用`()`区分。sort 是带参数的方法，所以在`()`中指明了参数类型`String[]`。 toString()虽然在本类中也有( 从 Object  继承的)，但我们是想参考Object类的toString()  方法，所以使用了 `Object#toString()` 。
奇怪的是，为什么其中只有  `str` 、`str()`  和 `sort(String[])`  变成了链接,而String,StringBuffer,Object.toString()都没有变成链接呢?
那是因为编译时没有把  java.lang  包或者`Stirng` 、`StringBuffer` 、`Object` 
三个类的源文件一起加入编译， 所以，生成的文档没有关于那三个类的信息， 也就不可以建立链接了。
上例中如果去把类中的  str  属性去掉，那么生成的文档又会有什么变化呢？
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/java%20JiChu/javadoc/5.png)
你会发现， 原来是 str,  str() ，而现在变成了  str(),  str() ，因为 str  属性已经没有了，所以  `@ #str`  也表示方法  str() 。
这两个标记分别用于指明类的作者和版本。 缺省情况下  javadoc  将其忽略，
## 使用 @author、@version  说明类
但命令行开关  `-author`  和 `-version`  可以修改这个功能，使其包含的信息被输出。这两个标记的句法如下：
```java
@author 作者名
@version  版本号
```
其中，@author 可以多次使用， 以指明多个作者， 生成的文档中每个作者之间使用逗号  (,)  隔开。@version  也可以使用多次，如下例：
```bat
/** 
 * @author Blue 
 * @author Green 
 * @version Version 1.00 
 * @version Version 2.00 
 */
public class TestJavaDocAuthorVerSion { 
} 
```
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/java%20JiChu/javadoc/6.png)
从图上看，作者列表是以逗号分隔的， 如果我想分行显示怎么办？
```java
@author Blue<br>Green 
@version Version 1.00<br>Version 2.00
```
效果如图所示:
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/java%20JiChu/javadoc/7.png)
## 使用 @param 、@return  和 @exception  说明方法
这三个标记都是只用于方法的。 @param  描述方法的参数， @return  描述方法的返回值， @exception  描述方法可能抛出的异常。它们的句法如下：
```java
@param  参数名 参数说明
@return  返回值说明
@exception  异常类名 说明
```
- 每一个 @param 只能描述方法的一个参数，所以，如果方法需要多个参数，就需要多次使用  @param 来描述。
- 一个方法中只能用一个  @return ，如果文档说明中列了多个  @return ，则javadoc  编译时会发出警告，且只有第一个  @return  在生成的文档中有效。
- 方法可能抛出的异常应当用  @exception  描述。由于一个方法可能抛出多个异常，所以可以有多个  @exception 。每个 @exception  后面应有简述的异常类名，说明中应指出抛出异常的原因。 需要注意的是， 异常类名应该根据源文件的
import  语句确定是写出类名还是类全名。 

示例如下：
# javadoc  命令
运行`javadoc -help `可以看到  javadoc  的用法：
```cmd
用法: javadoc [options] [packagenames] [sourcefiles] [@files]
  -overview <file>                 从 HTML 文件读取概览文档
  -public                          仅显示 public 类和成员
  -protected                       显示 protected/public 类和成员 (默认值)
  -package                         显示 package/protected/public 类和成员
  -private                         显示所有类和成员
  -help                            显示命令行选项并退出
  -doclet <class>                  通过替代 doclet 生成输出
  -docletpath <path>               指定查找 doclet 类文件的位置
  -sourcepath <pathlist>           指定查找源文件的位置
  -classpath <pathlist>            指定查找用户类文件的位置
  -cp <pathlist>                   指定查找用户类文件的位置
  -exclude <pkglist>               指定要排除的程序包列表
  -subpackages <subpkglist>        指定要递归加载的子程序包
  -breakiterator                   计算带有 BreakIterator 的第一个语句
  -bootclasspath <pathlist>        覆盖由引导类加载器所加载的
                                   类文件的位置
  -source <release>                提供与指定发行版的源兼容性
  -extdirs <dirlist>               覆盖所安装扩展的位置
  -verbose                         输出有关 Javadoc 正在执行的操作的信息
  -locale <name>                   要使用的区域设置, 例如 en_US 或 en_US_WIN
  -encoding <name>                 源文件编码名称
  -quiet                           不显示状态消息
  -J<flag>                         直接将 <flag> 传递到运行时系统
  -X                               输出非标准选项的提要
通过标准 doclet 提供:
  -d <directory>                   输出文件的目标目录
  -use                             创建类和程序包用法页面
  -version                         包含 @version 段
  -author                          包含 @author 段
  -docfilessubdirs                 递归复制文档文件子目录
  -splitindex                      将索引分为每个字母对应一个文件
  -windowtitle <text>              文档的浏览器窗口标题
  -doctitle <html-code>            包含概览页面的标题
  -header <html-code>              包含每个页面的页眉文本
  -footer <html-code>              包含每个页面的页脚文本
  -top    <html-code>              包含每个页面的顶部文本
  -bottom <html-code>              包含每个页面的底部文本
  -link <url>                      创建指向位于 <url> 的 javadoc 输出的链接
  -linkoffline <url> <url2>        利用位于 <url2> 的程序包列表链接至位于 <url> 的文档
  -excludedocfilessubdir <name1>:.. 排除具有给定名称的所有文档文件子目录。
  -group <name> <p1>:<p2>..        在概览页面中, 将指定的程序包分组
  -nocomment                       不生成说明和标记, 只生成声明。
  -nodeprecated                    不包含 @deprecated 信息
  -noqualifier <name1>:<name2>:... 输出中不包括指定限定符的列表。
  -nosince                         不包含 @since 信息
  -notimestamp                     不包含隐藏时间戳
  -nodeprecatedlist                不生成已过时的列表
  -notree                          不生成类分层结构
  -noindex                         不生成索引
  -nohelp                          不生成帮助链接
  -nonavbar                        不生成导航栏
  -serialwarn                      生成有关 @serial 标记的警告
  -tag <name>:<locations>:<header> 指定单个参数定制标记
  -taglet                          要注册的 Taglet 的全限定名称
  -tagletpath                      Taglet 的路径
  -charset <charset>               用于跨平台查看生成的文档的字符集。
  -helpfile <file>                 包含帮助链接所链接到的文件
  -linksource                      以 HTML 格式生成源文件
  -sourcetab <tab length>          指定源中每个制表符占据的空格数
  -keywords                        使程序包, 类和成员信息附带 HTML 元标记
  -stylesheetfile <path>           用于更改生成文档的样式的文件
  -docencoding <name>              指定输出的字符编码

```
这里列举常用参数如下：
```cmd
-public  仅显示 public  类和成员
-protected  显示 protected/public  类和成员  ( 缺省) 
-package  显示 package/protected/public  类和成员
-private  显示所有类和成员
-d <directory>  输出文件的目标目录
-version  包含 @version  段
-author  包含 @author  段
-splitindex  将索引分为每个字母对应一个文件
-windowtitle <text>  文档的浏览器窗口标题
```
## -public 、-protected 、-package、-private  四个选项
-public 、-protected 、-package、-private  四个选项，只需要任选其一即可。它们指定的显示类成员的程度。 它们显示的成员多少是一个包含的关系， 如下表：
<hr><table border="1"><tr><td>private ( 显示所有类和成员 )<table border="1"><tr><td>-package ( 显示 package/protected/public 类和成员 )<table border="1"><tr><td>-protected ( 显示 protected/public 类和成员 )<table border="1"><tr><td> -public ( 仅显示 public 类和成员 )</td></tr></table></td></tr></table></td></tr></table></td></tr>
</table><hr>

## -d  选项
-d  选项允许你定义输出目录。如果不用  -d  定义输出目录，生成的文档文件会放在当前目录下。 -d  选项的用法是
```cmd
-d  目录名
```
目录名为必填项， 也就是说， 如果你使用了  -d  参数，就一定要为它指定一个目录。这个目录必须已经存在了，如果还不存在，请在运行  javadoc  之前创建该目录。
`-version`  和 `-author`  用于控制生成文档时是否生成  @version  和@author 指定的内容。不加这两个参数的情况下(默认情况)， 生成的文档中不包含版本和作者信息。
## -splitindex
`-splitindex`  选项将索引分为每个字母对应一个文件。 默认情况下，索引文件只有一个， 且该文件中包含所有索引内容。 当然生成文档内容不多的时候， 这样做非常合适，但是， 如果文档内容非常多的时候，这个索引文件将包含非常多的内容，显得过于庞大。使用  -splitindex  会把索引文件按各索引项的第一个字母进行分类，每个字母对应一个文件。 这样，就减轻了一个索引文件的负担。
## -windowtitle
`-windowtitle`  选项为文档指定一个标题， 该标题会显示在窗口的标题栏上。如果不指定该标题，而默认的文档标题为“生成的文档（无标题）”。该选项的
用法是：
```cmd
-windowtitle  标题
```
标题是一串没有包含空格的文本， 因为空格符是用于分隔各参数的， 所以不能包含空格。 同 -d  类似，如果指定了  -windowtitle  选项，则必须指定标题文本。
