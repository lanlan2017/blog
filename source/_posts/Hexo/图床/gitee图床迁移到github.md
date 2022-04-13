---
title: gitee图床迁移到github
categories: 
  - Hexo
  - 图床
abbrlink: 5f98afec
date: 2022-04-12 16:14:32
updated: 2022-04-13 09:32:17
---
# gitee图床已经无法使用

gitee给图片加防盗链了，搭建在gitee pages的文章可以访问gitee仓库中的图片。但是github pages上的文章就无法访问gitee仓库中的图片了。

我之前把图片放到gitee中是因为gitee上的图片访问速度快,github仓库中的图片比较慢，而且经常被墙。

不过现在的情况是gitee用不了，github勉强可以用（修改host或者加速器）

所以还是把gitee上的图床仓库迁移到github上。
<!-- more -->

# github上无同名仓库时

此时直接使用github的import功能，导入gitee的仓库即可，然后新仓库名可与gitee的仓库名相同。

![image-20220413150718425](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20220413150718.png)

# github上有同名仓库时

我的新旧文章使用两个不同的图床。

我的一些旧的文章中的图片使用的是github上的images仓库中的图片。

后来我嫌弃github访问慢且被墙，所以我就到gitee上创建了一个同名的仓库，并把新的文章图片放在gitee上。

又因为当时懒得批量修改旧文章中的图片链接，所以旧文章中就继续使用github仓库的图片。

## import时换一个仓库名

![image-20220413145816797](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20220413145826.png)

## 合并到github同名仓库中

github的import功能无法导入到已有的仓库中。

可以先把gitee仓库和github仓库在本地合并好之后，再推送到github上。

### 下载gitee上的图床仓库

#### 无法使用git clone下载

我使用`git clone`命令好像无法下载gitee上的仓库，只下载`.git`目录，**图片没有下载下来，命令就结束了**，不知道哪里有问题。

#### 打包成zip下载

![image-20220413095024](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum2022/20220413095024.png)

![image-20220413110627661](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20220413110634.png)



### 下载github上的图床仓库

#### 使用git clone下载

使用`git clone`命令下载github上的图床仓库

使用git clone命令下载时，git会给我们建立本地与github远程仓库的联系。我们合并后再推送会github会更简单。



继续以压缩包方式下载github上的图库仓库

![image-20220413130911664](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20220413130911.png)


下载好两个压缩包后，解压到本地。

![image-20220413133953129](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20220413134026.png)

### 合并到本地github仓库

复制gitee本地仓库中的所有文件和目录

![image-20220413134151026](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20220413134151.png)

进入github本地仓库，然后粘贴。

**如果遇到重复的文件，则选择跳过**。

![image-20220413134234111](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20220413134234.png)

这样就算合并好了，由于都是图片，也没什么不会出现冲突。

### 推送到github

粘贴好之后，git add,git commit,然后把github本地仓库推送到github上。

# 批量替换图片地址

使用vscode打开hexo存放文章的根目录`_post`，点击侧边栏的查找按钮，全局查找`](https://gitee.com/用户名/仓库名/raw/`,替换为`](https://raw.githubusercontent.com/用户名/仓库名/`。

之所以在地址前面多加上`](`这两个字符，是因为图片的格式为`![提示文本](地址)`多加上这两个字符可以确保替换的是图片的地址，而不会替换其他的链接地址。

# 查看图片加载是否正常

修改好所有的图片地址后，执行`hexo s`命令，启动本地服务器。然后打开浏览器检查文章是否能正确加载图片。

如果不可以，那应该是被墙了。可以使用加速器解决（如：网易UU加速器，Steam++等）



# 其他情况

## 无法推送

我在使用`git push origin master`推送到远程时报错如下：

```
Updates were rejected because the tip of your current branch is behind
```

### 解决方案

先拉取远程到本地：

```bash
git pull origin master
```

不过我在推送到远程时，还是报错：

```
refusing to merge unrelated histories
```

执行：

```bash
git pull origin master --allow-unrelated-histories
```

通常执行这个命令后会有冲突，不过因为仓库里吗放的都是图片。没有什么冲突要解决。

可以直接推送到远程

```bash
git push origin master:master
```

## 强制推送

如果还是无法推送，可以使用强制推送。使用强制推送将会丢失以前的commit信息，但是因为是图库，我们只需要图片的地址，commit信息并不重要，丢失了就丢失吧

```bash
git push -f origin master
```



# 参考资料

https://blog.csdn.net/weixin_46015333/article/details/123336711

