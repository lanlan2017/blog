---
title: eclipse 创建mybatis-config.xml 创建mapper.xml文件
categories: 
  - Java
  - Java EE
  - 环境搭建
date: 2019-06-07 15:34:05
updated: 2019-11-04 17:02:01
abbrlink: 44aa2f70
---
- [eclipse 创建mybatis-config.xml 创建mapper.xml文件](/blog/44aa2f70/#eclipse-创建mybatis-config-xml-创建mapper-xml文件)
    - [下载mybatis的jar包](/blog/44aa2f70/#下载mybatis的jar包)
    - [从mybatis的jar包复制模板文件](/blog/44aa2f70/#从mybatis的jar包复制模板文件)
    - [保存模板文件到本地](/blog/44aa2f70/#保存模板文件到本地)
    - [引入模板文件到eclipse中](/blog/44aa2f70/#引入模板文件到eclipse中)
        - [引入mybatis-3-config.dtd](/blog/44aa2f70/#引入mybatis-3-config-dtd)
        - [引入mybatis-3-mapper.dtd](/blog/44aa2f70/#引入mybatis-3-mapper-dtd)
    - [使用模板文件创建mybatis-config.xml文件](/blog/44aa2f70/#使用模板文件创建mybatis-config-xml文件)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# eclipse 创建mybatis-config.xml 创建mapper.xml文件 #
## 下载mybatis的jar包 ##
这里不介绍如何下载mybatis的jar包,我这里用的版本是:`mybatis-3.4.5. jar`.
## 从mybatis的jar包复制模板文件 ##
用解压工具打开`jar`包,进入`mybatis-3.4.5. jar\org\apache\ibatis\builder\xml\`目录,然后复制`mybatis-3-config.dtd`,`mybatis-3-mapper.dtd`这两个文件.
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Mybatis/templateFile/1.png)
## 保存模板文件到本地 ##
打开`eclipse`的安装目录,然后创建一个名为`mybatis_config`目录,进入该目录,然后粘贴上面复制的两个文件:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Mybatis/templateFile/2.png)
这个文件你想粘贴到哪里都无所谓,只要记得粘贴的路径即可,,我粘贴到`eclipse`安装目录中主要是为了,方便后面管理和使用.
## 引入模板文件到eclipse中 ##
### 引入mybatis-3-config.dtd ###
依次点开`Window-Preferences-XML-XML Catalog`,然后点击`Add`按钮,在弹出的窗口中选择`Catalog Entry`,然后点击右边的`File System...`按钮：
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Mybatis/templateFile/3.png)
找到刚才粘贴的文件`mybatis-3-config.dtd`:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Mybatis/templateFile/4.png)
然后在`key`文本框中输入下面代码:
```
-//mybatis.org//DTD Config 3.0//EN
```
然后勾选`Alternative web address:`,并在下面的文本框输入一下地址:
```
http://mybatis.org/dtd/mybatis-3-config.dtd
```
如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Mybatis/templateFile/5.png)
最后点击OK即可.
### 引入mybatis-3-mapper.dtd ###
引入`mybatis-3-mapper.dtd`类似上面,只是此时的`key`改为如下:
```
-//mybatis.org//DTD Mapper 3.0//EN
```
然后勾选`Alternative web address:`,并在下面的文本框输入一下地址:
```
http://mybatis.org/dtd/mybatis-3-mapper.dtd
```
如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Mybatis/templateFile/6.png)
这样引入就完成了
## 使用模板文件创建mybatis-config.xml文件 ##
在`src`目录上右键,选择`New-Other...`,然后展开`XML`目录,选择`XML File`,然后`Next`
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Mybatis/templateFile/8.png)
输入文件名`mybatis-config.xml`,然后`Next`
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Mybatis/templateFile/9.png)
**选择`Create XML file from a DTD file`:**
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Mybatis/templateFile/10.png)
然后勾选`Select XML Catalog entry`,在选择框中选择:`-//mybatis. org//DTD Config 3.0//EN`,然后`Next`.
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Mybatis/templateFile/11.png)
然后点击`Finish`,这样就创建好了`mybatis-config.xml`文件了,如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Mybatis/templateFile/12.png)
自动生成的代码如下:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN" "http://mybatis.org/dtd/mybatis-3-config.dtd" >
<configuration></configuration>
```
**创建`Mapper.xml`类似**
>原文链接: [eclipse 创建mybatis-config.xml 创建mapper.xml文件](https://lanlan2017.github.io/blog/44aa2f70/)
