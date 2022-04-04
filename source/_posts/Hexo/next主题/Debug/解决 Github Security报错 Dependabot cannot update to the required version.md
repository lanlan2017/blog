---
title: 解决 Github Security报错 Dependabot cannot update to the required version
categories: 
  - Hexo
  - next主题
  - Debug
abbrlink: c9d9ee7
date: 2020-06-25 01:33:18
updated: 2022-04-04 15:56:38
---
# 问题描述
<pre>
Dependabot cannot update to the required version
View details about this error or learn more about Dependabot security updates.

1 kind-of vulnerability found in **package-lock.json** on 3 Apr
**Remediation**
Upgrade **kind-of** to version **6.0.3** or later. For example:
```
"dependencies": {
  "kind-of": ">=6.0.3"
}
```
or…
```
"devDependencies": {
  "kind-of": ">=6.0.3"
}
```
Always verify the validity and compatibility of suggestions with your codebase.
</pre>

# 分析
大概是说**package-lock.json**文件中的kind-of依赖项版本太低,让我修改到6.0.3版本以上.
但是我打开**package-lock.json**这个文件查看了一下,各种依赖项密密麻麻,我是不能看手动去一个一个更改的.
# 解决方案
我们知道,这个**package-lock.json**文件是,npm install安装的时候自动生成的.
我如果重新安装一遍,会自动生成这个**package-lock.json**文件.
## 具体做法
将目录`node_modules/`和文件`package-lock.json`删除掉,保留`package.json`文件,然后执行`npm install`命令重新安装插件即可:
### 删除node_modules目录和package-lock.json文件
删除之前的站点目录:
<pre>
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog (master)
$ ls
_admin-config.yml  FM.properties  HexoS.sh*      <mark>node_modules/</mark>      scaffolds/        themes/
_config.yml        HexoD.bat      HexoSTest.bat  package.json       source/
db.json            HexoS.bat      KillBlog.sh    <mark>package-lock.json</mark>  StartWriting.bat
</pre>
删除后的站点目录:
<pre>
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog (master)
$ ls
_admin-config.yml  db.json        HexoD.bat  HexoS.sh*      KillBlog.sh   scaffolds/  StartWriting.bat
_config.yml        FM.properties  HexoS.bat  HexoSTest.bat  package.json  source/     themes/
</pre>
### 重新安装package.json中的插件
```shell
npm install
```
安装之后:
<pre>
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog (master)
$ ls
_admin-config.yml  FM.properties  HexoS.sh*      <mark>node_modules/</mark>      scaffolds/        themes/
_config.yml        HexoD.bat      HexoSTest.bat  package.json       source/
db.json            HexoS.bat      KillBlog.sh    <mark>package-lock.json</mark>  StartWriting.bat
</pre>
可以看到`package-lock.json`文件又回来了,里面的依赖版本也都更新到最新的版本了.
# 推送到Github
```
git add .
git commit
```
刷新GitHub仓库页面,可以看到上面的**Security警告**消失了。
