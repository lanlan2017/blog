---
title: markdown表格支持单元格合并
categories: 
  - 其他
  - markdown使用
  - markdown语法
  - 使用html标签
date: 2018-08-15 23:11:20
updated: 2019-11-04 17:02:02
abbrlink: 9d21d6ad
---
- [问题描述](/blog/9d21d6ad/#问题描述)
- [效果](/blog/9d21d6ad/#效果)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## 问题描述 ##
MarkDown语法并不支持表格单元格合并，不过可以插入html表格标签来实现。
```
<table>
	<tr>
		<th>序号
		</td>
		<th>OSI的体系结构
		</td>
		<th>TCP/IP的体系结构
		</td>
	</tr>
	<tr>
		<td>7</td>
		<td>应用层</td>
		<td rowspan="3">应用层 (各种应用层协议如 TELNET, FTP, SMTP 等)</td>
	</tr>
	<tr>
		<td>6</td>
		<td>表示层</td>
	</tr>
	<tr>
		<td>5</td>
		<td>会话层</td>
	</tr>
	<tr>
		<td>4</td>
		<td>传输层</td>
		<td>传输层</td>
	</tr>
	<tr>
		<td>3</td>
		<td>网络层</td>
		<td>互连网络层</td>
	</tr>
	<tr>
		<td>2</td>
		<td>数据链路层</td>
		<td rowspan="2">网络接入层</td>
	</tr>
	<tr>
		<td>1</td>
		<td>物理层</td>
	</tr>
</table>

```
## 效果 ##
<table>
	<tr>
		<th>序号
		</th>
		<th>OSI的体系结构
		</th>
		<th>TCP/IP的体系结构
		</th>
	</tr>
	<tr>
		<td>7</td>
		<td>应用层</td>
		<td rowspan="3">应用层 (各种应用层协议如 TELNET, FTP, SMTP 等)</td>
	</tr>
	<tr>
		<td>6</td>
		<td>表示层</td>
	</tr>
	<tr>
		<td>5</td>
		<td>会话层</td>
	</tr>
	<tr>
		<td>4</td>
		<td>传输层</td>
		<td>传输层</td>
	</tr>
	<tr>
		<td>3</td>
		<td>网络层</td>
		<td>互连网络层</td>
	</tr>
	<tr>
		<td>2</td>
		<td>数据链路层</td>
		<td rowspan="2">网络接入层</td>
	</tr>
	<tr>
		<td>1</td>
		<td>物理层</td>
	</tr>
</table>
是不是看起很奇怪，表格跟上面的文字隔了这么多行这是`<table></table>`标签之间有回车符造成的,删除这些回车符，这样就显示正常了，不过这样的坏处就是看起来很凌乱不好修改。
当然要是自己一行一行的删的话那得删到什么时候，最好使用正则表达式进行删除。我这里用的editplus这个编辑器。
把上面的代码粘贴到文件找那个，然后打开替换,使用正则表达式`\n\s+`进行替换即可。
![](https://i.imgur.com/SeKfPU3.png)
点击Find按钮可以看到匹配的结果。
![](https://i.imgur.com/A9GkZ8h.png)
可以看到已经匹配到换行符合多余的空格了，点击ReplaceAll按钮全部替换即可。
替换后的效果为：
![](https://i.imgur.com/bGCze8K.png)
替换后的标签为：
```
<table><tr><th>序号</th><th>OSI的体系结构</th> <th>TCP/IP的体系结构</th></tr><tr><td>7</td><td>应用层</td><td rowspan="3">应用层  (各种应用层协议如 TELNET, FTP, SMTP 等)</td></tr><tr><td>6</td><td>表示层</td> </tr><tr><td>5</td><td>会话层</td> </tr><tr><td>4</td> <td>传输层</td>
<td>传输层</td></tr><tr><td>3</td><td>网络层</td><td>互连网络层</td></tr><tr><td>2</td><td>数据链路层</td><td rowspan="2">网络接入层</td> </tr><tr><td>1</td> <td>物理层</td></tr></table> 
```
显示效果：<table><tr><th>序号</th><th>OSI的体系结构</th> <th>TCP/IP的体系结构</th></tr><tr><td>7</td><td>应用层</td><td rowspan="3">应用层  (各种应用层协议如 TELNET, FTP, SMTP 等)</td></tr><tr><td>6</td><td>表示层</td> </tr><tr><td>5</td><td>会话层</td> </tr><tr><td>4</td> <td>传输层</td>
<td>传输层</td></tr><tr><td>3</td><td>网络层</td><td>互连网络层</td></tr><tr><td>2</td><td>数据链路层</td><td rowspan="2">网络接入层</td> </tr><tr><td>1</td> <td>物理层</td></tr></table> 



>原文链接: [markdown表格支持单元格合并](https://lanlan2017.github.io/blog/9d21d6ad/)
