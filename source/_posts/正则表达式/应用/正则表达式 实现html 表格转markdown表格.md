---
title: 正则表达式 实现html 表格转markdown表格
categories: 
  - 正则表达式
  - 应用
date: 2018-12-17 01:40:14
updated: 2019-12-17 05:18:53
abbrlink: 211bb72a
---
<div id='my_toc'><a href="/blog/211bb72a/#抓取文章信息" class="header_2">抓取文章信息</a>&nbsp;<br><a href="/blog/211bb72a/#匹配正则" class="header_3">匹配正则</a>&nbsp;<br><a href="/blog/211bb72a/#精简表格正则##" class="header_2">精简表格正则##</a>&nbsp;<br><a href="/blog/211bb72a/#删除内嵌样式" class="header_3">删除内嵌样式</a>&nbsp;<br><a href="/blog/211bb72a/#匹配正则" class="header_4">匹配正则</a>&nbsp;<br><a href="/blog/211bb72a/#替换正则" class="header_4">替换正则</a>&nbsp;<br><a href="/blog/211bb72a/#生成分割符" class="header_3">生成分割符</a>&nbsp;<br><a href="/blog/211bb72a/#替换结果" class="header_4">替换结果</a>&nbsp;<br><a href="/blog/211bb72a/#按行分割" class="header_3">按行分割</a>&nbsp;<br><a href="/blog/211bb72a/#删除其他html多余标签行" class="header_3">删除其他html多余标签行</a>&nbsp;<br><a href="/blog/211bb72a/#生成对齐方式" class="header_3">生成对齐方式</a>&nbsp;<br><a href="/blog/211bb72a/#java代码" class="header_4">java代码</a>&nbsp;<br><a href="/blog/211bb72a/#替换结果" class="header_4">替换结果</a>&nbsp;<br><a href="/blog/211bb72a/#html-table转Markdown-Java方法" class="header_2">html table转Markdown Java方法</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 抓取文章信息 ##
### 匹配正则 ###
```
.+<div class="post-body".*?>(.+?)<\/div>.+
```
替换正则
```
$1
```
## 精简表格正则##
生成的表格如下，
```html
<table><thead><tr><th style="text-align:left">序号</th><th style="text-align:left">方法</th><th style="text-align:left">描述</th></tr></thead><tbody><tr><td style="text-align:left">1</td><td style="text-align:left">String getCharacterEncoding()</td><td style="text-align:left">返回响应用的是何种字符编码</td></tr><tr><td style="text-align:left">2</td><td style="text-align:left">void setContentType(String type)</td><td style="text-align:left">设置响应的MIME类型</td></tr><tr><td style="text-align:left">3</td><td style="text-align:left">PrintWriter getwriter()</td><td style="text-align:left">返回可以向客户端输出字符的一个输出流对象(注意比较PrintWriter与内置out对象的区别)</td></tr></tbody></table>
```
转markdown的时候样式是不需要的，先删除样式：
### 删除内嵌样式 ###
#### 匹配正则 ####
```
(<t[h|d]) style=.*?(>)
```
#### 替换正则 ####
```
$1$2
```
替换后的效果：
```
<table><thead><tr><th>序号</th><th>方法</th><th>描述</th></tr></thead><tbody><tr><td>1</td><td>String getCharacterEncoding()</td><td>返回响应用的是何种字符编码</td></tr><tr><td>2</td><td>void setContentType(String type)</td><td>设置响应的MIME类型</td></tr><tr><td>3</td><td>PrintWriter getwriter()</td><td>返回可以向客户端输出字符的一个输出流对象(注意比较PrintWriter与内置out对象的区别)</td></tr></tbody></table>
```
### 生成分割符 ###

**匹配正则:**
```
(?:<\/t[hd]><t[hd]>|<\/?t[hd]>)
```
**替换正则:**
```
|
```
#### 替换结果 ####
```
<table><thead><tr>|序号|方法|描述|</tr></thead><tbody><tr>|1|String getCharacterEncoding()|返回响应用的是何种字符编码|</tr><tr>|2|void setContentType(String type)|设置响应的MIME类型|</tr><tr>|3|PrintWriter getwriter()|返回可以向客户端输出字符的一个输出流对象(注意比较PrintWriter与内置out对象的区别)|</tr></tbody></table>
```
### 按行分割 ###
**匹配正则:**`<tr>(.+?)</tr>`
**替换正则:**`$1\n`
**替换结果:**
```
<table><thead>|序号|方法|描述|
</thead><tbody>|1|String getCharacterEncoding()|返回响应用的是何种字符编码|
|2|void setContentType(String type)|设置响应的MIME类型|
|3|PrintWriter getwriter()|返回可以向客户端输出字符的一个输出流对象(注意比较PrintWriter与内置out对象的区别)|
</tbody></table>
```

