---
title: Hexo 插件 在浏览器中编辑
categories: 
  - Hexo
  - 插件
date: 2019-12-05 12:13:26
updated: 2019-12-09 20:34:40
abbrlink: fbe3df38
---
<div id='my_toc'><a href="/blog/fbe3df38/#hexo-admin插件">hexo-admin插件</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#安装插件">安装插件</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#浏览器中编辑">浏览器中编辑</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#设置密码">设置密码</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#hexo-admin优缺点">hexo-admin优缺点</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#缺点">缺点</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#优点">优点</a><br/><a href="/blog/fbe3df38/#hexo-myadmin插件">hexo-myadmin插件</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#安装插件">安装插件</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#浏览器中编辑">浏览器中编辑</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#设置密码">设置密码</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#hexo-myadmin优缺点">hexo-myadmin优缺点</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#优点">优点</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#缺点">缺点</a><br/><a href="/blog/fbe3df38/#hexo-local-admin">hexo-local-admin</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#安装">安装</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#帮助文档">帮助文档</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#设置站点路径">设置站点路径</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#设置主题名称">设置主题名称</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#hexo-local-admin配置文件路径">hexo-local-admin配置文件路径</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#启动本地服务器">启动本地服务器</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#优点">优点</a><br/><a href="/blog/fbe3df38/#hexo-hey插件">hexo-hey插件</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#安装">安装</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#设置密码">设置密码</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#缺点">缺点</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/fbe3df38/#卸载">卸载</a><br/><a href="/blog/fbe3df38/#手机端的浏览器中编辑">手机端的浏览器中编辑</a><br/><a href="/blog/fbe3df38/#总结">总结</a><br/><a href="/blog/fbe3df38/#参考资料">参考资料</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

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
- 载入缓慢
- 编辑器原始,功能不强.

### 优点
- 支持粘贴图片
- 子站点中可以使用

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
### 优点
- 载入速度快
- 编辑器功能强大.

### 缺点
- 不支持图片粘贴功能.
- **子站点中无法使用**

```shell
npm uninstall hexo-myadmin --save
```
# hexo-local-admin
[https://github.com/geekwen/hexo-local-admin](https://github.com/geekwen/hexo-local-admin)
## 安装
```shell
npm install -g hexo-local-admin
```
## 帮助文档
```shell
hexo-admin -h
```
```shell
$ hexo-admin -h
Usage: hexo-admin [options] [command]

Options:
  -V, --version                  output the version number
  -r, --root-path [root_path]    view/set hexo root path
  -t, --theme-name [theme_name]  view/set hexo theme name
  -h, --help                     output usage information

Commands:
  start                          Start hexo local admin server

```
### 设置站点路径
```shell
hexo-admin -r /e/Blog/blog9
```
### 设置主题名称
注意是主题名称,不要输入主题的路径,否则程序会出错
```shell
hexo-admin -t next
```
主题名称错误的设为路径怎么办?只能找到配置文件然直接在配置文件中修改即可.
### hexo-local-admin配置文件路径
文件路径:
```shell
C:\Users\用户名\Documents\.hexo-local-admin-config.json
```
如
```shell
C:\Users\lan\Documents\.hexo-local-admin-config.json
```
### 启动本地服务器
```shell
hexo-admin start
```
会在[http://localhost:4001/](http://localhost:4001/)中启动后台.
### 优点
可以创建文章,可以修改以前的文章.

还是老老实实用hexo-admin吧.

# hexo-hey插件
## 安装
```shell
npm install hexo-hey --save
```
## 设置密码
```shell
admin:
  name: 账号
  password: 密码
  secret: hey hexo
  expire: 60*1
  # cors: http://localhost:4007
```
## 缺点
只能新建文章,不能编辑以前的文章,要你何用。
## 卸载
```shell
npm uninstall hexo-hey --save
```
# 手机端的浏览器中编辑
先安装Termux,然后安装好环境后,就可以使用Hexo-admin进行编辑了.hexo-admin这个插件好像并不支持相应式布局.用法和在电脑上用法差不多。
# 总结
经过我一番比较还是使用Hexo-admin比较实在,虽然它载入的比较慢.但是bug少.
# 参考资料
[https://www.v2ex.com/t/340678](https://www.v2ex.com/t/340678)
参见:[https://blog.csdn.net/smileyan9/article/details/86666824](https://blog.csdn.net/smileyan9/article/details/86666824)
