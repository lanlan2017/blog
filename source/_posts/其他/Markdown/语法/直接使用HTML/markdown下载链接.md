---
title: markdown下载链接
categories: 
  - 其他
  - Markdown
  - 语法
  - 直接使用HTML
date: 2019-12-06 10:33:33
updated: 2019-12-17 05:18:53
abbrlink: 695eb842
---
# HTML下载链接格式
```html
<a href="资源路径" download="资源的名称">资源说明</a>
```
例如:
```html
<a href="https://lanlan2017.github.io/download/PhraseEdit.txt" download="PhraseEdit.txt">点击下载搜狗输入法自定义短语配置文件:PhraseEdit.txt</a>
```
<a href="https://lanlan2017.github.io/download/PhraseEdit.txt" download="PhraseEdit.txt">点击下载搜狗输入法自定义短语配置文件:PhraseEdit.txt</a>

# 下载其他站点的资源
如果在当前站点(子站点)中,下载其他站点(主站点)中的资源,浏览器(火狐)会新建一个标签页来显示这个txt文件中的内容,而不是显示下载界面.不过也没有关系,可以利用浏览器的**页面另存为**功能就可以下载了:
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Markdown/download/1.png)
# 在当前站点中没有download属性的情况
如果进入主站中,下载当前站点中的资源,没有download属性的话,依然会新建标签页,然后显示文件内容.而且会乱码:
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Markdown/download/2.png)
但是有download属性的话就会正常显示下载界面:
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Markdown/download/3.png)
懒得测试了,也许就火狐这样,也许就txt这样,总之**加上download属性**就是了
# 参考资料
[HTML <a> download 属性](https://www.w3school.com.cn/tags/att_a_download.asp)
