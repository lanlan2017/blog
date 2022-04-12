---
title: Typora+PicGo+Gitee自动上传图片
categories: 
  - Windows
  - 软件
  - Win10设置
abbrlink: 18408281
date: 2021-07-14 11:39:18
updated: 2022-04-04 00:51:44
---
# 在Gitee网站上创建仓库 创建私人令牌

<!-- Blog/Software/Win10Setting/Typora+Picgo+GiteeAutomaticUploadPictures/ -->
**省略**
# 下载Typora PicGo
https://typora.io/#windows
https://github.com/Molunerfinn/picgo/releases
# PicGo安装gitee插件
![image-20210714123545874](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Software/Win10Setting/Typora+Picgo+GiteeAutomaticUploadPictures/20210714123545.png)

## Gitee插件配置
![image-20210714124204721](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Software/Win10Setting/Typora+Picgo+GiteeAutomaticUploadPictures/20210714124204.png)

# Typora调用PicGo自动上传图片
![image-20210714124709197](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Software/Win10Setting/Typora+Picgo+GiteeAutomaticUploadPictures/20210714124709.png)

## Failed to fetch

如果上面的验证图片上传失败了的话，如下图所示
![image-20210714125534665](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Software/Win10Setting/Typora+Picgo+GiteeAutomaticUploadPictures/20210714125534.png)

### 修改picgo端口号为36677

这是是picgo的服务的端口号和Typora设置的端口号不一样，修改picgo的端口号为36677，让两者一样就行了。
![image-20210714125627646](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Software/Win10Setting/Typora+Picgo+GiteeAutomaticUploadPictures/20210714125627.png)
![image-20210714125720157](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Software/Win10Setting/Typora+Picgo+GiteeAutomaticUploadPictures/20210714125720.png)

### 重启picgo

修改端口号之后，还需要重启picgo，让修改生效：
![image-20210714125905603](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Software/Win10Setting/Typora+Picgo+GiteeAutomaticUploadPictures/20210714125905.png)

### 验证成功效果

这样应该就可以正常上传图片了，验证成功效果如下图所示：
![image-20210714125923507](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Software/Win10Setting/Typora+Picgo+GiteeAutomaticUploadPictures/20210714125923.png)

**粘贴图片到Typora编辑区后，图片会自动上传**

# 参考资料
https://www.jianshu.com/p/4cd14d4ceb1d
https://cloud.tencent.com/developer/article/1801576
https://blog.csdn.net/qq_28988969/article/details/114297273
