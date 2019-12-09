---
title: C语言头文件正确写法
categories: 
  - C语言
  - 代码规范
date: 2018-11-20 18:52:35
updated: 2019-12-09 19:55:22
abbrlink: 96819592
---
<div id='my_toc'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/96819592/#一般写法">一般写法</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/96819592/#自动生成">自动生成</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/96819592/#源码">源码</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/96819592/#C语言头文件生成工具">C语言头文件生成工具</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/96819592/#参考链接">参考链接</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
## 一般写法 ##
例如这样有一根file.h头文件，一般写法如下
```c
//file.h
//条件编译
#ifndef _FILE_H_ //如果没有引入头文件file.h
    #define _FILE_H_ //那就引入头文件file.h
    //结构体和函数声明....
    
    //1 根据跟文件路径和模式获取文件指针
    FILE* getFILE(char* filePath,char* mode);
    //2 使用临时文件替换原文件
    void updateOldFileByNew(char*oldFileName,char*newFileName);
#endif
```
## 自动生成 ##
### 源码 ###
当然，手动写还是有点麻烦，所以我写了点js代码来自动生成：
```html
<html>
<head>
    <meta charset="utf-8">
    <title>变成大写</title>
<script>
    function daxie() {
        var input = document.getElementById("output");
        if (input.value == null || input.value == "") {
            alert("请先输入");
            return;
        }
        input.value = input.value.toUpperCase();//变成大写
    }
    function clean()
    {    
        document.getElementById("output").value="";
    }
    //复制方法
    function copy() {
        var in_output = document.getElementById("output");
        in_output.select(); // 选择对象
        document.execCommand("Copy"); // 执行浏览器复制命令
        if(confirm("代码已经复制到剪贴板粘贴即可"))
        {
            in_output.value="";
        }
    }
    function cyuyantouwenjianshengming() {
        var input = document.getElementById("output");
        var oldValue = input.value;
        if (oldValue == null || oldValue == "") {
            alert("请先输入头文件名(一个单词)");
            return;
        }
        var isOneWord = /^\w+$/;
        if (isOneWord.test(oldValue)) {
            var daxie = input.value.toUpperCase();//变成大写
            input.value = "//" + oldValue + ".h\n" +
                "#ifndef _" + daxie + "_H_ //如果没有引入头文件" + oldValue + ".h\n" +
                "    #define _" + daxie + "_H_ //那就引入头文件" + oldValue + ".h\n" +
                "#endif";
            copy();
        }
        else if (confirm("输入格式错误,是否清空输入框"))
            document.getElementById("output").value = "";
    }
</script>
</head>
<body>
    <textarea rows="5" id="output" style="width:99%;margin-right:auto"></textarea>
    <br>
    <input type="button" name="button1" id="button1" value="变成大写" onclick="daxie()" />
    <input type="button" name="butto2" id="button2" value="生成c语言头文件声明" onclick="cyuyantouwenjianshengming()" />
    <input type="button" name="butto2" id="button2" value="清空输入框" onclick="clean()" />
</body>
</html>
```

效果,在下面文本框中输入文件名即可生成,然后把代码粘贴到头文件`file.h`中即可。
### C语言头文件生成工具 ###
<textarea rows="5" id="output" style="width:99%;margin-right:auto"></textarea><br><input type="button" name="button1" id="button1" value="变成大写" onclick="daxie()" /><input type="button" name="button1" id="button1" value="变成小写" onclick="xiaoxie()" /><input type="button" name="butto2" id="button2" value="生成c语言头文件声明" onclick="cyuyantouwenjianshengming()" /><input type="button" name="butto2" id="button2" value="清空输入框" onclick="clean()" />

<script>
    function daxie() {
        var input = document.getElementById("output");
        if (input.value == null || input.value == "") {
            alert("请先输入");
            return;
        }
        input.value = input.value.toUpperCase();//变成大写
    }
    function xiaoxie() {
        var input = document.getElementById("output");
        if (input.value == null || input.value == "") {
            alert("请先输入");
            return;
        }
        input.value = input.value.toLowerCase();//变成小写
    }

    function clean() {
        document.getElementById("output").value = "";
    }
    //复制方法
    function copy() {
        var in_output = document.getElementById("output");
        in_output.select(); // 选择对象
        document.execCommand("Copy"); // 执行浏览器复制命令
        if (confirm("代码已经复制到剪贴板粘贴即可")) {
            in_output.value = "";
        }
    }
    function cyuyantouwenjianshengming() {
        var input = document.getElementById("output");
        var oldValue = input.value;
        if (oldValue == null || oldValue == "") {
            alert("请先输入头文件名(一个单词)");
            return;
        }
        var isOneWord = /^\w+$/;
        if (isOneWord.test(oldValue)) {
            var daxie = input.value.toUpperCase();//变成大写
            input.value = "//" + oldValue + ".h\n" +
                "#ifndef _" + daxie + "_H_ //如果没有引入头文件" + oldValue + ".h\n" +
                "    #define _" + daxie + "_H_ //那就引入头文件" + oldValue + ".h\n" +
                "#endif";
            copy();
        }
        else if (confirm("输入格式错误,是否清空输入框"))
            document.getElementById("output").value = "";
    }
</script>

## 参考链接 ##
[https://blog.csdn.net/Com_ma/article/details/78546807](https://blog.csdn.net/Com_ma/article/details/78546807)
[https://blog.csdn.net/K346K346/article/details/48877773](https://blog.csdn.net/K346K346/article/details/48877773)
[https://blog.csdn.net/wr132/article/details/65635003](https://blog.csdn.net/wr132/article/details/65635003)
[https://blog.csdn.net/abc_12366/article/details/79155540](https://blog.csdn.net/abc_12366/article/details/79155540)
[https://blog.csdn.net/wr132/article/details/65635003](https://blog.csdn.net/wr132/article/details/65635003)
[https://blog.csdn.net/wandermen/article/details/9254919](https://blog.csdn.net/wandermen/article/details/9254919)
[https://blog.csdn.net/xhbxhbsq/article/details/78955216](https://blog.csdn.net/xhbxhbsq/article/details/78955216)

>原文链接: [C语言头文件正确写法](https://lanlan2017.github.io/blog/96819592/)