### 删除其他html多余标签行 ###
**匹配正则:**
```
<\/?(?:table|thead|tbody)>
```
**替换正则:**空字符串`""`
**替换结果:**
```
|序号|方法|描述|
|1|String getCharacterEncoding()|返回响应用的是何种字符编码|
|2|void setContentType(String type)|设置响应的MIME类型|
|3|PrintWriter getwriter()|返回可以向客户端输出字符的一个输出流对象(注意比较PrintWriter与内置out对象的区别)|

```

### 生成对齐方式 ###
剩下的就交给java来解决吧。一行一行的遍历这个字符串，**在第二行的时候，把里面的文本替换成对齐方式即可**。
**匹配正则** 
```
[^|]+\|
```
**替换正则**
对齐方式，这里默认为左对齐
```
:--|
```
#### java代码 ####
要想单纯的替换第二行，首先要知道现在匹配的是第几次，这里我通过使用计数器来实现。
匹配到第二次的时候，我先获取匹配的文本，然后对修改该文生成一个新的文本(对齐方式)。
接下来就是要使用新的文本替换字符串中旧的文本了，这里使用`Matcher.appendReplacement(StringBuffer sb, String replacement)`这个方法，这个方法可以在匹配过程中动态的替换，但是与其他替换方法不同，其他替换方法会把替换的结果直接返回，但appendReplacement方法替换后的结果会放在sb参数中。还有就是appendReplacement方法只会把扫描过的文本放到sb中，没有扫描的文本它不管，使用`Matcher.appendTail(StringBuffer sb)`可以把没有扫描过的文本追加到sb中。这样才真正做到动态的替换。
代码如下：
```java
StringBuffer sb = new StringBuffer();
int count = 0;
Pattern alignPattern = Pattern.compile("(\\|(?:.+?\\|)+\\n)");
Matcher alignMatcher = alignPattern.matcher(htmlTable);
while (alignMatcher.find())
{
    count++;
    if (count == 2)
    {
        // 获取匹配的文本
        String align = alignMatcher.group();
        // 生成替换的文本
        align = align.replaceAll("[^|]+\\|", ":--|");;
        // 使用新的替换旧的 然后处理过的文本放到缓存中
        alignMatcher.appendReplacement(sb, align);
        // 没有扫描过的文本放到缓存中
        alignMatcher.appendTail(sb);
        break;
    }
}

```
#### 替换结果 ####
```
|序号|方法|描述|
|:--|:--|:--|
|1|String getCharacterEncoding()|返回响应用的是何种字符编码|
|2|void setContentType(String type)|设置响应的MIME类型|
|3|PrintWriter getwriter()|返回可以向客户端输出字符的一个输出流对象(注意比较PrintWriter与内置out对象的区别)|
```
这样就得到了markdown表格了，显示效果如下：

|序号|方法|描述|
|:--|:--|:--|
|1|String getCharacterEncoding()|返回响应用的是何种字符编码|
|2|void setContentType(String type)|设置响应的MIME类型|
|3|PrintWriter getwriter()|返回可以向客户端输出字符的一个输出流对象(注意比较PrintWriter与内置out对象的区别)|

## html table转Markdown Java方法 ##
```java
public static String table2Markdown(String htmlTable)
{
    StringBuilder temp = new StringBuilder(htmlTable);
    htmlTable = htmlTable
            .replaceAll("(<t(?:h|d)) style=\"text\\-align:.*?(>)", "$1$2");
    htmlTable = htmlTable.replaceAll(
            "(?:<\\/?t(?:h|d)>\\n\\s+<\\/?t(?:h|d)>|<\\/?t(?:h|d)>)", "|");
    htmlTable = htmlTable.replaceAll("<\\/?t(?:able|body|r)>", "");
    htmlTable = htmlTable.replaceAll("^\\s*<\\/?t(?:able|body|r)>$", "");
    htmlTable = htmlTable.replaceAll("(?m)^\\s*$(?:\\n|\\r\\n)+", "");
    htmlTable = htmlTable.replaceAll("(?m)^\\s{2,}", "");
    htmlTable = htmlTable
            .replaceAll("<thead>\\n?((?:\\|.*)|)\\n?<\\/thead>", "$1\n$1");
    StringBuffer sb = new StringBuffer();
    int count = 0;
    Pattern alignPattern = Pattern.compile("(\\|(?:.+?\\|)+\\n)");
    Matcher alignMatcher = alignPattern.matcher(htmlTable);
    while (alignMatcher.find())
    {
        count++;
        if (count == 2)
        {
            // 获取匹配的文本
            String align = alignMatcher.group();
            // 生成替换的文本
            align = align.replaceAll("[^|]+\\|", ":--|");;
            // 使用新的替换旧的 然后处理过的文本放到缓存中
            alignMatcher.appendReplacement(sb, align);
            // 没有扫描过的文本放到缓存中
            alignMatcher.appendTail(sb);
            break;
        }
    }
    return sb.toString();
}
```
