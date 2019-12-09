---
title: 根据时间生成唯一的html ID属性
categories: 
  - JavaScript
  - Date
date: 2018-12-08 00:16:53
updated: 2019-12-09 19:45:22
abbrlink: e23c09a2
---
```html
<textarea name="output" id="output20181126110146" rows="5" style="width:100%"></textarea>
<input type="button" value="生成唯一化ID" onclick="setOutput()"/>&nbsp;<input type="button" value="生成唯一ID和对应设置方法" onclick="setOutIdFuntion()">
<script>
    function setOutput()
    {
        document.getElementById("output20181126110146").value="id=\""+uniqueIdByFormatDate()+"\"";
        //复制到剪贴板中
        copy();
    }
    function setOutIdFuntion()
    {
        var id=uniqueIdByFormatDate();
        document.getElementById("output20181126110146").value="// id=\""+id+"\""+
        " onclick=\"setID"+id+"()\""
        +"\nfunction setID"+id+"()\n{"+"\nvar id=document.getElementById(\""+id+"\");"+"\n}";
        //复制到剪贴板中
        copy();
    }
    //复制方法
    function copy() {
        var output = document.getElementById("output20181126110146");
        output.select(); // 选择对象
        document.execCommand("Copy"); // 执行浏览器复制命令
        if(confirm("代码已经复制到剪贴板粘贴即可"))
        {
            output.value="";
        }
    }
    function uniqueIdByFormatDate() {
        var date1=new Date();
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
        //    console.log(str);
        return str;
    }
</script>
```


>原文链接: [根据时间生成唯一的html ID属性](https://lanlan2017.github.io/blog/e23c09a2/)
