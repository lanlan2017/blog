---
title: markdown展开折叠功能
categories: 
  - 其他
  - Markdown
  - 语法
  - 直接使用HTML
date: 2019-11-08 21:30:04
updated: 2019-12-15 10:01:44
abbrlink: ce247608
---
<div id='my_toc'><a href="/blog/ce247608/#HTML-5-<details>-标签" class="header_1">HTML 5 `<details> `标签</a><br><a href="/blog/ce247608/#-<summary>-子标签" class="header_2">`<summary> `子标签</a><br><a href="/blog/ce247608/#markdown中可以写HTML" class="header_1">markdown中可以写HTML</a><br><a href="/blog/ce247608/#折叠的内容是可以Markdown" class="header_2">折叠的内容是可以Markdown</a><br></div>
<style>
    .header_1{
        margin-left: 1em;
    }
    .header_2{
        margin-left: 2em;
    }
    .header_3{
        margin-left: 3em;
    }
    .header_4{
        margin-left: 4em;
    }
    .header_5{
        margin-left: 5em;
    }
    .header_6{
        margin-left: 6em;
    }
</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
# HTML 5 `<details> `标签
定义和用法
`<details> `标签用于描述文档或文档某个部分的细节。
## `<summary> `子标签
<summary> 标签可以为 details 定义标题。标题是可见的，**用户点击标题时，会显示出 details**。

# markdown中可以写HTML
使用如下HTML标签可以实现展开折叠功能
```html
<details><summary>展开/收起</summary>
被折叠的内容
</details>
```
<details><summary>展开/收起</summary>
被折叠的内容
</details>

## 折叠的内容是可以Markdown
显示效果如下
<details markdown='1'><summary>展开/收起</summary>
```java
private Formatter formatter;
......
public Console format(String fmt, Object ...args) 
{
    formatter.format(fmt, args).flush();
    return this;
}
```
</details>
