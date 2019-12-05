---
title: Hexo 插件 在浏览器中编辑
categories: 
  - Hexo
  - 插件
date: 2019-12-05 12:13:26
updated: 2019-12-05 13:56:34
abbrlink: fbe3df38
---
<div id='my_toc'>

- [hexo-admin插件](/blog/fbe3df38/#hexo-admin插件)
    - [安装插件](/blog/fbe3df38/#安装插件)
    - [浏览器中编辑](/blog/fbe3df38/#浏览器中编辑)
    - [设置密码](/blog/fbe3df38/#设置密码)
    - [hexo-admin优缺点](/blog/fbe3df38/#hexo-admin优缺点)
        - [缺点](/blog/fbe3df38/#缺点)
        - [优点](/blog/fbe3df38/#优点)
- [hexo-myadmin插件](/blog/fbe3df38/#hexo-myadmin插件)
    - [安装插件](/blog/fbe3df38/#安装插件)
    - [浏览器中编辑](/blog/fbe3df38/#浏览器中编辑)
    - [设置密码](/blog/fbe3df38/#设置密码)
    - [hexo-myadmin优缺点](/blog/fbe3df38/#hexo-myadmin优缺点)
- [手机端的浏览器中编辑](/blog/fbe3df38/#手机端的浏览器中编辑)
- [参考资料](/blog/fbe3df38/#参考资料)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# hexo-admin插件
[hexo-admin](https://github.com/jaredly/hexo-admin)插件可以在浏览器中,编辑博客中的内容.类似CSDN的在线编辑器。
## 安装插件
```shell
npm install --save hexo-admin
```
## 浏览器中编辑
先启动本地服务器:
```shell
hexo s
```
在浏览器中进入[localhost://4000/admin/](localhost://4000/admin/)即可在线编辑。
## 设置密码
进入[http://localhost:4000/admin/#/auth-setup](http://localhost:4000/admin/#/auth-setup)设置用户和密码,然后将生成的配置复制粘贴到Hexo的配置文件中,
然后重启本地服务器即可.
## hexo-admin优缺点
### 缺点
载入缓慢
编辑器功能不强

### 优点
支持粘贴图片

# hexo-myadmin插件
插件仓库:[https://github.com/thesadabc/hexo-myadmin](https://github.com/thesadabc/hexo-myadmin)
hexo-myadmin比较轻量级,我平时还是使用其他编辑器来写,使用后台插件是为了再手机上修改文章中的错误时,比较方便。所以`hexo-myadim`载入比较块这点我比较喜欢,
## 安装插件
```shell
npm install hexo-myadmin --save
```
## 浏览器中编辑
先启动本地服务器:
```shell
hexo s
```
在浏览器中进入[localhost://4000/admin/](localhost://4000/admin/)即可在线编辑。
注意要再默认端口4000部署本地博客,不然密码校验可能会失败.这应该时软件的bug吧,就先这样用了.
## 设置密码
文档上推荐到这个网站[https://bcrypt-generator.com/](https://bcrypt-generator.com/)去生成密码的hashcode.
```shell
$2y$12$zMir4hNmHnYTYhqF6OndL.jUVSXgZvChwcCXWmFcVP89e6Dk6Qi4y
```
我无法登录

经过我的研究
直接使用hexo-admin生成的密码格式为:
```shell
$2a$10$......
```
而生成的格式为:
```shell
$2y$12$...
```
应该是使用2a的可以,使用2y的不行.所以生成2a的就行了.具体含义我不清楚,先这样用.
可以到[https://www.jisuan.mobi/p163u3BN66Hm6JWx.html](https://www.jisuan.mobi/p163u3BN66Hm6JWx.html)去生成:
生成的格式为:
```shell
$2a$10$......
```
应该就是对的
也可以到[https://www.javainuse.com/onlineBcrypt](https://www.javainuse.com/onlineBcrypt)这个网站去生成

## hexo-myadmin优缺点
优点:
- 载入速度快
- 编辑器功能强大.

缺点:不支持图片粘贴功能.

# 手机端的浏览器中编辑
先安装Termux,然后安装好环境后,就可以使用Hexo-admin进行编辑了.hexo-admin这个插件好像并不支持相应式布局.用法和在电脑上用法差不多。
# 参考资料
[https://www.v2ex.com/t/340678](https://www.v2ex.com/t/340678)
参见:[https://blog.csdn.net/smileyan9/article/details/86666824](https://blog.csdn.net/smileyan9/article/details/86666824)
