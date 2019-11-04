---
title: markdown语法 待办事项
categories: 
  - 其他
  - markdown使用
  - markdown语法
date: 2018-10-21 10:01:08
updated: 2019-10-30 13:53:55
abbrlink: 8859faa9
---
- [Markdown待办事项语法](/blog/html/8859faa9/#Markdown待办事项语法)
- [MarkdownPad2 中支持待办事项](/blog/html/8859faa9/#MarkdownPad2-中支持待办事项)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
## Markdown待办事项语法 ##
不是所有的markdown都支持待办事项的，语法：**横框+ 空格+方括号（方括号中必须有空格或者x） + 空格+ 文本**。例如：
```
- [x] test
- [ ] test2
- [ ] test4
```
已经完成的事项，在中括号中写入英文`x`,未完成的事项在中括号中的写入空格,显示效果：

- [x] 已经完成的事项
- [ ] 未完成的事项

## MarkdownPad2 中支持待办事项 ##
点击左下角的`M图标`切换CSS模式，选择`GitHub Flavored Markdown (Offline)`。这样导出的html就支持待办事项了。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/markdown/undo/markdownPad2_css_settings.png)
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/markdown/undo/markdownPad2_Undo_settings.png)
再按下`ctrl+shift+1`导出为html，就可查看效果了：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/markdown/undo/markdownPad2_Undo_show.png)

>原文链接: [markdown语法 待办事项](https://lanlan2017.github.io/blog/8859faa9/)
