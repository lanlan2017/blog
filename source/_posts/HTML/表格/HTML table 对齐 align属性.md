---
title: HTML table 对齐 align属性
categories: 
  - HTML
  - 表格
date: 2019-03-28 14:47:35
updated: 2019-11-05 10:32:10
abbrlink: aa51abd2
---
- [HTML 表格对齐方式](/blog/aa51abd2/#HTML-表格对齐方式)
- [参考链接](/blog/aa51abd2/#参考链接)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## HTML 表格对齐方式 ##
`align `属性规定表格相对于周围元素的对齐方式。这个东西有时候会忘掉.还是记录一下,以便下次查找.
```html
<table>
    <tbody>
        <tr>
            <td align="right">host:</td>
            <td>localhost:8080</td>
        </tr>
        <tr>
            <td align="right">user-agent:</td>
            <td>Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0</td>
        </tr>
        <tr>
            <td align="right">accept:</td>
            <td>text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8</td>
        </tr>
        <tr>
            <td align="right">accept-language:</td>
            <td>zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2</td>
        </tr>
        <tr>
            <td align="right">accept-encoding:</td>
            <td>gzip, deflate</td>
        </tr>
        <tr>
            <td align="right">dnt:</td>
            <td>1</td>
        </tr>
        <tr>
            <td align="right">connection:</td>
            <td>keep-alive</td>
        </tr>
        <tr>
            <td align="right">cookie:</td>
            <td>JSESSIONID=440BFA3EA210ECE5A1C1F5A040C52046</td>
        </tr>
        <tr>
            <td align="right">upgrade-insecure-requests:</td>
            <td>1</td>
        </tr>
        <tr>
            <td align="right">cache-control:</td>
            <td>max-age=0</td>
        </tr>
    </tbody>
</table>
```
显示效果:

<table><tbody><tr><td align="right">host:</td><td>localhost:8080</td></tr><tr><td align="right">user-agent:</td><td>Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:66.0) Gecko/20100101 Firefox/66.0</td></tr><tr><td align="right">accept:</td><td>text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8</td></tr><tr><td align="right">accept-language:</td><td>zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2</td></tr><tr><td align="right">accept-encoding:</td><td>gzip, deflate</td></tr><tr><td align="right">dnt:</td><td>1</td></tr><tr><td align="right">connection:</td><td>keep-alive</td></tr><tr><td align="right">cookie:</td><td>JSESSIONID=440BFA3EA210ECE5A1C1F5A040C52046</td></tr><tr><td align="right">upgrade-insecure-requests:</td><td>1</td></tr><tr><td align="right">cache-control:</td><td>max-age=0</td></tr></tbody></table>

## 参考链接 ##
[http://www.w3school.com.cn/tags/att_table_align.asp](http://www.w3school.com.cn/tags/att_table_align.asp)
>原文链接: [HTML table 对齐 align属性](https://lanlan2017.github.io/blog/aa51abd2/)
