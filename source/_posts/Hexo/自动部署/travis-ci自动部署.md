---
title: travis-ci自动部署
categories: 
  - Hexo
  - 自动部署
date: 2019-11-05 10:29:38
updated: 2019-12-09 19:55:22
abbrlink: 13f63c39
---
# 获取Token
登陆Github,然后获取token,网上教程一堆。省略
# 配置Token
`travis-ci`上登陆`github`，然后开启要监控的仓库，在仓库上配置获取到的`Token`
过程省略，网上一大堆.

# hexo d部署地址和.travis.yml书写的问题
`Github Pages`有两种:
- 一种是基于用户的`Github Pages`:
    - 这个仓库的名称为`用户名.`github.io`,
    - 每个用户只能创建一个
    - 这个`Github pages`的域名为:`https://`用户名.`github.io/`
    - 这个`Github pages`默认部署在`master`分支上.
- 一种是基于仓库的`Github Pages`:
    - 这仓库名可以随意,
    - 你可以创建多个仓库,然后在多个仓库上开启`Github Pages.`
    - 这种`Github Pages`的域名为:`https://`用户名.`github.io/`仓库名/`
    - 这种`GitHub Pages`默认部署在`gh-pages`分支上


## 基于项目的Github Pages的写法
Github允许在每个项目的gh-pages分支上开启GitHub Pages,将,
### 站点配置文件中仓库地址的写法
```yml
  # Deployment
  ## Docs: https://hexo.io/docs/deployment.html
  deploy:
    type: git
    repo: https://gh_token@github.com/lanlan2017/blog.git # 实际项目地址,不需要是xxxx.github.io
    branch: gh-pages #基于项目的github pages默认搭建在gh-pages分支上
```
其中`gh_token`是一个占位符，方便后续使用真正的token填充。你可换成其他字符。
### 正确的.travis.yml
`travis-ci`中使用原来的`hexo d`进行发布，`.travis.yml`书写如下:
```yml
  language: node_js

  node_js: stable  # 要安装的node版本为当前的稳定版

  cache:
    directories:
    - node_modules # 要缓存的文件夹

  install:                      # 在安装项目环境阶段需要运行的命令，一条一行，类似的还有 before_install
    - npm install               # 安装 package.json 中的依赖

  script:                       # 在构建阶段需要运行的命令，一条一行，类似的还有 before_script、after_script
    - hexo generate             # Hexo 常规命令，执行清理和生成
  
  # 设置git提交名，邮箱；替换真实token到_config.yml文件，最后depoy部署
  after_script:
    - git config user.name "lanlan2017"
    - git config user.email "18251956727@163.com"
    # 替换同目录下的_config.yml文件中gh_token字符串为travis后台刚才配置的变量，注意此处sed命令用了双引号。单引号无效！
    - sed -i "s/gh_token/${GH_TOKEN}/g" ./_config.yml
    - hexo deploy
    
  branches:
  only:
    - master # 触发持续集成的分支
    
```
注意
```shell
sed -i "s/gh_token/${GH_TOKEN}/g" ./_config.yml
```
`GH_TOKEN`就是你设置的token的名字
`${GH_TOKEN}`就是取出变量的值
整个命令的意思，就是将`gh_token`替换成`GH_TOKEN`这个变量的值，也就是替换成真正的token

### 推送到master分支
```shell
git add
git commit -m '自动部署'
git pull origin master
```

## 基于xxxx.github.io仓库的配置
`xxxx.github.io`是基于用户的`github pages`,只可以创建一份.并且**必须构建在`master`分支上**.
配置文件需要修改
### 站点配置文件中仓库地址的写法
```yml
  # Deployment
  ## Docs: https://hexo.io/docs/deployment.html
  deploy:
    type: git
    repo: https://gh_token@github.com/lanlan2017/lanlan2017.github.io.git # 填写上xxxx.github.io的仓库的地址
    branch: master #xxxx.github.io仓库的GitHub Pages必须发布在主分支上
```

### 正确的.travis.yml
由于github pages已经放在master分支上了,我们必须使用其他分支来放博客源码,我这里创建了一个`src`分支来存放博客源码
这样就需要修改`travis-ci`的配置文件`.travis.yml`,在src分支上有变化时,部署博客.
```yml
  language: node_js

  node_js: stable  # 要安装的node版本为当前的稳定版

  cache:
    directories:
    - node_modules # 要缓存的文件夹

  install:                      # 在安装项目环境阶段需要运行的命令，一条一行，类似的还有 before_install
    - npm install               # 安装 package.json 中的依赖

  script:                       # 在构建阶段需要运行的命令，一条一行，类似的还有 before_script、after_script
    - hexo generate             # Hexo 常规命令，执行清理和生成
  
  # 设置git提交名，邮箱；替换真实token到_config.yml文件，最后depoy部署
  after_script:
    - git config user.name "lanlan2017"
    - git config user.email "18251956727@163.com"
    # 替换同目录下的_config.yml文件中gh_token字符串为travis后台刚才配置的变量，注意此处sed命令用了双引号。单引号无效！
    - sed -i "s/gh_token/${GH_TOKEN_Root}/g" ./_config.yml
    - hexo deploy
    
  branches:
  only:
    - src # 触发持续集成的分支
```

### 推送到src分支
```shell
git add
git commit -m '自动部署'
git pull origin src
```
