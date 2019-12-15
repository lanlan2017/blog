---
title: 正则表达式 实现html 超链接 图片转markdown
categories: 
  - 正则表达式
  - 应用
date: 2018-12-17 01:40:26
updated: 2019-12-09 19:45:24
abbrlink: f279d8a6
---
## html超链接 a 转markdown ##
超链接如下所示
```
<a href="https://www.jb51.net/article/107218.htm" target="_blank" rel="noopener">response.setHeader各种用法详解</a>
<a href="/blog/e6671f57/#response内置对象简介">response内置对象简介</a>
```
对应的markdown超链接如下所示：
```
[response内置对象简介](/blog/e6671f57/#response内置对象简介)
```

超链接转markdown比较简单，使用一次正则表达式替换就行了。
**匹配正则：**`<a href="(.+?)".*?>(.+?)<\/a>`
**替换正则:**`[$2]($1)`

## html图片 img 转markdown ##
```html
<img src="https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/chongdingxiang_zhuanfa/login.png" alt="显示文本">
```
对应的markdown链接图片链接为:
```
![显示文本](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/JSP/innerClass/chongdingxiang_zhuanfa/login.png)
```
图片与超链接类似,也是一次正则表达式替换就可以搞定：
**匹配正则:**`<img\s*src="(.+?)"\s*alt="(.*?)">`
**替换正则:**`![$2]($1)`

## 代码段 code 转markdown ##
代码段如下所示:
```html
<code>request.getRequestDispatcher(&quot;转发的页面&quot;).forward(request,response);</code>
```
**匹配正则:**`<\/?code>`
**替换正则:**
```
`
```

### 逆转义 ###
代码段中会把双引号等特殊字符转义，所以还需要逆转义才能得到真正的markdown代码段：



## html加粗 转 markdown ##
**匹配正则:**`<\/?strong>`
**替换正则:**`**`

## html 标题转markdown ##
**匹配正则:**`<h2 id=.+?><a href=.+?></a>(.+?)</h2>`
**替换正则:**`## $1 ##\n`
