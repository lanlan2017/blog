---
title: CSS文件加载：@import和link的区别
categories: 
  - 编程
  - CSS
  - 基础
date: 2019-05-01 10:29:08
updated: 2021-03-20 10:42:39
abbrlink: 9b90d554
---
# css文件加载：@import和link的区别
**本质上，这两种方式都是为了加载`CSS`文件**，但还是存在着细微的差别。
# 使用CSS的三种方式
页面中使用`CSS`的方式主要有3种：
- 行内添加定义`style`属性值,
- 页面头部内嵌,
- 调用和外面链接调用，其中外面引用有两种：
    - `link`和`@import`。

# @impot使用方法
```html
<style type="text/css">
<!--
    @import url("css/main.css");
    @import url("css/base.css");
-->
</style>
```
# link的使用方法
```html
<link href="css/main.css" rel="stylesheet" type="text/css"/>
```
# 区别
## 功能上的区别
- `link`是`XHTML`标签，除了加载`CSS`外，还可以定义`RSS`等其他事务；
- `@import`属于`CSS`范畴，只能加载`CSS`。

## 加载顺序上的区别
- **当一个页面被加载的时候**（就是被浏览者浏览的时候），**`link`引用的`CSS`会同时被加载**，
- 而**`@import`引用的`CSS`会等到页面全部被下载完再被加载**。
- 所以有时候浏览`@import`加载`CSS`的页面时开始会没有样式,后面样式加载出来后网页会闪烁。

## 兼容性上的区别
- **`link`**是`XHTML`标签，**无兼容问题**。
- 由于**`@import`是`CSS2.1`提出的所以老的浏览器不支持**，

## dom支持上的区别
- `link`支持使用`Javascript`控制`DOM`去改变样式
- 而`@import`不支持。

## 嵌套支持上的区别
- **`@import`可以在`css`中再次引入其他样式表**，比如可以创建一个主样式表，在主样式表中再引入其他的样式表，这样更利于修改和扩展。如下所示:

**main.css**
```css
@import “sub1.css”;
@import “sub2.css”;
```
**sub1.css**
```css
p {color:red;}
```
**sub2.css**
```css
.myclass {color:blue}
```
# 总结
从上面的分析来看，**还是使用`link`标签比较好**。标准网页制作加载`CSS`文件时，还应该选定要加载的媒体（`media`），比如`screen`，`print`，或者全部`all`等。

提示：这样做有一个缺点，**会对网站服务器产生过多的`HTTP`请求**，以前是一个文件，而现在却是两个或更多文件了，**服务器的压力增大，浏览量大的网站还是谨慎使用**。有兴趣的可以观察一下像新浪等网站的首页或栏目首页代码，他们总会**把`css`或`js`直接写在`html`里，而不用外部文件**。

# 参考资料
[https://www.cnblogs.com/pp-cat/p/4001628.html](https://www.cnblogs.com/pp-cat/p/4001628.html)
[https://blog.csdn.net/sinat_36414515/article/details/80392321](https://blog.csdn.net/sinat_36414515/article/details/80392321)
