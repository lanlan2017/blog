---
title: java读取src目录下的文件2
categories:
  - 编程
  - Java
  - 反射
abbrlink: 4de14eef
date: 2021-03-29 07:56:21
updated: 2021-03-29 09:44:37
---
<div id='my_toc'><a href="/blog/null/#项目结构" class="header_1">项目结构</a>&nbsp;<br><a href="/blog/null/#Test-java读取toMdTable-html文件内容" class="header_1">Test.java读取toMdTable.html文件内容</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 项目结构
```
E:\dev2\idea_workspace\MyJavaTools\Commands
├─Commands.iml
├─META-INF\
│ └─MANIFEST.MF
├─resource\
└─src\
  ├─main\
  │ └─Test.java
  └─tools\
    ├─html\
    │ ├─HtmlTools.java
    │ └─toMdTable.html
    └─string\
      └─StringReplace.java
```
# Test.java读取toMdTable.html文件内容
现在在Test.java中，读取toMdTable.html文件中的内容：
```java
public class Test {
    public static void main(String[] args) {
        html2MdTable();
    }
    public static void html2MdTable() {
        Scanner scanner = new Scanner(Test.class.getResourceAsStream("/tools/html/toMdTable.html"));
        //Scanner scanner = new Scanner(Test.class.getResourceAsStream("toMdTable.html"));
        while(scanner.hasNextLine()){
            System.out.println(scanner.nextLine());
        }

    }
}
```
这里获取toMdTable.html文件的输入流的方法为：
```java
Test.class.getResourceAsStream("/tools/html/toMdTable.html")
```
路径为：
```
/tools/html/toMdTable.html
```
这个路径由，两部分组成：
- 第一部分是 反斜杠`/`，反斜杠表示的是项目的路径。
- 第二部分是 `tools/html/toMdTable.html`，这个路径是**文件相对于src目录的路径**

如果不加根路径，则会读取失败，也就是说如下的写法是错误的。
```java
Test.class.getResourceAsStream("tools/html/toMdTable.html")
```
如果只写文件名，也是不能加载的，也就是如下写法是错误的：
```java
Test.class.getResourceAsStream("toMdTable.html")
```
还有就是不要把文件放到src/main目录下，main目录下的文件是不能用这种方法来读取的
