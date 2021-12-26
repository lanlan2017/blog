---
title: 更新hexo5+next8
categories:
  - Hexo
  - next主题
  - 更新
abbrlink: 63f5df0e
date: 2021-12-19 16:41:54
updated: 2021-12-19 16:41:54
---
# 更新hexo5+next8
## 更新nodejs
### 使用nvm
#### 安装nvm
使用nvm管理nodejs，使用nvm切换node版本

## 更新hexo-cli
```
npm install hexo-cli -g
```
安装成功后的效果：
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog (master)
$ hexo version
hexo: 4.2.1
hexo-cli: 4.3.0
os: win32 10.0.19043
node: 14.18.2
v8: 8.4.371.23-node.85
uv: 1.42.0
zlib: 1.2.11
brotli: 1.0.9
ares: 1.18.1
modules: 83
nghttp2: 1.42.0
napi: 8
llhttp: 2.1.4
openssl: 1.1.1l
cldr: 39.0
icu: 69.1
tz: 2021a
unicode: 13.0
```
## hexo init新站点
更新的hexo5与原来的next主题不兼容，所以无法直接在原站点(blog)进行更新。因此，我的做法是直接创建一个新站点(blog_new)，然后把原站点(blog)上的文章复制到新站点(blog_new)上。
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog
$ hexo init blog_new
INFO  Cloning hexo-starter https://github.com/hexojs/hexo-starter.git
INFO  Install dependencies
added 252 packages from 208 contributors in 18.717s

15 packages are looking for funding
  run `npm fund` for details

INFO  Start blogging with Hexo!

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog
```

hexo init的站点使用的hexo默认是5.0版本:

```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog
$ cd blog_new/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ ls
_config.landscape.yml  _config.yml  node_modules/  package.json  package-lock.json  scaffolds/  source/  themes/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ cat package.json
{
  "name": "hexo-site",
  "version": "0.0.0",
  "private": true,
  "scripts": {
    "build": "hexo generate",
    "clean": "hexo clean",
    "deploy": "hexo deploy",
    "server": "hexo server"
  },
  "hexo": {
    "version": ""
  },
  "dependencies": {
    "hexo": "^5.0.0",
    "hexo-generator-archive": "^1.0.0",
    "hexo-generator-category": "^1.0.0",
    "hexo-generator-index": "^2.0.0",
    "hexo-generator-tag": "^1.0.0",
    "hexo-renderer-ejs": "^2.0.0",
    "hexo-renderer-marked": "^4.0.0",
    "hexo-renderer-stylus": "^2.0.0",
    "hexo-server": "^2.0.0",
    "hexo-theme-landscape": "^0.0.3"
  }
}

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
```
## 更新新站点下的hexo版本
安装npm-check，若已安装可以跳过
```
npm install -g npm-check
```
检查系统插件是否需要升级
```
npm-check
```
安装npm-upgrade，若已安装可以跳过
```
npm install -g npm-upgrade
```
### 更新package.json中插件的插件版本
输入
```
npm-upgrade
```
命令，然后输入yes选择要更新的插件。

