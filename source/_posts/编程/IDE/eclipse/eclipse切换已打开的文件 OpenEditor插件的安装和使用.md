---
title: eclipse切换已打开的文件 OpenEditor插件的安装和使用
categories: 
  - IDE
  - eclipse
abbrlink: 158fae9d
date: 2021-08-22 10:10:39
updated: 2022-04-04 00:51:45
---
# 显示折叠的编辑器列表
一个项目中有许多文件，当你在eclipse中打开多个文件之后，编辑区只会显示几个文件，其他的文件则会折叠起来。
那么如何显示这些被折叠的文件(编辑器)呢？
## 通过编辑区顶部的展开按钮打开

![1](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210822101535.png)

这样要切换到其他文件时，就很不方便，要命的是，如果你打开的是两个项目，这两个项目中有同名文件，此时折叠列表中会显示同名文件，此时你是无法判断这些同名文件到底是那个项目的：

![image-20210822101918905](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210822101919.png)

这样的话，你需要把鼠标放到文件上方，eclipse才会提示你该文件属于哪个项目：

![image-20210822102310359](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210822102310.png)

这样的话操作就比较慢。

## 快捷键Ctrl+E打开被折叠的编辑器

可以按下**Crtl+E**快捷键，快速展开被折叠的编辑器,如果有同名文件，还是需要通过悬停鼠标来查看，这种方式的确定是：悬停显示文件路径时，响应有延迟，需要等待一会。浪费时间。

![image-20210822102603228](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210822102603.png)

![image-20210822102754828](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210822102754.png)

## 快捷键Shift+Ctrl+E打开被折叠的编辑器

**Ctrl+E**快捷键显示的文件列表中没有显示文件的具体地址，如果想显示文件所在的项目可以谁用**Shift+Ctrl+E**快捷键：

![image-20210822103427329](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210822103427.png)

## OpenEdtiors插件
插件路径：

eclipse应用市场：[https://marketplace.eclipse.org/content/open-editors](https://marketplace.eclipse.org/content/open-editors)

项目地址：
[https://github.com/dbickley/OpenEditors](https://github.com/dbickley/OpenEditors)

### 如何安装

#### 打开Eclipse Markplace

Help，Eclipse Markplace...

![image-20210822103901941](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210822103902.png)

#### 进入Eclipse插件网站 拖动安装

在Install按钮上按下鼠标左键，然后拖动到Eclipse Markplace中，等待加载安装程序，然后即可进入安装界面。

![image-20210822104201152](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210822104201.png)

### 如何使用Open Editor插件

Window，Show View，Other...

![image-20210822104459330](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210822104459.png)

然后在Show View对话框的搜索框中，输入关键字open,查找插件，然后选择找到的插件，点击下方的按钮打开插件：

![image-20210822104737998](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210822104738.png)

Open  Editors插件会显示在侧边栏，在该插件中就可以看到所有已经打开的文件了，上面会显示文件所在的项目，这样切换文件的时候就比较方便：

![image-20210822105044287](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210822105044.png)

