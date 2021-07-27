---
title: Hexo中插入dot的svg图片
categories:
  - Hexo
  - 绘图
abbrlink: b7ae7ac5
date: 2021-07-27 15:02:29
updated: 2021-07-27 19:40:57
---

# 问题描述
VScode中写markdown时，可以安装插件，然后在代码块中接口渲染dot
但是在Hexo,没有很方便的插件

所以
# 使用svg在线渲染服务

```
![xxx](https://g.gravizo.com/svg?
digraph demo {
  rankdir=LR;
  node [shape=record];
  h [shape=ellipse];
  n [shape=ellipse];

  a [label="{1|null}" color="red"];
  
  h -> null;
  n ->a;
}
)
```

![图片](https://g.gravizo.com/svg?digraph%20demo%20%7Brankdir%3DLR%3Bnode%20%5Bshape%3Drecord%5D%3Bh%20%5Bshape%3Dellipse%5D%3Bn%20%5Bshape%3Dellipse%5D%3Ba%20%5Blabel%3D%22%7B1%7Cnull%7D%22%20color%3D%22red%22%5D%3Bh%20-%3E%20null%3Bn%20-%3Ea%3B%7D)

## 方法1：进行URL编码后使用
但是这样的写法在hexo不会渲染成功，需要进行URL编码：
```
![xxx](https://g.gravizo.com/svg?digraph%20demo%20%7Brankdir%3DLR%3Bnode%20%5Bshape%3Drecord%5D%3Bh%20%5Bshape%3Dellipse%5D%3Bn%20%5Bshape%3Dellipse%5D%3Ba%20%5Blabel%3D%22%7B1%7Cnull%7D%22%20color%3D%22red%22%5D%3Bh%20-%3E%20null%3Bn%20-%3Ea%3B%7D)
```
渲染效果如下：

<!-- ![xxx](https://g.gravizo.com/svg?digraph%20G%20%7B%0A%20%20%20%20hello%0A%7D) -->

![xxx](https://g.gravizo.com/svg?digraph%20demo%20%7Brankdir%3DLR%3Bnode%20%5Bshape%3Drecord%5D%3Bh%20%5Bshape%3Dellipse%5D%3Bn%20%5Bshape%3Dellipse%5D%3Ba%20%5Blabel%3D%22%7B1%7Cnull%7D%22%20color%3D%22red%22%5D%3Bh%20-%3E%20null%3Bn%20-%3Ea%3B%7D)

## 方法2：写在一行
```
![xxx](https://g.gravizo.com/svg?digraph demo {rankdir=LR;node [shape=record];h [shape=ellipse];n [shape=ellipse];a [label="{1|null}" color="red"];h -> null;n ->a;})
```
渲染效果：

![xxx](https://g.gravizo.com/svg?digraph demo {rankdir=LR;node [shape=record];h [shape=ellipse];n [shape=ellipse];a [label="{1|null}" color="red"];h -> null;n ->a;})

# 参考资料
https://juejin.cn/post/6844903702109634568
http://g.gravizo.com/
http://www.plantuml.com/plantuml