```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ npm-upgrade
Checking for outdated dependencies for "G:\Blog\blog_new\package.json"...


New versions of active modules available:

  hexo                   ^5.0.0   →   ^5.4.0
  hexo-renderer-marked   ^4.0.0   →   ^4.1.0
  hexo-renderer-stylus   ^2.0.0   →   ^2.0.1

? Update "hexo" in package.json from ^5.0.0 to ^5.4.0? (Use arrow keys)
? Update "hexo" in package.json from ^5.0.0 to ^5.4.0? Yes

? Update "hexo-renderer-marked" in package.json from ^4.0.0 to ^4.1.0? (Use arro
? Update "hexo-renderer-marked" in package.json from ^4.0.0 to ^4.1.0? Yes

? Update "hexo-renderer-stylus" in package.json from ^2.0.0 to ^2.0.1? (Use arro
? Update "hexo-renderer-stylus" in package.json from ^2.0.0 to ^2.0.1? Yes


These packages will be updated:

  hexo                   ^5.0.0   →   ^5.4.0
  hexo-renderer-marked   ^4.0.0   →   ^4.1.0
  hexo-renderer-stylus   ^2.0.0   →   ^2.0.1

? Update package.json? (Y/n) yes
? Update package.json? Yes

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
```
### 删除新站点已经安装的插件
删除`package-lock.json`文件和`node_modules/`目录：
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ ls
_config.landscape.yml  _config.yml  node_modules/  package.json  package-lock.json  scaffolds/  source/  themes/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ rm package-lock.json

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ rm -rf node_modules/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ ls
_config.landscape.yml  _config.yml  package.json  scaffolds/  source/  themes/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
```

### 安装package.json中的插件
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ npm install
npm WARN deprecated urix@0.1.0: Please see https://github.com/lydell/urix#deprecated
npm WARN deprecated resolve-url@0.2.1: https://github.com/lydell/resolve-url#deprecated
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@~2.3.2 (node_modules\chokidar\node_modules\fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.3.2: wanted {"os":"darwin","arch":"any"} (current: {"os":"win32","arch":"x64"})

added 252 packages from 208 contributors in 13.869s

15 packages are looking for funding
  run `npm fund` for details


18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ ls
_config.landscape.yml  _config.yml  node_modules/  package.json  package-lock.json  scaffolds/  source/  themes/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
```
## 查看hexo版本
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ hexo version
INFO  Validating config
hexo: 5.4.0
hexo-cli: 4.3.0
os: win32 10.0.19043
node: 14.18.2
v8: 8.4.371.23-node.85
uv: 1.42.0
zlib: 1.2.11
brotli: 1.0.9
ares: 1.18.1
modules: 83
nghttp2: 1.42.0
napi: 8
llhttp: 2.1.4
openssl: 1.1.1l
cldr: 39.0
icu: 69.1
tz: 2021a
unicode: 13.0

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
```
可以看到hexo已经升级到5.4版本的了。

## 在新站点安装next主题
hexo 5.x支持通过npm把next主题安装成hexo的插件。
```
npm install hexo-theme-next
```
安装效果：
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ npm install hexo-theme-next
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@2.3.2 (node_modules\fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.3.2: wanted {"os":"darwin","arch":"any"} (current: {"os":"win32","arch":"x64"})

+ hexo-theme-next@8.8.2
added 1 package from 1 contributor in 3.027s

15 packages are looking for funding
  run `npm fund` for details


18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
```
### 更新next版本
在hexo站点根目录下：
```
npm install hexo-theme-next@latest
```
安装效果：
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ npm install hexo-theme-next@latest
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@2.3.2 (node_modules\fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.3.2: wanted {"os":"darwin","arch":"any"} (current: {"os":"win32","arch":"x64"})

+ hexo-theme-next@8.8.2
updated 1 package in 2.924s

15 packages are looking for funding
  run `npm fund` for details

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
```

## 启用next主题
### 复制next主题的配置文件到站点根目录下
**进入站点目录**，把next主题的配置文件复制到站点根目录下，和hexo的配置文件（_config.yml）放在一起。并且重命名为`_config.next.yml`：
```
cp node_modules/hexo-theme-next/_config.yml _config.next.yml
```
此时站点根目录下共有3个配置文件：
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ cp node_modules/hexo-theme-next/_config.yml _config.next.yml

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ ls
_config.landscape.yml  _config.next.yml  _config.yml  node_modules/  package.json  package-lock.json  scaffolds/  source/  themes/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
```
分别是_config.landscape.yml，_config.next.yml，_config.yml。
_config.landscape.yml是landscpae的配置文件，
### 卸载landscape主题
```
npm uninstall hexo-theme-landscape
```
运行效果：
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ cat package.json
{
  "name": "hexo-site",
  "version": "0.0.0",
  "private": true,
  "scripts": {
    "build": "hexo generate",
    "clean": "hexo clean",
    "deploy": "hexo deploy",
    "server": "hexo server"
  },
  "hexo": {
    "version": "5.4.0"
  },
  "dependencies": {
    "hexo": "^5.4.0",
    "hexo-generator-archive": "^1.0.0",
    "hexo-generator-category": "^1.0.0",
    "hexo-generator-index": "^2.0.0",
    "hexo-generator-tag": "^1.0.0",
    "hexo-renderer-ejs": "^2.0.0",
    "hexo-renderer-marked": "^4.1.0",
    "hexo-renderer-stylus": "^2.0.1",
    "hexo-server": "^2.0.0",
    "hexo-theme-landscape": "^0.0.3",
    "hexo-theme-next": "^8.8.2"
  }
}

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ npm uninstall hexo-theme-landscape
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@2.3.2 (node_modules\fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.3.2: wanted {"os":"darwin","arch":"any"} (current: {"os":"win32","arch":"x64"})

removed 1 package in 1.86s

15 packages are looking for funding
  run `npm fund` for details


18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ cat package.json
{
  "name": "hexo-site",
  "version": "0.0.0",
  "private": true,
  "scripts": {
    "build": "hexo generate",
    "clean": "hexo clean",
    "deploy": "hexo deploy",
    "server": "hexo server"
  },
  "hexo": {
    "version": "5.4.0"
  },
  "dependencies": {
    "hexo": "^5.4.0",
    "hexo-generator-archive": "^1.0.0",
    "hexo-generator-category": "^1.0.0",
    "hexo-generator-index": "^2.0.0",
    "hexo-generator-tag": "^1.0.0",
    "hexo-renderer-ejs": "^2.0.0",
    "hexo-renderer-marked": "^4.1.0",
    "hexo-renderer-stylus": "^2.0.1",
    "hexo-server": "^2.0.0",
    "hexo-theme-next": "^8.8.2"
  }
}

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
```
#### 删除landscape主题的配置文件
在站点目录下，输入如下命令删除：
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ ls
_config.landscape.yml  _config.next.yml  _config.yml  node_modules/  package.json  package-lock.json  scaffolds/  source/  themes/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ rm _config.landscape.yml

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ ls
_config.next.yml  _config.yml  node_modules/  package.json  package-lock.json  scaffolds/  source/  themes/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
```
### hexo启用next主题
进入站点目录，打开hexo的配置文件`_config.yml`,把landscape替换成next:
```yml
# Extensions
## Plugins: https://hexo.io/plugins/
## Themes: https://hexo.io/themes/
# theme: landscape
theme: next
```
### 查看主题效果
在站点目录下，输入命令：
```
hexo s
```
然后进入
http://127.0.0.1:4000/
查看效果

## 安装旧站点的插件到新站点：
下面是我旧站点的package.json文件内容：
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog (master)
$ cat package.json
{
  "name": "hexo-site",
  "version": "0.0.0",
  "private": true,
  "scripts": {
    "build": "hexo generate",
    "clean": "hexo clean",
    "deploy": "hexo deploy",
    "server": "hexo server"
  },
  "hexo": {
    "version": "4.2.1"
  },
  "dependencies": {
    "hexo": "^4.2.1",
    "hexo-abbrlink": "^2.2.1",
    "hexo-auto-category": "^0.2.1",
    "hexo-deployer-git": "^3.0.0",
    "hexo-filter-kroki": "^2.1.8",
    "hexo-generator-archive": "^1.0.0",
    "hexo-generator-baidu-sitemap": "^0.1.9",
    "hexo-generator-category": "^1.0.0",
    "hexo-generator-index-pin-top": "^0.2.2",
    "hexo-generator-search": "^2.4.3",
    "hexo-generator-sitemap": "^2.2.0",
    "hexo-generator-tag": "^1.0.0",
    "hexo-reference": "^1.0.4",
    "hexo-renderer-ejs": "^2.0.0",
    "hexo-renderer-marked": "^4.1.0",
    "hexo-renderer-stylus": "^2.0.1",
    "hexo-server": "^2.0.0"
  }
}
```
这上面的：
hexo-abbrlink插件是生成永久链接的
hexo-filter-kroki插件是用来支持plantuml绘图的。这两个插件比较重要，其他的插件没那么重要。
### 在新站点安装hexo-abbrlink插件
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ npm install hexo-abbrlink
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@2.3.2 (node_modules\fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.3.2: wanted {"os":"darwin","arch":"any"} (current: {"os":"win32","arch":"x64"})

+ hexo-abbrlink@2.2.1
added 3 packages from 6 contributors in 2.849s

15 packages are looking for funding
  run `npm fund` for details


18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new

```
### 在新站点安装hexo-filter-kroki插件
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ npm install hexo-filter-kroki
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@2.3.2 (node_modules\fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.3.2: wanted {"os":"darwin","arch":"any"} (current: {"os":"win32","arch":"x64"})

+ hexo-filter-kroki@2.1.8
added 2 packages from 7 contributors in 2.705s

15 packages are looking for funding
  run `npm fund` for details

```

## 复制旧站点中的文章到新站点
旧站点的重要插件安装到新站点后，就可以把就站点的文章复制到新站点了：
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ cp -r ../blog/source/_posts/* source/_posts/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
```
查看复制来的文章：
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ cd source/_posts/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new/source/_posts
$ ls
hello-world.md  Hexo/  Windows/  编程/  其他/  随堂笔记/

```
# 配置next 8
https://theme-next.js.org/docs/theme-settings/

打开next主题的配置文件：G:\Blog\blog_new\_config.next.yml
## 缓存支持
```yml G:\Blog\blog_new\_config.next.yml
# Allow to cache content generation.
cache:
  enable: true
```
### 压缩生成的hexo文件
```yml G:\Blog\blog_new\_config.next.yml
# Remove unnecessary files after hexo generate.
minify: true
```
## 选择视图方案
```yml G:\Blog\blog_new\_config.next.yml
# Schemes
# scheme: Muse
#scheme: Mist
#scheme: Pisces
scheme: Gemini
```
我这里用的是Gemini这个Schemes
## 黑暗模式
```yml G:\Blog\blog_new\_config.next.yml
# Dark Mode
darkmode: true
```
如果操作系统首选主题是黑暗的，则接下来的主题自动显示黑暗模式。它由MacOS Mojave，iOS 13和Android 10或更高版本支持。
## 图标
把图标放在hexo站点下的source目录下的images目录下：
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new/source/images
$ ls
apple-touch-icon-next.png  avatar.gif  favicon.ico  favicon-16x16-next.png  favicon-32x32-next.png
```
效果如下：

![image-20211219210849192](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20211219210856.png)

然后在next的配置文件中设置如下：

```yml G:\Blog\blog_new\_config.next.yml
favicon:
  small: /images/favicon-16x16-next.png
  medium: /images/favicon-32x32-next.png
  apple_touch_icon: /images/apple-touch-icon-next.png
  safari_pinned_tab: /images/logo.svg
  #android_manifest: /manifest.json
```
## logo
```yml G:\Blog\blog_new\_config.next.yml
# Custom Logo (Warning: Do not support scheme Mist)
# custom_logo: #/uploads/custom-logo.jpg
custom_logo: /images/avatar.gif
```
![image-20211220122345692](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20211220122345.png)

## Creative Commons版权声明
版权声明
```yml G:\Blog\blog_new\_config.next.yml
# Creative Commons 4.0 International License.
# See: https://creativecommons.org/about/cclicenses/
creative_commons:
  # Available values: by | by-nc | by-nc-nd | by-nc-sa | by-nd | by-sa | cc-zero
  license: by-nc-sa
  # Available values: big | small
  size: small
  sidebar: true
  post: true
  # You can set a language value if you prefer a translated version of CC license, e.g. deed.zh
  # CC licenses are available in 39 languages, you can find the specific and correct abbreviation you need on https://creativecommons.org
  language: deed.zh
```
sidebar: true时的效果：
![image-20211219211416353](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20211219211416.png)
post: true时的效果：
![image-20211219211302792](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20211219211302.png)
## 配置菜单项
[3]
### 添加自定义页面
### 添加tag页面
https://theme-next.js.org/docs/theme-settings/custom-pages.html#Adding-%C2%ABTags%C2%BB-Page

进入站点目录，输入如下命令生成tags页面：
```
hexo new page tags
```
这个命令将在source/目录下生成tags/目录

#### 修改source\tags\index.md文件
打开生成的index.md文件，在其frontmatter中加上
```
type: tags
```
如下所示
```md G:\Blog\blog_new\source\tags\index.md
---
title: tags
date: 2021-12-20 14:07:04
type: tags
---
```

不然tags页面不会显示任何内容。
#### 开启tags菜单项
```yml G:\Blog\blog_new\_config.next.yml
menu:
  home: / || fa fa-home
  #about: /about/ || fa fa-user
  tags: /tags/ || fa fa-tags
  #categories: /categories/ || fa fa-th
  #archives: /archives/ || fa fa-archive
  #schedule: /schedule/ || fa fa-calendar
  #sitemap: /sitemap.xml || fa fa-sitemap
  # commonweal: /404/ || fa fa-heartbeat
```

运行过程：
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ hexo new page tags
INFO  Validating config
INFO  ==================================
  ███╗   ██╗███████╗██╗  ██╗████████╗
  ████╗  ██║██╔════╝╚██╗██╔╝╚══██╔══╝
  ██╔██╗ ██║█████╗   ╚███╔╝    ██║
  ██║╚██╗██║██╔══╝   ██╔██╗    ██║
  ██║ ╚████║███████╗██╔╝ ██╗   ██║
  ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝   ╚═╝
========================================
NexT version 8.8.2
Documentation: https://theme-next.js.org
========================================
INFO  Created: G:\Blog\blog_new\source\tags\index.md

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ ls
_config.next.yml  _config.yml  db.json  node_modules/  package.json  package-lock.json  scaffolds/  source/  themes/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ ls source/
_posts/  categories/  images/  tags/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new

```

#### Tagcloud标签云
```yml G:\Blog\blog_new\_config.next.yml
# TagCloud settings for tags page.
tagcloud:
  min: 12 # Minimum font size in px
  max: 30 # Maximum font size in px
  amount: 200 # Total amount of tags
  orderby: name # Order of tags
  order: 1 # Sort order
```

### 添加Categories页面
#### 插件hexo-generator-category
Categories页面是`hexo-generator-category`这个插件提供的功能。这个插件在hexo init站点的时候就已经安装好了。我们不用自己去安装。
#### 创建categories目录
进入站点目录，输入如下命令：
```
hexo new page categories
```
这个命令将会在站点的`source/`目录下生成一个`categories/`目录。并在`categories/`目录中生成一个index.md的文件。
该index.md文件的内容如下：

![image-20211220124222735](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20211220124222.png)


命令运行效果如下所示：
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ ls
_config.next.yml  _config.yml  db.json  node_modules/  package.json  package-lock.json  public/  scaffolds/  source/  themes/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ ls source/
_posts/  images/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ hexo new page categories
INFO  Validating config
INFO  ==================================
  ███╗   ██╗███████╗██╗  ██╗████████╗
  ████╗  ██║██╔════╝╚██╗██╔╝╚══██╔══╝
  ██╔██╗ ██║█████╗   ╚███╔╝    ██║
  ██║╚██╗██║██╔══╝   ██╔██╗    ██║
  ██║ ╚████║███████╗██╔╝ ██╗   ██║
  ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝   ╚═╝
========================================
NexT version 8.8.2
Documentation: https://theme-next.js.org
========================================
INFO  Created: G:\Blog\blog_new\source\categories\index.md

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ ls source/
_posts/  categories/  images/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new

```
进入categories/目录，打开里面的index.md文件，在其中加上：
```
type: categories
```
如下所示：

```md G:\Blog\blog_new\source\categories\index.md
---
title: categories
date: 2021-12-20 12:35:59
type: categories
---
```
如果没有加上type: categories，则categories页面讲不会显示内容。
#### 在next配置文件中打开categories/页面
打开next的配置文件，找到`menu:`，取消`categories:`项的注释
```yml
# Usage: `Key: /link/ || icon`
# Key is the name of menu item. If the translation for this item is available, the translated text will be loaded, otherwise the Key name will be used. Key is case-sensitive.
# Value before `||` delimiter is the target link, value after `||` delimiter is the name of Font Awesome icon.
# External url should start with http:// or https://
menu:
  home: / || fa fa-home
  #about: /about/ || fa fa-user
  # tags: /tags/ || fa fa-tags
  categories: /categories/ || fa fa-th
  # archives: /archives/ || fa fa-archive
  #schedule: /schedule/ || fa fa-calendar
  #sitemap: /sitemap.xml || fa fa-sitemap
  #commonweal: /404/ || fa fa-heartbeat
```
### 谷歌日历
https://theme-next.js.org/docs/theme-settings/custom-pages.html#Adding-Google-Calendar-Page

### 添加自定义404页面
https://theme-next.js.org/docs/theme-settings/custom-pages.html#Custom-404-Page
#### 创建404页面
进入hexo站点根目录，输入如下命令创建404页面：
```
hexo new page 404
```
#### 关闭hexo的relative_link
打开hexo的配置文件，把relative_link设置为false：
```yml G:\Blog\blog_new\_config.yml
relative_link: false
```
是否支持重定向到404页面，需要托管hexo站点的网站的支持。这个是hexo无法决定的。
### 站点地图
#### 安装hexo-generator-sitemap插件

#### 编辑404/index.md页面

```md G:\Blog\blog_new\source\404\index.md
---
title: '404'
date: 2014-12-22 12:39:04
comments: false
---
<script src="//qzonestyle.gtimg.cn/qzone/hybrid/app/404/search_children.js"
        charset="utf-8" homePageUrl="/" homePageName="Back to home">
</script>
```
#### 打开next主题的404菜单项
打开next主题的配置文件，取消404菜单项的注释：
```yml G:\Blog\blog_new\_config.next.yml
menu:
  home: / || fa fa-home
  #about: /about/ || fa fa-user
  # tags: /tags/ || fa fa-tags
  #categories: /categories/ || fa fa-th
  # archives: /archives/ || fa fa-archive
  #schedule: /schedule/ || fa fa-calendar
  #sitemap: /sitemap.xml || fa fa-sitemap
  commonweal: /404/ || fa fa-heartbeat
```

## 动态子菜单
动态子菜单可在next主题的配置文件的menu:下设置，如下所示
```yml G:\Blog\blog_new\_config.next.yml
menu:
  home: / || fa fa-home
  archives: /archives/ || fa fa-archive
  Docs:
    default: /docs/ || fa fa-book
    Getting Started:
      default: /getting-started/ || fa fa-flag
      Installation: /installation.html || fa fa-download
      Configuration: /configuration.html || fa fa-wrench
    Third Party Services:
      default: /third-party-services/ || fa fa-puzzle-piece
      Math Equations: /math-equations.html || fa fa-square-root-alt
      Comment Systems: /comments.html || fa fa-comment-alt
```
## 侧边栏设置 Sidebar Setting
https://theme-next.js.org/docs/theme-settings/sidebar.html
### 侧边栏样式
https://theme-next.js.org/docs/theme-settings/sidebar.html#Sidebar-Style
#### 侧边栏位置
```yml G:\Blog\blog_new\_config.next.yml
sidebar:
  # Sidebar Position.
  # position: left
  position: right
```
#### 侧边栏宽度
Muse和Mist默认宽度是320px,和Pisces和Gemini默认是240px。你可以根据自己的需要进行调整：
```yml G:\Blog\blog_new\_config.next.yml
sidebar:
  ......
  # Manual define the sidebar width. If commented, will be default for:
  # Muse | Mist: 320
  # Pisces | Gemini: 240
  width: 300
```
### 侧边栏显示方式
post → Show sidebar only in posts which have index.
always → Show sidebar in all pages.
hide → Hide it in all pages (but can be opened by user manually).
remove → Remove sidebar totally.
```yml G:\Blog\blog_new\_config.next.yml
sidebar:
  display: post
  #display: always
  #display: hide
  #display: remove

```
### 设置头像
https://theme-next.js.org/docs/theme-settings/sidebar.html#Configuring-Avatar

```yml G:\Blog\blog_new\_config.next.yml
# Sidebar Avatar
avatar:
  # Replace the default image and set the url here.
  url: /images/avatar.gif
  # If true, the avatar will be displayed in circle.
  rounded: true
  # If true, the avatar will be rotated with the cursor.
  rotated: false
```
显示效果如下：

![image-20211220140144634](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20211220140144.png)

### 侧边栏的Posts Categories Tags统计
https://theme-next.js.org/docs/theme-settings/sidebar.html#Sidebar-Site-State

```yml G:\Blog\blog_new\_config.next.yml
# Posts / Categories / Tags in sidebar.
site_state: true
```
显示效果：

![image-20211220142056403](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20211220142056.png)

### 侧边栏的社交链接
https://theme-next.js.org/docs/theme-settings/sidebar.html#Sidebar-Social-Links
```yml G:\Blog\blog_new\_config.next.yml
social:
  GitHub: https://github.com/yourname || fab fa-github
  E-Mail: mailto:yourname@gmail.com || fa fa-envelope
  #Weibo: https://weibo.com/yourname || fab fa-weibo
  #Google: https://plus.google.com/yourname || fab fa-google
  #Twitter: https://twitter.com/yourname || fab fa-twitter
  #FB Page: https://www.facebook.com/yourname || fab fa-facebook
  #StackOverflow: https://stackoverflow.com/yourname || fab fa-stack-overflow
  #YouTube: https://youtube.com/yourname || fab fa-youtube
  #Instagram: https://instagram.com/yourname || fab fa-instagram
  #Skype: skype:yourname?call|chat || fab fa-skype

social_icons:
  enable: true
  icons_only: false
  transition: false
```
显示效果：

![image-20211221110621775](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20211221110621.png)
**点击社交连接，浏览器会以新标签打开这个链接**。

### 侧边栏的站内滚动链接
点击这个链接，浏览器会在当前标签页打开这个链接，之前页面的内容会被覆盖。
```yml G:\Blog\blog_new\_config.next.yml
# Blog rolls
links_settings:
  icon: fa fa-globe
  title: Links
  # Available values: block | inline
  layout: block

links:
  Title: https://example.com
```

显示效果：

![image-20211221110434154](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20211221110441.png)

### 侧栏的文章目录
https://theme-next.js.org/docs/theme-settings/sidebar.html#Sidebar-TOC
```yml G:\Blog\blog_new\_config.next.yml
# Table of Contents in the Sidebar
# Front-matter variable (nonsupport wrap expand_all).
toc:
  enable: true
  # Automatically add list number to toc.
  number: true
  # If true, all words will placed on next lines if header width longer then sidebar width.
  wrap: true
  # If true, all level of TOC in a post will be displayed, rather than the activated part of it.
  expand_all: false
  # Maximum heading depth of generated toc.
  max_depth: 6
```

显示效果：

![image-20211220145140014](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20211220145140.png)

## 站点页脚设置 Footer
https://theme-next.js.org/docs/theme-settings/footer.html

### 站点开始时间
```yml G:\Blog\blog_new\_config.next.yml
footer:
  # Specify the year when the site was setup. If not defined, current year will be used.
  since: 2018
```
### 页脚图标
```yml G:\Blog\blog_new\_config.next.yml
footer:
  ...
  # Icon between year and copyright info.
  icon:
    # Icon name in Font Awesome. See: https://fontawesome.com/icons
    name: fa fa-heart #❤作为图标
    # If you want to animate the icon, set it to true.
    animated: true #图标有动画效果
    # Change the color of icon, using Hex Code.
    color: "#ff0000" #图标的颜色
```
### 网站版权名称
```yml G:\Blog\blog_new\_config.next.yml
footer:
  copyright:
```
如果不设置的话，则显示作者的信息。
### 是否显示网站的构建平台
```yml G:\Blog\blog_new\_config.next.yml
footer:
  powered: true
```
如果设置范位false，则会隐藏页脚下的类似`Powered by Hexo & NexT.Gemini`信息

### 网站备案信息
```yml G:\Blog\blog_new\_config.next.yml
footer:
  beian:
    enable: true
    icp: 京ICP备 1234567890号-1
    gongan_id: 1234567890
    gongan_num: 京公网安备 1234567890号
    gongan_icon_url: /uploads/beian.png

```
## 帖子设置 文章设置
https://theme-next.js.org/docs/theme-settings/posts.html

### 序言文本
在文章中使用`<!-- more -->`显式隔开前言和正文。
### 文章元信息
```yml G:\Blog\blog_new\_config.next.yml
# Post meta display settings
post_meta:
  item_text: true
  created_at: true
  updated_at:
    enable: true
    another_day: true
  categories: true
```
### 文章字数统计
#### 安装插件
进入站点目录，输入如下命令安装字数统计插件：
```
npm install hexo-word-counter
```
#### 在hexo配置文件中配置
```yml G:\Blog\blog_new\_config.yml
# 字数统计插件
## npm install hexo-word-counter
symbols_count_time:
  #在Post Meta部分中的帖子单词的数量
  symbols: true
  #在Post Meta部分中显示帖子的估计读取时间。
  time: true
  #在页脚中显示所有帖子单词的数量。
  total_symbols: true
  #在页脚中读完所有帖子的需要的估计时间。
  total_time: true
  #awl表示一个的单词的平均字符数
  awl: 4
  #wpm是指人每分钟的平均能阅读的单词数。
  wpm: 275
```
#### 在next配置文件中配置
```yml G:\Blog\blog_new\_config.next.yml
symbols_count_time:
  separated_meta: true
  item_text_total: true
```
#### 查看效果
先执行：
hexo clean
然后在执行
hexo s
查看效果

##### 文章meta中的字符统计
![image-20211220211332451](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20211220211332.png)
##### 全站点的字符统计
![image-20211220211011359](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20211220211019.png)

### 捐赠设置
https://theme-next.js.org/docs/theme-settings/posts.html#Donate-Settings

### Follow Me
https://theme-next.js.org/docs/theme-settings/posts.html#Follow-Me
### 相关热门帖子
https://theme-next.js.org/docs/theme-settings/posts.html#Related-Popular-Posts
#### 安装插件
进入后hexo站点目录，安装如下插件
```
npm install hexo-related-popular-posts
```

### Post Edit
https://theme-next.js.org/docs/theme-settings/posts.html#Post-Edit
### 显示上一个帖子和下一个帖子
https://theme-next.js.org/docs/theme-settings/posts.html#Post-Navigation
## 自定义页面
https://theme-next.js.org/docs/theme-settings/custom-pages.html
### 使用存档页作为主页
https://theme-next.js.org/docs/theme-settings/custom-pages.html#Use-Archive-Page-as-Home-Page

这个功能真是把主页和归档页做了调换而已。设置之后原来的主页变成了归档页，原来的归档页则显示主页的内容。
我想要的效果是，使用归档页覆盖掉原来的主页，归档页也还是原来的归档页。而不是调换的效果。

没有达到我想要的效果
### 添加Tags页面
这几个在上面已经介绍过了。
### 添加Categories页面
### 添加 Google Calendar页面

## 杂项主题设置
https://theme-next.js.org/docs/theme-settings/miscellaneous.html
### 预连接
https://theme-next.js.org/docs/theme-settings/miscellaneous.html#Preconnect
### 文本对齐
https://theme-next.js.org/docs/theme-settings/miscellaneous.html#Mobile-Devices-Adaptation
### 移动设备适配
https://theme-next.js.org/docs/theme-settings/miscellaneous.html#Mobile-Devices-Adaptation
### 亮色和深色主题颜色
https://theme-next.js.org/docs/theme-settings/miscellaneous.html#Theme-Color
### 滚动条设置
https://theme-next.js.org/docs/theme-settings/miscellaneous.html#Body-Scrollbar
### 代码块样式

#### 代码块赋值按钮
```yml G:\Blog\blog_new\_config.next.yml
codeblock:
  # Code Highlight theme
  # All available themes: https://theme-next.js.org/highlight/
  theme:
    light: default
    dark: tomorrow-night
  prism:
    light: prism
    dark: prism-dark
  # Add copy button on codeblock
  copy_button:
    enable: true
    # Available values: default | flat | mac
    style:
```
### 返回顶部按钮
https://theme-next.js.org/docs/theme-settings/miscellaneous.html#Back-To-Top
```yml G:\Blog\blog_new\_config.next.yml
back2top:
  enable: true
  # Back to top in sidebar.
  sidebar: true
  # Scroll percent label in b2t button.
  scrollpercent: true
```
### 阅读进度 显示条
https://theme-next.js.org/docs/theme-settings/miscellaneous.html#Reading-Progress
```yml G:\Blog\blog_new\_config.next.yml
# Reading progress bar
reading_progress:
  enable: true
  # Available values: left | right
  start_at: left
  # Available values: top | bottom
  position: top
  reversed: false
  color: "#37c6c0"
  height: 3px
```
### 书签Bookmark
https://theme-next.js.org/docs/theme-settings/miscellaneous.html#Bookmark
下次访问时可以自动滚动到上次的阅读位置。
```yml
# Bookmark Support
bookmark:
  enable: true
  # Customize the color of the bookmark.
  color: "#222"
  # If auto, save the reading progress when closing the page or clicking the bookmark-icon.
  # If manual, only save it by clicking the bookmark-icon.
  save: auto
```
### GitHub横幅
https://theme-next.js.org/docs/theme-settings/miscellaneous.html#GitHub-Banner
在右上角提供`Follow me on GitHub`横幅。

### 字体定制
https://theme-next.js.org/docs/theme-settings/miscellaneous.html#Fonts-Customization

## 搜索引擎优化设置
https://theme-next.js.org/docs/theme-settings/seo.html

### 显示副标题
### 站长工具 网站管理员工具
https://theme-next.js.org/docs/theme-settings/seo.html#Webmaster-Tools


## 国际化
https://theme-next.js.org/docs/theme-settings/internationalization.html

### 设置成中文简体
https://theme-next.js.org/docs/theme-settings/internationalization.html#Choosing-Language
```yml G:\Blog\blog_new\_config.yml
language: zh-CN
```
### 多语言切换
https://theme-next.js.org/docs/theme-settings/internationalization.html#Multilingual-Switcher
```yml G:\Blog\blog_new\_config.yml
language:
  - zh-CN
  - en
```

# next第三方服务
## 数学公式引擎
https://theme-next.js.org/docs/third-party-services/math-equations.html

## 评论系统
https://theme-next.js.org/docs/third-party-services/comments.html

## 在线编辑
https://theme-next.js.org/docs/third-party-services/post-widgets.html

## 统计和分析
### 百度分析
https://theme-next.js.org/docs/third-party-services/statistics-and-analytics.html#Baidu-Analytics-China

```yml G:\Blog\blog_new\_config.next.yml
# Baidu Analytics ID
baidu_analytics: your_id
```
### LeanCloud统计(国内)
https://theme-next.js.org/docs/third-party-services/statistics-and-analytics.html#LeanCloud-China

## 搜索服务
### Local Search
https://theme-next.js.org/docs/third-party-services/search-services.html#Local-Search

#### 安装插件
进入站点根目录，输入如下命令
```
npm install hexo-generator-searchdb
```

#### 在hexo配置文件中添加配置
```yml G:\Blog\blog_new\_config.yml
# Local Search
## Install hexo-generator-searchdb by executing the following command in site root dir: 
## npm install hexo-generator-searchdb
search:
  path: search.xml
  field: post
  content: true
  format: html
```
#### 编辑next配置文件
```yml G:\Blog\blog_new\_config.next.yml
# Local Search
# Dependencies: https://github.com/next-theme/hexo-generator-searchdb
local_search:
  enable: true
  # If auto, trigger search by changing input.
  # If manual, trigger search by pressing enter key or search button.
  trigger: auto
  # Show top n results per article, show all results by setting to -1
  top_n_per_article: 1
  # Unescape html strings to the readable one.
  unescape: false
  # Preload the search data when the page loads.
  preload: false
```

## 聊天服务
https://theme-next.js.org/docs/third-party-services/chat-services.html

## 外部库
https://theme-next.js.org/docs/third-party-services/external-libraries.html
# 高级设置
## 自定义文件
https://theme-next.js.org/docs/advanced-settings/custom-files.html

### 自定义CSS
#### 自定义代码块字体大小
NexT默认的代码块字体大小为`1em;`。当代码块中的代码比较长时，代码块无法全部显示这样代码，当我们阅读的时候就需要频繁拖动底部的滚动条。为了方便阅读，我们可以把代码块中的字体大小调小到`0.875em;`。
在`source/_data`目录下创建`styles.styl`文件
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new/source/_data (master)
$ ls
languages.yml  styles.styl

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new/source/_data (master)
```
然后在里面styles.styl文件中写上你的css代码即可。
例如设置代码块的字体大小：
```css G:\Blog\gongzuo_new\source\_data\styles.styl
// 代码块的字体大小
figure.highlight, pre span{
    font-size: 0.875em;
}
```

# 部署
## 部署到github pages
### 安装插件
在站点根目录中输入如下命令安装插件：
```
npm install hexo-deployer-git --save
```
安装效果如下：
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
$ npm install hexo-deployer-git --save

added 1 package, and audited 263 packages in 3s

16 packages are looking for funding
  run `npm fund` for details

1 moderate severity vulnerability

Some issues need review, and may require choosing
a different dependency.

Run `npm audit` for details.

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
```

### 在hexo配置文件中填写github pages的配置
```yml
# Deployment
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  type: git
  repo: git@github.com:你的用户名/仓库名.git
  # repo: https://gh_token@github.com/lanlan2017/blog.git
  # branch: master #published
  branch: gh-pages #部署的分支
```
### 部署
在站点根目录下输入如下命令：
```
hexo d
```
部署成功效果：
```
 create mode 100644 page/9/index.html
 delete mode 100644 placeholder
 create mode 100644 search.xml
 create mode 100644 tags/index.html
Enumerating objects: 2485, done.
Counting objects: 100% (2485/2485), done.
Delta compression using up to 4 threads
Compressing objects: 100% (1342/1342), done.
Writing objects: 100% (2485/2485), 5.29 MiB | 1.28 MiB/s, done.
Total 2485 (delta 1147), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1147/1147), done.
remote:
remote: GitHub found 1 vulnerability on lanlan2017/blog's default branch (1 moderate). To find out more, visit:
remote:      https://github.com/lanlan2017/blog/security/dependabot/package.json/hexo/open
remote:
To github.com:lanlan2017/blog.git
 + 9c1e805...44e4c22 HEAD -> gh-pages (forced update)
Branch 'master' set up to track remote branch 'gh-pages' from 'git@github.com:lanlan2017/blog.git'.
INFO  Deploy done: git

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new
```
# 替代旧站点
到这里，旧站点已经可以替代了，可以把旧站点blog/删除掉，然后把blog_new/站点重命名为blog_new即可。
## 复制旧站点的.git目录到新站点
如果在blog_new上重新执行git init命令，我还得重新配置git。
为了省事，直接冲旧站点blog/中复制.git目录，粘贴到blog_new/目录中。

然后就可以像原来的站点那样使用git了。
## 创建自定义的dir目录
### 创建dir页面
```
hexo new page dir
```
运行效果：
```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new (master)
$ hexo new page dir
INFO  Validating config
INFO  ==================================
  ███╗   ██╗███████╗██╗  ██╗████████╗
  ████╗  ██║██╔════╝╚██╗██╔╝╚══██╔══╝
  ██╔██╗ ██║█████╗   ╚███╔╝    ██║
  ██║╚██╗██║██╔══╝   ██╔██╗    ██║
  ██║ ╚████║███████╗██╔╝ ██╗   ██║
  ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝   ╚═╝
========================================
NexT version 8.8.2
Documentation: https://theme-next.js.org
========================================
INFO  Created: G:\Blog\blog_new\source\dir\index.md

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new (master)
```
### 编写dir页面
编写`G:\Blog\blog_new\source\dir\index.md`文件
### 在menu中添加dir页面和图标
```yml G:\Blog\blog_new\_config.next.yml
menu:
  home: / || fa fa-home
  #about: /about/ || fa fa-user
  dir: /dir/ || fa fa-sitemap
  categories: /categories/ || fa fa-th
  archives: /archives/ || fa fa-archive
  tags: /tags/ || fa fa-tags
  #schedule: /schedule/ || fa fa-calendar
  #sitemap: /sitemap.xml || fa fa-sitemap
  # commonweal: /404/ || fa fa-heartbeat
```
### 给dir页面提供翻译
https://theme-next.js.org/docs/theme-settings/internationalization.html#Override-Default-Translations
#### 创建文件source/_data/languages.yml
在`source/`目录下创建_`data/`目录，并在_`data/`目录中创建`languages.yml`文件：

```
18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new (master)
$ ls
_config.next.yml  db.json        HexoD.bat  HexoSTest.bat  package.json       public/     source/           themes/
_config.yml       FM.properties  HexoS.bat  node_modules/  package-lock.json  scaffolds/  StartWriting.bat

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new (master)
$ mkdir source/_data

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new (master)
$ ls source/
_data/  _posts/  categories/  dir/  images/  tags/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new (master)
$ cd source/_data/

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new/source/_data (master)
$ touch languages.yml

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new/source/_data (master)
$ ls
languages.yml

18190@DESKTOP-SH3MQPI MINGW64 /g/Blog/blog_new/source/_data (master)
```
#### 编辑languages.yml
```yml G:\Blog\blog_new\source\_data\languages.yml
# language
zh-CN:
  menu:
    dir: 目录
en:
  menu:
    dir: directories #directory #
```
### 查看效果
输入hexo s,效果如下图：

![image-20211221155312596](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20211221155313.png)
