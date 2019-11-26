---
title: travis-ci自动部署
categories: 
  - Hexo搭建
  - Hexo搭建博客
  - 自动部署
date: 2019-11-05 10:29:38
updated: 2019-11-25 00:23:43
abbrlink: 13f63c39
---
<div id='my_toc'>

- [获取Token](/blog/13f63c39/#获取Token)
- [配置Token](/blog/13f63c39/#配置Token)
    - [一般的地址格式](/blog/13f63c39/#一般的地址格式)
    - [使用Token的地址格式](/blog/13f63c39/#使用Token的地址格式)
- [修改站点配置文件中仓库的地址](/blog/13f63c39/#修改站点配置文件中仓库的地址)
- [书写正确的.travis.yml](/blog/13f63c39/#书写正确的-travis-yml)
- [推送后自动部署](/blog/13f63c39/#推送后自动部署)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# 获取Token
省略
# 配置Token
travis-ci上登陆github，然后开启要监控的仓库，在仓库上配置获取到的Token
过程省略，网上一大堆，主要是最后.travis.yml书写的问题。
## 一般的地址格式
```
https://github.com/lanlan2017/exam.git
```
## 使用Token的地址格式
```
https://gh_token@github.com/lanlan2017/exam.git 
```
Token要写在域名`github.com`的前面并用@这个符号隔开
# 修改站点配置文件中仓库的地址
将hexo站点配置文件中的仓库地址改成如下形式
```yml
 # Deployment
 ## Docs: https://hexo.io/docs/deployment.html
deploy:
  type: git
  repo: https://gh_token@github.com/lanlan2017/exam.git 
  branch: gh-pages #published
  # message: [message]
```
其中`gh_token`是一个占位符，方便后续使用真正的token填充。你可换成其他字符。
# 书写正确的.travis.yml
这里使用原来的hexo  d进行发布，配置如下。

```shell
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
# 推送后自动部署
```shell
git add
git commit -m '自动部署'
git pull origin master
```
