---
title: markdown表格支持单元格合并
categories: 
  - 其他
  - Markdown
  - 语法
  - 直接使用HTML
date: 2018-08-15 23:11:20
updated: 2019-12-17 05:17:09
abbrlink: 9d21d6ad
---
<div id='my_toc'><a href="/blog/9d21d6ad/#问题描述" class="header_2">问题描述</a><br><a href="/blog/9d21d6ad/#效果" class="header_2">效果</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

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


