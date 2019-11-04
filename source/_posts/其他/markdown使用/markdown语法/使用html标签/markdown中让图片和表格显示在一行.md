---
title: markdown中让图片和表格显示在一行
categories: 
  - 其他
  - markdown使用
  - markdown语法
  - 使用html标签
date: 2018-10-29 18:26:12
updated: 2019-10-30 13:53:55
abbrlink: f0d2185d
---
- [问题描述](/blog/html/f0d2185d/#问题描述)
- [效果](/blog/html/f0d2185d/#效果)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## 问题描述 ##
原本的markdown表格语法是没有这个功能的,只能通过html代码来实现,在表格和图片外面再套上一个表格，外表格的第一个单元格放内表格，第二个单元格中放图片标签。这样图片和内表格就能显示在一行中了。具体html代码如下：
```html
<table>
    <tr>
        <td width="80%">
            <table>
                <tr>
                    <td align="right">姓名</td>
                    <td align="left">xxx</td>
                </tr>
                <tr>
                    <td align="right">性别</td>
                    <td align="left">xxx</td>
                </tr>
                <tr>
                    <td align="right">电话</td>
                    <td align="left">xxxx</td>
                </tr>
                <tr>
                    <td align="right">邮箱</td>
                    <td align="left">xxxxxxx@xxx</td>
                </tr>
            </table>
        </td>
        <td width="20%" height="100%">
            <img src="url" alt="我的照片" />
        </td>
    </tr>
</table>
```
还有就是markdown中html表格标签中不要有换行符，显示的时候回出现好多空白行。删除上面的表格标签中的空白符后显示自效果如下：
## 效果 ##
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/findjob/table_img_insameline.png)

>原文链接: [markdown中让图片和表格显示在一行](https://lanlan2017.github.io/blog/f0d2185d/)
