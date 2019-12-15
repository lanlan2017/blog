---
title: 我的JavaScript在线文本处理工具
categories: 
  - JavaScript
  - 在线工具
date: 2018-12-14 20:51:47
updated: 2019-12-09 19:45:23
abbrlink: 86af8ea
---
## 源码 ##
```html
<textarea rows="5" id="output" style="width:99%;margin-right:auto"></textarea>
<br>
<input type="button" value="变成大写" onclick="daxie()" />&nbsp;
<input type="button" value="变成小写" onclick="xiaoxie()" />&nbsp;
<input type="button" value="生成c语言头文件声明" onclick="cyuyantouwenjianshengming()" />&nbsp;
<input type="button" value="清空输入框" onclick="clean()" />&nbsp;
<input type="button" value="html空格转移符" onclick="HTMLSpase()">&nbsp;
<input type="button" value="转成markdown表格" onclick="mdTableCopy()">&nbsp;
<input type="button" value="正则 java多行注释" onclick="java_annotation()">&nbsp;
<script>
    function java_annotation() {
        var java_java_doc_annotation = "\\s*(?:\\/\\*{1,2}|\\*\\/|\\*)";
        var output = document.getElementById("output");
        output.value = java_java_doc_annotation;
        copy();
    }
    function mdTableCopy() {
        var input = document.getElementById("output");
        var str = input.value;
        //删除多余的空白行
        str = str.replace(/^\s*$(\n|\r\n)/mg, "");
        //在每行行首行尾添加表格分割符竖杠‘|’
        str = str.replace(/^(.+)$/mg, "|$1|");
        var result = "";
        //按行分割,因为我不知道正则匹配怎么写
        var array = str.split("\n");
        var line = "";
        var count = 0;
        for (var j = 0, length = array.length; j < length; j++) {
            line = array[j];
            count++
            //在第一行的后面添加markdown表格对齐符号
            if (count == 1) {
                // console.log("-->"+line);
                //获取列数
                var cols = line.match(/\S+/g).length;
                line = line.replace(/\s+/g, "|");
                result += line + "\n";
                //生成markdown表格对齐符号
                for (var i = 0; i < cols; i++) {
                    result += "|:---";
                }
                result += "|\n";
            }
            //行中的空白符替换为表格分割符
            line = line.replace(/\s+/g, "|");
            //
            if (j < length - 1) {
                result += line + "\n";
            }
            //最后一样不加换行符
            else {
                result += line;
            }
        }
        //写回文本域
        input.value = result;
        //复制到剪贴板
        copy();
    }
    function daxie() {
        var input = document.getElementById("output");
        if (input.value == null || input.value == "") {
            alert("请先输入");
            return;
        }
        input.value = input.value.toUpperCase();//变成大写
        copy()//复制到剪贴板中
    }
    function xiaoxie() {
        var input = document.getElementById("output");
        if (input.value == null || input.value == "") {
            alert("请先输入");
            return;
        }
        input.value = input.value.toLowerCase();//变成小写
        copy();//复制到剪贴板中
    }
    function HTMLSpase() {
        //&nbsp;
        document.getElementById("output").value = "&nbsp;";
        copy();
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
```
## 参考链接 ##