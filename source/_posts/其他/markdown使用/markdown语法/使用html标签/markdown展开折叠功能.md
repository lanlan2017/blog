---
title: markdown展开折叠功能
categories: 
  - 其他
  - markdown使用
  - markdown语法
  - 使用html标签
date: 2019-11-08 21:30:04
updated: 2019-11-25 00:23:45
abbrlink: ce247608
---
<div id='my_toc'>

- [HTML 5 **<details> **标签](/blog/ce247608/#HTML-5-<details>-标签)
    - [**<summary> **子标签](/blog/ce247608/#<summary>-子标签)
- [markdown中可以写HTML](/blog/ce247608/#markdown中可以写HTML)
    - [折叠的内容是可以Markdown](/blog/ce247608/#折叠的内容是可以Markdown)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

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
