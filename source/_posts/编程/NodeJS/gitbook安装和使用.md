---
title: gitbook安装和使用
categories: 
  - NodeJS
abbrlink: a7b54d2e
date: 2020-10-11 08:16:58
updated: 2022-04-04 00:51:45
---
# gitbook安装和使用
## 安装低于v10.21.0版本的node.js
我之前用的是12.x版本的LTS办的nodejs,但是在安装gitbook的时候,有如下报错:

经过一段排查之后,我发现gitbook不支持高版本的node.js,

## 安装gitbook
```bash
npm install gitbook-cli -g
```

运行效果:
```
E:\Blog\MyGitBook>node -v
v10.21.0

E:\Blog\MyGitBook>npm install gitbook-cli -g
E:\Program Files\nodejs\npm_global\gitbook -> E:\Program Files\nodejs\npm_global\node_modules\gitbook-cli\bin\gitbook.js
+ gitbook-cli@2.3.2
updated 3 packages in 15.526s
```

此时并没有安装完毕,输入如下命令继续安装:
```bash
gitbook -V
```

运行效果:
```
E:\Blog\MyGitBook>gitbook -V
CLI version: 2.3.2
Installing GitBook 3.2.3
gitbook@3.2.3 C:\Users\lan\AppData\Local\Temp\tmp-12016inN44NmImh8T\node_modules\gitbook
├── escape-html@1.0.3
├── escape-string-regexp@1.0.5
├── destroy@1.0.4
├── 省略。。。。。。。。。。。。。。。。。。。。
commander@2.9.0, cross-spawn-async@2.2.5, web-resource-inliner@2.0.0)
└── nunjucks@2.5.2 (asap@2.0.6, yargs@3.32.0, chokidar@1.7.0)
GitBook version: 3.2.3
```

## 初始化
```bash
gitbook init
```

运行效果:
```
E:\Blog\MyGitBook>gitbook init
warn: no summary file in this book
info: create README.md
info: create SUMMARY.md
info: initialization is finished
```

这将会生成两个文件:README.md和SUMMARY.md：
```
E:\Blog\MyGitBook>mytree f
E:\Blog\MyGitBook
├─README.md
└─SUMMARY.md
```

其中,README.md中存放的时候书的简介,SUMMARY.md文件中存放的是书的目录.
## 编写目录
```md README.md
&#35; Introduction

这是我的第一本GitBook
```

## 编写目录
```md SUMMARY.md
&#35; Summary

- [Introduction](README.md)
- [第1章 Hello](Chapter1/README.md)
  - [1.1 xxxx](Chapter1/xxxx.md)
  - [1.2 yyyy](Chapter1/yyyy.md)
  - [1.3 zzzz](Chapter1/zzzz.md)
- [第2章 World](Chapter2/README.md)
  - [2.1 xxxx](Chapter2/xxxx.md)
  - [2.2 yyyy](Chapter2/yyyy.md)
  - [2.3 zzzz](Chapter2/zzzz.md)
  - [2.2 iiii](Chapter2/iiii.md)
  - [2.3 jjjj](Chapter2/jjjj.md)
  - [2.3 kkkk](Chapter2/kkkk.md)

```

## 再次初始化
```bash
gitbook init
```

运行效果:
```
E:\Blog\MyGitBook>gitbook init
info: create Chapter2/README.md
info: create Chapter2/xxxx.md
info: create Chapter2/yyyy.md
info: create Chapter2/zzzz.md
info: create Chapter2/iiii.md
info: create Chapter2/jjjj.md
info: create Chapter2/kkkk.md
info: create SUMMARY.md
info: initialization is finished
```

此时的项目结构如下:
```
E:\Blog\MyGitBook>mytree f
E:\Blog\MyGitBook
├─Chapter1\
│ ├─iiii.md
│ ├─jjjj.md
│ ├─kkkk.md
│ ├─README.md
│ ├─xxxx.md
│ ├─yyyy.md
│ └─zzzz.md
├─Chapter2\
│ ├─iiii.md
│ ├─jjjj.md
│ ├─kkkk.md
│ ├─README.md
│ ├─xxxx.md
│ ├─yyyy.md
│ └─zzzz.md
├─README.md
└─SUMMARY.md
```

