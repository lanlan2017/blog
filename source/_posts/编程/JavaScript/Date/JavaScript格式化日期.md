---
title: JavaScript格式化日期
categories: 
  - JavaScript
  - Date
abbrlink: cff504bd
date: 2021-03-21 10:59:52
updated: 2022-04-04 00:51:45
---
# JavaScript格式化日期
```javascript
Date.prototype.formatDate = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1,                   //月份
        "d+": this.getDate(),                        //日
        "h+": this.getHours(),                       //小时
        "m+": this.getMinutes(),                     //分
        "s+": this.getSeconds(),                     //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds()                  //毫秒
    };
    //  获取年份 
    // ①
    if (/(y+)/i.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }

    for (var k in o) {
        // ②
        if (new RegExp("(" + k + ")", "i").test(fmt)) {
            fmt = fmt.replace(
                RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
}
// var now = new Date();
// console.log(now.format("YYYY-MM-DD"));    // 2021-01-11
// console.log(now.format("yyyy年MM月dd日"));
// console.log(now.format("MM/dd/yyyy"));
// console.log(now.format("yyyyMMdd"));
// console.log(now.format("yyyy-MM-dd hh:mm:ss"));
```
# 演示

<input type="text" id="formateDateInput" /><button onclick="formatDateShow()">显示日期</button>
<script>
    Date.prototype.formatDate = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,                   //月份
            "d+": this.getDate(),                        //日
            "h+": this.getHours(),                       //小时
            "m+": this.getMinutes(),                     //分
            "s+": this.getSeconds(),                     //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds()                  //毫秒
        };
        if (/(y+)/i.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")", "i").test(fmt)) {
                fmt = fmt.replace(
                    RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }
        return fmt;
    }
    function formatDateShow() {
        var input = document.getElementById("formateDateInput");
        input.value = new Date().formatDate("yyyy年MM月dd日");
    }
</script>
