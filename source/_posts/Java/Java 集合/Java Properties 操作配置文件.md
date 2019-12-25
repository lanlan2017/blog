---
title: Java Properties 操作配置文件
categories: 
  - Java
  - Java 集合
date: 2018-11-26 18:53:21
updated: 2020-01-02 10:09:56
abbrlink: fdae6905
---
<div id='my_toc'><a href="/blog/fdae6905/#前言" class="header_2">前言</a><br><a href="/blog/fdae6905/#基本使用步骤" class="header_2">基本使用步骤</a><br><a href="/blog/fdae6905/#创建xxx-properties文件" class="header_3">创建xxx.properties文件</a><br><a href="/blog/fdae6905/#实例化properties类" class="header_3">实例化properties类</a><br><a href="/blog/fdae6905/#加载配置文件" class="header_3">加载配置文件</a><br><a href="/blog/fdae6905/#读取键值对" class="header_3">读取键值对</a><br><a href="/blog/fdae6905/#设置键值对" class="header_3">设置键值对</a><br><a href="/blog/fdae6905/#获取所有键" class="header_3">获取所有键</a><br><a href="/blog/fdae6905/#写入输出流的方法" class="header_3">写入输出流的方法</a><br><a href="/blog/fdae6905/#写配置文件" class="header_3">写配置文件</a><br><a href="/blog/fdae6905/#实例" class="header_2">实例</a><br><a href="/blog/fdae6905/#读取一个配置" class="header_3">读取一个配置</a><br><a href="/blog/fdae6905/#遍历配置文件" class="header_3">遍历配置文件</a><br><a href="/blog/fdae6905/#SpecialWords-properties文件" class="header_4">SpecialWords.properties文件</a><br><a href="/blog/fdae6905/#PropertyTools-java文件" class="header_4">PropertyTools.java文件</a><br><a href="/blog/fdae6905/#参考链接" class="header_2">参考链接</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 前言
Properties 继承于 Hashtable.表示一个持久的属性集.属性列表中每个键及其对应值都是一个字符串。Properties 类被许多Java类使用。例如，在获取环境变量时它就作为System.getProperties()方法的返回值。
## 基本使用步骤 ##
### 创建xxx.properties文件 ###
先在创建一个名为xxx.properties的文件，然后在里面写入键值对的信息。
- 键和值用等号隔开，等号左边的是键，等号右边的是值。
- 井号后面是注释。

如下所示:
```
# 部署网站的地址
site = https://www.lansheng.net.cn/
```

### 实例化properties类 ###

|方法|描述|
|:-|:-|
|`Properties()`|创建一个无默认值的空属性列表。 |
|`Properties(Properties defaults)`|创建一个带有指定默认值的空属性列表。 |

### 加载配置文件 ###
利用Properties中的load()方法加载配置文件,查看api可以看到有两个load()方法，如下表所示:

|方法|描述|
|:-|:-|
|`void load(InputStream inStream)`|从输入流中读取属性列表（键和元素对）。 |
|`void load(Reader reader)`|按简单的面向行的格式从输入字符流中读取属性列表（键和元素对）。 |
|`void loadFromXML(InputStream in)`|将指定输入流中由 XML 文档所表示的所有属性加载到此属性表中。 |

load()方法可以从`.properties`文件对应的文件输入流中，加载到Properties类对象中。

加载好了之后，文件中的键值对就已经保存在Properties类对象中了,可以对该对象中的信息进行读写。

### 读取键值对 ###

|方法|描述|
|:-|:-|
|`String getProperty(String key)`|用指定的键在此属性列表中搜索属性。 |
|`String getProperty(String key, String defaultValue)`|用指定的键在属性列表中搜索属性。 |
- `String getProperty(String key)`用指定的键在此属性列表中搜索属性。
    - 如果在此属性列表中未找到该键，则接着递归检查默认属性列表及其默认值。
    - 如果未找到属性，则此方法返回 null。 
    - 参数：key - 属性键。 
    - 返回：属性列表中具有指定键值的值。
- `String getProperty(String key, String defaultValue)`用指定的键在属性列表中搜索属性。
    - 如果在属性列表中未找到该键，则接着递归检查默认属性列表及其默认值。
    -  如果未找到属性，则此方法返回默认值变量`defaultValue`。
    -  参数：key - 哈希表键。defaultValue - 默认值。 
    -  返回：属性列表中具有指定键值的值。 


### 设置键值对 ###

|方法|描述|
|:-|:-|
|`Object setProperty(String key, String value)`|调用 Hashtable 的方法 put。 |

调用 Hashtable 的方法 put。使用 getProperty 方法提供并行性。强制要求为属性的`键和值使用字符串`。返回值是 Hashtable 调用 put 的结果。 
- 参数：
    - key - 要置于属性列表中的键。
    - value - 对应于 key 的值。 
- 返回：属性列表中指定键的`旧值`，如果没有值，则为 null。
### 获取所有键 ###

|方法|描述|
|:-|:-|
|`Set<String> stringPropertyNames()`|返回此属性列表中的`键集`，其中该键及其对应值是字符串，如果在主属性列表中未找到同名的键，则还包括默认属性列表中不同的键。 |
|`Enumeration<?> propertyNames()`|返回属性列表中所有`键的枚举`，如果在主属性列表中未找到同名的键，则包括默认属性列表中不同的键。 |
> `stringPropertyNames()`方法返回此属性列表中的键集，其中该键及其对应值是字符串，如果在主属性列表中未找到同名的键，则还包括默认属性列表中不同的键。其键或值不是 String 类型的属性被忽略。 返回的 set 不受 Properties 对象支持。对此 Properties 的改变不能在该 set 中反映出来，反之亦然。就是说，你用setter方法改变了Property对象中的键值对后，键集中的键不会跟着改变，要想再次正确的遍历，你就要再调用一次stringPropertyNames()来获取更新后的键集。
返回：此属性列表中的`键集`，其中该键及其对应值是字符串，包括默认属性列表中的键。
### 写入输出流的方法 ###

