---
title: JavaScript计算两个日期之间相差的天数
categories: 
  - JavaScript
  - Date
abbrlink: b57484e
date: 2018-11-24 14:03:53
updated: 2022-04-04 00:51:45
---
# 算法描述
求出两个日期之间相差的毫秒数,然后除以一天的毫秒数即得到两个日期之间相差的天数。
# 方法
## js求两个日期之间相隔天数的方法 字符串参数
```javascript
//date1和date2是2006-12-18格式 
function daysDistance(date1, date2) {     
    var distance,
        tempDate,
        daysApart;
    date1 = Date.parse(date1);
    date2 = Date.parse(date2);
    //计算两个日期之间相差的毫秒数
    distance = date2 - date1;
    //取绝对值
    distance = Math.abs(distance);
    //毫秒数除以一天的毫秒数,就的到了天数
    distance = Math.floor(distance / (24 * 3600 * 1000));
    return distance;
};
```
## js获取当日的格式化时间
```javascript
//获取今天的格式化日期
function today()
{
    var today=new Date();
    var str="";
    str+=today.getFullYear()+"-";
    var month=today.getMonth()+1;//返回值是 0（一月） 到 11（十二月） 之间的一个整数。
    if(month<10)
        str+="0";
    str+=month+"-";
    var day=today.getDate();//返回值是 1 ~ 31 之间的一个整数
    if(day<10)
        str+="0";
    str+=day;
    return str;
}
```
# 实例
```html
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <script> //两个时间相差天数 兼容firefox chrome
        //date1和date2是2006-12-18格式 
        function daysDistance(date1, date2) {
            var distance,
                tempDate,
                daysApart;
            date1 = Date.parse(date1);
            date2 = Date.parse(date2);
            //计算两个日期之间相差的毫秒数
            distance = date2 - date1;
            //取绝对值
            daysApart = Math.abs(distance);
            //毫秒数除以一天的毫秒数,就的到了天数
            daysApart = Math.floor(distance / (24 * 3600 * 1000));
            return daysApart;
        };
        //获取今天的格式化日期
        function today() {
            var today = new Date();
            var str = "";
            str += today.getFullYear() + "-";
            var month = today.getMonth() + 1;//返回值是 0（一月） 到 11（十二月） 之间的一个整数。
            if (month < 10)
                str += "0";
            str += month + "-";
            var day = today.getDate();//返回值是 1 ~ 31 之间的一个整数
            if (day < 10)
                str += "0";
            str += day;
            return str;
        }
        //
        function show() {
            document.getElementById("in_output").innerText = "今天" + today() + "到2017-3-1共计:" + daysDistance("2017-3-1", today()) + "天";
        }
    </script>
</head>
<body>
    <span id="in_output"></span>
    <input type="button" onclick="show()" value="显示今日到2017-3-1间隔的天数">
</body>
</html>
```
显示效果:

<input type="button" onclick="show()" value="显示今日到2017-3-1间隔的天数:"><span id="in_output"></span>
<script>
    //date1和date2是2006-12-18格式 
    function daysDistance(date1, date2) {
        var distance,
            tempDate,
            daysApart;
        date1 = Date.parse(date1);
        date2 = Date.parse(date2);
        //计算两个日期之间相差的毫秒数
        distance = date2 - date1;
        //取绝对值
        daysApart = Math.abs(distance);
        //毫秒数除以一天的毫秒数,就的到了天数
        daysApart = Math.floor(distance / (24 * 3600 * 1000));
        return daysApart;
    };
    //获取今天的格式化日期
    function today() {
        var today = new Date();
        var str = "";
        str += today.getFullYear() + "-";
        var month = today.getMonth() + 1;//返回值是 0（一月） 到 11（十二月） 之间的一个整数。
        if (month < 10)
            str += "0";
        str += month + "-";
        var day = today.getDate();//返回值是 1 ~ 31 之间的一个整数
        if (day < 10)
            str += "0";
        str += day;
        return str;
    }
    //
    function show() {
        document.getElementById("in_output").innerText = "今天" + today() + "到2017-3-1共计:" + daysDistance("2017-3-1", today()) + "天";
    }
</script>
