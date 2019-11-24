---
title: html自动生成锚点
categories: 
  - HTML
  - 超链接
date: 2019-02-13 00:22:04
updated: 2019-11-14 11:39:27
abbrlink: b4a0eaf6
---
<div id='my_toc'>

- [根据ID属性跳转的锚点](/blog/b4a0eaf6/#根据ID属性跳转的锚点)
- [自动生成](/blog/b4a0eaf6/#自动生成)
    - [Java实现](/blog/b4a0eaf6/#Java实现)
    - [javascript实现](/blog/b4a0eaf6/#javascript实现)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
这里介绍使用id属性来设置锚点，并通过代码自动生成ID唯一的锚点。
## 根据ID属性跳转的锚点 ##
html代码如下:
```html
<a href="#AnchorPointID20181122184951">跳转到xxx</a>
<a id="AnchorPointID20181122184951"></a>
```
测试代码：
```html
<html>
<head>
	<meta charset="utf-8">
	<title>测试锚点</title>
</head>
<body>
	<a href="#AnchorPointID20181122184951">2</a>
	<script>
		for (var i = 0; i < 60; i++) {
			document.writeln("<br>");
		}
	</script>
	<a id="AnchorPointID20181122184951">1</a>
</body>
</html>
```
## 自动生成 ##
上面的id是用代码自动生成的，因为id属性要求唯一，我总不能每次都想一个名字吧。
### Java实现 ###
#### 生成唯一的数字串工具类 ####
这里使用格式化时间字符串来生成的，代码如下,打包成一个类是为了后面使用。
```java
package unique.id;
import java.text.SimpleDateFormat;
import java.util.Date;
public class UniqueIDString
{
	/**
	 * 根据时间生成一个精确到秒数的唯一的ID字符串。
	 * 时间一直往前走不可能有完全一样的时间点。
	 * @return
	 */
	public static String createUniqueID()
	{
		Date date=new Date();
		SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
		return format.format(date);
	}
}
```
#### 生成唯一锚点Java类 ####
这个代码也很简单粗暴，直接通过字符串拼接即可。
```java
package anchor.point;
import unique.id.UniqueIDString;
public class AnchorPoint
{
	public static void main(String[] args)
	{
		System.out.println(anchorPoint());
	}
	/**
	 * 生成根据id属性跳转的html锚点标签对。
	 * @return
	 */
	public static String anchorPoint()
	{
		//根据时间生成一个唯一的id
		String id="AnchorPointID"+UniqueIDString.createUniqueID();
		String anchorLink="<a href=\"#"+id+"\"></a>\n";
		String anchorHTMLTag="<a id=\""+id+"\"></a>";
		return anchorLink+anchorHTMLTag;
	}
	/**
	 * 生成根据id属性跳转的html锚点标签对，并指定超链接中的文本
	 * @return
	 */
	public static String anchorPoint(String text)
	{
		if(text==null)
		{
			return anchorPoint();
		}
		//根据时间生成一个唯一的id
		String id="AnchorPointID"+UniqueIDString.createUniqueID();
		String anchorLink="<a href=\"#"+id+"\">"+text+"</a>\n";
		String anchorHTMLTag="<a id=\""+id+"\"></a>";
		return anchorLink+anchorHTMLTag;
	}
}
```
### javascript实现 ###
也是很粗暴的代码
#### js 生成格式化字符串 ####
```javascript
function uniqueIdByFormatDate(date1) {
	var str = "";
	var year = date1.getFullYear();
	str += year;
	var month = date1.getMonth() + 1;//0-11
	if (month < 10)
		str += "0";
	str += month;
	var date = date1.getDate();//1-31
	if (date < 10)
		str += "0";
	str += date;
	var hour = date1.getHours() + 1;//0-59
	if (hour < 10)
		str += "0";
	str += hour;
	var moinute = date1.getMinutes() + 1;//0-59
	if (moinute < 10)
		str += "0";
	str += moinute;
	var second = date1.getSeconds() + 1;//0-59
	if (second < 10)
		str += "0";
	str += second;
//	console.log(str);
	return str;
}
```
#### 拼接成html锚点链接 ####
```javascript
function uniqueAnchorTags(text) {
	var date1 = new Date();
	var id = "AnchorIdPointID" + uniqueIdByFormatDate(date1);
	var anchorlink;
	if (text == null) {
		anchorlink = '<a href="#' + id + '></a>\n';
	}
	else {
		anchorlink = '<a href="#' + id + '>' + text + '</a>\n';
	}
	var anchorTag = '<a id="' + id + '></a>';
	console.log(anchorlink + anchorTag);
	return anchorlink + anchorTag;
}
```
最后添加上文本框，按钮
```html
<textarea name="in_output" id="in_output" cols="100" rows="10"></textarea><br>
<input type="button" name="button1" id="button1" value="生成唯一锚点" onclick="output();">
```
以及事件处理函数，就可用了。
```javascript
function output() {
	var in_output = document.getElementById("in_output");
	if (in_output.value == null) {
		in_output.value = uniqueAnchorTags(null);
	}
	else {
		in_output.value = uniqueAnchorTags(in_output.value);
	}
	console.log(in_output.value);
}
```
使用javascript的好处就是它可以在浏览器上运行，这样比较方便演示，效果如下:

<textarea name="in_output" id="in_output" style="width: 100%;overflow: auto;" rows="4"></textarea><br><input type="button" name="button1" id="button1" value="生成唯一锚点" onclick="output();">
<script>
	function uniqueIdByFormatDate(date1) {
		var str = "";
		var year = date1.getFullYear();
		str += year;
		var month = date1.getMonth() + 1;//0-11
		if (month < 10)
			str += "0";
		str += month;
		var date = date1.getDate();//1-31
		if (date < 10)
			str += "0";
		str += date;
		var hour = date1.getHours() + 1;//0-59
		if (hour < 10)
			str += "0";
		str += hour;
		var moinute = date1.getMinutes() + 1;//0-59
		if (moinute < 10)
			str += "0";
		str += moinute;
		var second = date1.getSeconds() + 1;//0-59
		if (second < 10)
			str += "0";
		str += second;
		// console.log(str);
		return str;
	}
	function uniqueAnchorTags(text) {
		var date1 = new Date();
		var id = "AnchorIdPointID" + uniqueIdByFormatDate(date1);
		var anchorlink;
		if (text == null) {
			anchorlink = '<a href="#' + id + '></a>\n';
		}
		else {
			anchorlink = '<a href="#' + id + '>' + text + '</a>\n';
		}
		var anchorTag = '<a id="' + id + '></a>';
		// console.log(anchorlink + anchorTag);
		return anchorlink + anchorTag;
	}
	function output() {
		var in_output = document.getElementById("in_output");
		if (in_output.value == null) {
			in_output.value = uniqueAnchorTags(null);
		}
		else {
			in_output.value = uniqueAnchorTags(in_output.value);
		}
		// console.log(in_output.value);
	}
</script>

>原文链接: [html自动生成锚点](https://lanlan2017.github.io/blog/b4a0eaf6/)