|方法|描述|
|:-|:-|
|`void list(PrintStream out)`|将属性列表输出到指定的输出流。 |
|`void list(PrintWriter out)`|将属性列表输出到指定的输出流。 |


### 写配置文件 ###

|方法|描述|
|:-|:-|
|`void store(OutputStream out, String comments)`|以适合使用 load(InputStream) 方法加载到 Properties 表中的格式，将此 Properties 表中的属性列表（键和元素对）写入输出流。 |
|`void store(Writer writer, String comments)`|以适合使用 load(Reader) 方法的格式，将此 Properties 表中的属性列表（键和元素对）写入输出字符。 |
|`void storeToXML(OutputStream os, String comment)`|发出一个表示此表中包含的所有属性的 XML 文档。 |
|`void storeToXML(OutputStream os, String comment, String encoding)`|使用指定的编码发出一个表示此表中包含的所有属性的 XML 文档。 |
store()方法第一个参数表示输出流对象，第二个参数表示注释信息:
- 如果comments不为空，保存后的属性文件第一行会是#comments,表示注释信息；
- 如果为空则没有注释信息,注释信息后面是属性文件的当前保存时间信息。

## 实例 ##
### 读取一个配置 ###
我这里有一个配置文件`E:\Blog\blog5Copy\FM.properties`,内容如下:
```
# 部署网站的地址
site = https://www.lansheng.net.cn/
```
读入配置文件中site的值，如下所示:
```java
package properties.test;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
public class SiteProperties
{
    /**
     * @param filePath xxx.properties配置文件的路径
     * @return 配置文件中的site配置项，也就是网站的地址信息
     */
    public static String getSite(String filePath)
    {
        //1 实例化
        Properties properties = new Properties();
        String site = null;
        try (InputStream inputStream = new FileInputStream(filePath);)
        {
            // 2加载配置文件到Properties对象中
            properties.load(inputStream);
            // 3读取配置文件中的站点信息
            site = properties.getProperty("site");
        } catch (IOException e)
        {
            e.printStackTrace();
        }
        return site;
    }
}

```
测试:
```java
public static void main(String[] args)
{
    String filePath = "E:\\Blog\\blog5Copy\\FM.properties";
    System.out.print("网站地址:"+SiteProperties.getSite(filePath));
}
```
运行结果:
```
网站地址:https://www.lansheng.net.cn/
```
嗯，这里就读取成功了，目前暂时只需要读取功能，后面有需求了。再更新吧。
### 遍历配置文件 ###
#### SpecialWords.properties文件 ####
文件路径:`Tools/src/property/reader/SpecialWords.properties`,该文件位于Tools项目的`property.reader`包下.
```java
id=ID
MIME=M I M E
url=URL
GET=get
CRUD=C R U D
JavaEE=Java E E
SpringMVC=Spring MVC
```
#### PropertyTools.java文件 ####
文件路径:`Tools/src/property/reader/PropertyTools.java`
```java
package property.reader;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;
import res.reader.ResourceFileReader;
public class PropertyTools
{
    public static void main(String[] args)
    {
        // 1 实例化
        Properties properties = new Properties();
        // 获取当前包下的配置文件路径
        // 注意这个路径的根目录是以src目录为根目录.
        // /Tools/src/property/reader/SpecialWords.properties对应的路径为:
        // /property/reader/SpecialWords.properties,/Tools/src不需要写出来
        // 2.获取配置文件的输入流
            InputStream in = ResourceFileReader.class.getResourceAsStream(
                "/property/reader/SpecialWords.properties");
        try
        {
            // 3.加载配置文件
            properties.load(in);
        } catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // 4.获取所有key的Set集合
        Set<String> keys = properties.stringPropertyNames();
        String key;
        String value;
        // 5.遍历所有的key
        for (Iterator<String> iterator = keys.iterator(); iterator.hasNext();)
        {
            key = (String) iterator.next();
            // 取出对应key的value值
            value = properties.getProperty(key);
            System.out.println("key=" + key + ",value=" + value);
        }
    }
}
```
运行结果:
```cmd
key=GET,value=get
key=MIME,value=M I M E
key=CRUD,value=C R U D
key=JavaEE,value=Java E E
key=url,value=URL
key=SpringMVC,value=Spring MVC
key=id,value=ID
```

## 参考链接 ##
[https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Properties.html#method.summary](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Properties.html#method.summary)
[https://www.cnblogs.com/xudong-bupt/p/3758136.html](https://www.cnblogs.com/xudong-bupt/p/3758136.html)
[https://blog.csdn.net/wangdajiao/article/details/54315237](https://blog.csdn.net/wangdajiao/article/details/54315237)
[https://blog.csdn.net/i745763006/article/details/72475623](https://blog.csdn.net/i745763006/article/details/72475623)
[Java读取Properties文件的六种方法](https://blog.csdn.net/Senton/article/details/4083127)
[Java Properties 类](http://www.runoob.com/java/java-properties-class.html)