继续在上面生成的新文件中编写一些内容
## 启动本地服务器
```bash
gitbook serve
```
运行效果:
```
E:\Blog\MyGitBook>gitbook serve
Live reload server started on port: 35729
Press CTRL+C to quit ...

info: 7 plugins are installed
info: loading plugin "livereload"... OK
info: loading plugin "highlight"... OK
info: loading plugin "search"... OK
info: loading plugin "lunr"... OK
info: loading plugin "sharing"... OK
info: loading plugin "fontsettings"... OK
info: loading plugin "theme-default"... OK
info: found 12 pages
info: found 14 asset files
info: >> generation finished with success in 1.7s !

Starting server ...
Serving book on http://localhost:4000
```

## 打包文档
## 生成电子书
## 配置文件book.json
# gitbook插件
## 插件官网
[https://plugins.gitbook.com/plugin/](https://plugins.gitbook.com/plugin/)

## 安装和使用插件方法
在根目录下创建book.json配置文件,在配置文件中按照指定格式插入插件对应的代码。

安装插件有两种方式 ：
- 一种是在book.json写入相应插件和配置后，使用gitbook install命令,进行全局安装
- 一种是使用npm install gitbook-plugin-插件名,单独安装。
## hide-element 隐藏元素
主要用来隐藏不想看到的元素。
如：默认的gitbook左侧提示：Published with GitBook

使用方式： 在book.json中写入以下内容:
```json book.json
{
    "plugins": [
        "hide-element"
    ],
    "pluginsConfig": {
        "hide-element": {
            "elements": [".gitbook-link"]
        }
    }
}
```
然后运行gitbook install命令进行安装,安装效果如下:
```bash
$ gitbook install
info: installing 1 plugins using npm@3.9.2
info:
info: installing plugin "hide-element"
info: install plugin "hide-element" (*) from NPM with version 0.0.4
E:\Blog\MyGitBook
`-- gitbook-plugin-hide-element@0.0.4

info: >> plugin "hide-element" installed with success
```
## back-to-top-button 回到顶部
当文章篇幅较长时，页面底部会显示按钮，一键点击自动回到顶部。
```json
{
    "plugins": [
        "hide-element",
        "back-to-top-button"
    ],
    "pluginsConfig": {
        "hide-element": {
            "elements": [".gitbook-link"]
        }
    }
}
```
## chapter-fold 导航目录折叠
gitbook默认目录没有折叠效果。
## code 复制代码
在代码域的右上角添加一个复制按钮，点击一键复制代码。
```json
{
    "plugins": [
        "hide-element",
        "back-to-top-button",
        "code"
    ],
    "pluginsConfig": {
        "hide-element": {
            "elements": [".gitbook-link"]
        }
    }
}
```
## splitter 侧边栏宽度可调节
左侧目录和右侧文章可以拖动调节宽度。
```json
{
    "plugins": [
        "hide-element",
        "back-to-top-button",
        "code",
        "splitter"
    ],
    "pluginsConfig": {
        "hide-element": {
            "elements": [".gitbook-link"]
        }
    }
}
```
## search-pro 高级搜索
支持中英文，准确率更高一些。
```json
{
    "plugins": [
        "hide-element",
        "back-to-top-button",
        "code",
        "splitter",
        "-lunr", 
        "-search", 
        "search-pro"
    ],
    "pluginsConfig": {
        "hide-element": {
            "elements": [".gitbook-link"]
        }
    }
}
```
## insert-logo 插入logo
在左侧导航栏上方插入logo。url支持本地图片也支持网络图片链接
```json
{
    "plugins": [
        "hide-element",
        "back-to-top-button",
        "code",
        "splitter",
        "-lunr", 
        "-search", 
        "search-pro",
        "insert-logo"
    ],
    "pluginsConfig": {
        "hide-element": {
            "elements": [".gitbook-link"]
        },
        "insert-logo": {
            "url": "images/logo.png",
            "style": "background: none; max-height: 30px; min-height: 30px"
        }
    }
}
```
## custom-favicon 修改标题栏图标
设置浏览器选项卡标题栏的小图标。
注意只支持ico后缀的图片，并且只支持本地图片，不支持网络图片链接。
```json
{
    "plugins": [
        "hide-element",
        "back-to-top-button",
        "code",
        "splitter",
        "-lunr", 
        "-search", 
        "search-pro",
        "insert-logo",
        "custom-favicon"
    ],
    "pluginsConfig": {
        "hide-element": {
            "elements": [".gitbook-link"]
        },
        "insert-logo": {
            "url": "images/logo.png",
            "style": "background: none; max-height: 30px; min-height: 30px"
        },
        "favicon": "icon/favicon.ico"
    }
}
```
## pageview-count 阅读量计数
记录每个文章页面被访问的次数。
```json
{
    "plugins": [
        "hide-element",
        "back-to-top-button",
        "code",
        "splitter",
        "-lunr", 
        "-search", 
        "search-pro",
        "insert-logo",
        "custom-favicon",
        "pageview-count"
    ],
    "pluginsConfig": {
        "hide-element": {
            "elements": [".gitbook-link"]
        },
        "insert-logo": {
            "url": "images/logo.png",
            "style": "background: none; max-height: 30px; min-height: 30px"
        },
        "favicon": "icon/favicon.ico"
    }
}
```
## tbfed-pagefooter 页面添加页脚
在每个文章下面标注版权信息和文章时间。
```json
{
    "plugins": [
        "hide-element",
        "back-to-top-button",
        "code",
        "splitter",
        "-lunr", 
        "-search", 
        "search-pro",
        "insert-logo",
        "custom-favicon",
        "pageview-count",
        "tbfed-pagefooter"
    ],
    "pluginsConfig": {
        "hide-element": {
            "elements": [".gitbook-link"]
        },
        "insert-logo": {
            "url": "images/logo.png",
            "style": "background: none; max-height: 30px; min-height: 30px"
        },
        "favicon": "icon/favicon.ico",
        "tbfed-pagefooter": {
            "copyright":"Copyright &copy dsx2016.com 2019",
            "modify_label": "该文章修订时间：",
            "modify_format": "YYYY-MM-DD HH:mm:ss"
        }
    }
}
```
## popup 弹出大图
点击可以在新窗口展示图片。
```json
{
    "plugins": [
        "hide-element",
        "back-to-top-button",
        "code",
        "splitter",
        "-lunr", 
        "-search", 
        "search-pro",
        "insert-logo",
        "custom-favicon",
        "pageview-count",
        "tbfed-pagefooter",
        "popup",
    ],
    "pluginsConfig": {
        "hide-element": {
            "elements": [".gitbook-link"]
        },
        "insert-logo": {
            "url": "images/logo.png",
            "style": "background: none; max-height: 30px; min-height: 30px"
        },
        "favicon": "icon/favicon.ico",
        "tbfed-pagefooter": {
            "copyright":"Copyright &copy dsx2016.com 2019",
            "modify_label": "该文章修订时间：",
            "modify_format": "YYYY-MM-DD HH:mm:ss"
        }
    }
}
```
## sharing-plus 分享当前页面
gitbook默认只有Facebook、Google+、Twiter、Weibo、Instapaper

插件可以有更多分享方式，也可以关闭指定分享方式。
```json
{
    "plugins": [
        "hide-element",
        "back-to-top-button",
        "code",
        "splitter",
        "-lunr",
        "-search",
        "search-pro",
        "insert-logo",
        "custom-favicon",
        "pageview-count",
        "tbfed-pagefooter",
        "popup",
        "-sharing",
        "sharing-plus"
    ],
    "pluginsConfig": {
        "hide-element": {
            "elements": [".gitbook-link"]
        },
        "insert-logo": {
            "url": "images/logo.png",
            "style": "background: none; max-height: 30px; min-height: 30px"
        },
        "favicon": "icon/favicon.ico",
        "tbfed-pagefooter": {
            "copyright": "Copyright &copy dsx2016.com 2019",
            "modify_label": "该文章修订时间：",
            "modify_format": "YYYY-MM-DD HH:mm:ss"
        },
        "sharing": {
            "douban": true,
            "facebook": true,
            "google": true,
            "pocket": true,
            "qq": true,
            "qzone": true,
            "twitter": true,
            "weibo": true,
            "all": [
                "douban", "facebook", "google", "instapaper", "linkedin", "twitter", "weibo",
                "messenger", "qq", "qzone", "viber", "whatsapp"
            ]
        }

    }
}
```
## Prism 代码高亮
使用 Prism.js 为语法添加高亮显示，需要将 highlight 插件去掉。该插件自带的主题样式较少，可以再安装 prism-themes 插件，里面多提供了几种样式，具体的样式可以参考 这里，在设置样式时要注意设置 css 文件名，而不是样式名。
[Prism 插件地址](https://plugins.gitbook.com/plugin/prism) 
[prism-themes 插件地址](https://plugins.gitbook.com/plugin/prism-themes)
```json book.json
{
    "plugins": [
        "-highlight",
        "prism",
        "prism-themes"
    ],
    "pluginsConfig": {
        "prism": {
            "css": [
                "prismjs/themes/prism-solarizedlight.css"
            ]
        }
    }
}
```
### 如何切换样式
#### 查看样式效果
[https://github.com/PrismJS/prism-themes#available-themes](https://github.com/PrismJS/prism-themes#available-themes)
### prism样式的本地css文件路径
`gitbook install`安装完毕后,样式已经保存在项目路径下的`node_modules\prism-themes\themes`路径下了:
```
E:\Blog\MyGitBook\node_modules\prism-themes\themes>mytree f
E:\Blog\MyGitBook\node_modules\prism-themes\themes
├─prism-a11y-dark.css
├─prism-atom-dark.css
├─prism-base16-ateliersulphurpool.light.css
├─prism-cb.css
├─prism-darcula.css
├─prism-dracula.css
├─prism-duotone-dark.css
├─prism-duotone-earth.css
├─prism-duotone-forest.css
├─prism-duotone-light.css
├─prism-duotone-sea.css
├─prism-duotone-space.css
├─prism-ghcolors.css
├─prism-hopscotch.css
├─prism-material-dark.css
├─prism-material-light.css
├─prism-material-oceanic.css
├─prism-nord.css
├─prism-pojoaque.css
├─prism-shades-of-purple.css
├─prism-synthwave84.css
├─prism-vs.css
├─prism-vsc-dark-plus.css
└─prism-xonokai.css
```
去掉前面的使用相对于node_modules目录的相对路径即可使用该css文件,例如如果你想使用VS样式(vscode)的css文件相对于node_modules的路径为:prism-themes\themes\prism-vs.css,则路径为:
```
"prism-themes/themes/prism-vs.css"
```
即可定位到该CSS文件
也就是将上面的book.json改成:
```json
{
    "plugins": [
        "-highlight",
        "prism",
        "prism-themes"
    ],
    "pluginsConfig": {
        "prism": {
            "css": [
                "prism-themes/themes/prism-vs.css"
            ]
        }
    }
}
```
即可使用该CSS。
## 添加github图标
```json
"plugins": [
    "github"
],
"pluginsConfig": {
    "github": {
        "url": "https://github.com/你的地址"
    }
}
```
## 数学公式 KaTex
为了支持数学公式, 我们可以使用KaTex和MathJax插件, 官网上说Katex速度要快于MathJax

MathJax使用LaTeX语法编写数学公式教程
# 参考资料

[https://blog.csdn.net/Lowerce/article/details/107579261](https://blog.csdn.net/Lowerce/article/details/107579261)
[https://www.npmjs.com/package/gitbook](https://www.npmjs.com/package/gitbook)
[GitBook 插件](http://gitbook.zhangjikai.com/plugins.html)
[推荐12个实用的gitbook插件](https://juejin.im/post/6844903865146441741)
[https://www.npmjs.com/search?q=gitbook-plugin](https://www.npmjs.com/search?q=gitbook-plugin)
