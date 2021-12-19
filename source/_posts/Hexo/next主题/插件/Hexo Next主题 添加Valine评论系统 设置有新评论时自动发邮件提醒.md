---
title: Hexo Next主题 添加Valine评论系统 设置有新评论时自动发邮件提醒
categories: 
  - Hexo
  - next主题
  - 插件
date: 2020-06-24 08:21:48
updated: 2020-06-25 09:00:59
abbrlink: de4f7be8
---
# 注册LeanCloud
LeanCloud分为**国内**和**国际版**的。
国内的在2019-10-1之后需要自定义已备案域名才能使用,
所以我这里使用国际版,先到[LeanCloud国际版](https://leancloud.app/)注册一个账号.
## 验证邮箱 验证手机号
注册好之后,**点击头像**(图片有误,不是右键,是点击鼠标左键),选择**账号设置**:
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/15.png)
然后验证手机号和邮箱:
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/16.png)

# 创建应用
点击创建应用按钮:
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/1.png)
找不到的可以点击这个链接来创建:
```
https://console.leancloud.app/applist.html#/newapp
```
## 选择开发版
选择不要钱的开发版
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/2.png)

## 进入设置
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/3.png)

### 设置Web安全域名，填入自己的域名
依次点击左侧边栏上的**设置**,**安全中心**,然后**下拉页面**,找到**Web 安全域名**,把你站点的域名填写进去:
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/4.png)

### 获取APP ID 和 APP Key
依次点击左侧边栏上的**设置**,**应用 Keys**,然后复制下**AppID**和**AppKey**:
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/5.png)

# 打开Next主题配置文件 启用Valine 填写appid和appkey
打开博客目录的`next`主题配置文件 _`config.yml` ，找到`Valine`，将上图的`APP ID` 和`APP Key`复制到对应位置。:
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/6.png)
**到这里其实就可以使用Valine这个评论系统了,下面来设置邮件提醒**
# 设置邮件提醒
## 部署邮件提醒项目 Valine-Admin
依次点击左侧边栏上的**云引擎**,**部署**,然后下拉页面,点击**部署项目**:
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/8.png)
然后选中**Git部署**,点击**配置Git**按钮,**填写**第三方邮件提醒源代码库地址,**保存**
```
https://github.com/zhaojun1998/Valine-Admin
```
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/9.png)
继续下拉页面,使用**master**分支,然后点击**部署**:
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/10.png)

## 配置环境变量
点击做出的**云引擎**,**设置**,然后点击**添加新变量**按钮添加以下环境变量:
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/11.png)
- `SITE_NAME` : 网站名称。
- `SITE_URL` : 网站地址, 最后不要加 / 。
- `SMTP_USER` : `SMTP` 服务用户名，一般为邮箱地址。
- `SMTP_PASS` : `SMTP` 密码，一般为授权码，而不是邮箱的登陆密码，请自行查询对应邮件服务商的获取方式
- `SMTP_SERVICE` : 邮件服务提供商，支持QQ、163、126、Gmail、"Yahoo"、...... ，全部支持请参考 :[Nodemailer Supported services](https://nodemailer.com/smtp/well-known/#supported-services)。 --- 如这里没有你使用的邮件提供商，[请查看自定义邮件服务器](https://github.com/zhaojun1998/Valine-Admin/blob/master/%E9%AB%98%E7%BA%A7%E9%85%8D%E7%BD%AE.md#%E8%87%AA%E5%AE%9A%E4%B9%89%E9%82%AE%E4%BB%B6%E6%9C%8D%E5%8A%A1%E5%99%A8)
- `SENDER_NAME` : 寄件人名称。

### 怎么获取SMTP授权码(SMTP_PASS)
我使用的是163的邮箱,参见：[163邮箱设置smtp密码步骤](http://blog.51cto.com/13284080/2065376)

# 保证绝大多数时间邮件服务正常
**免费版的`LeanCloud`容器，是有强制性休眠策略的，不能24小时运行：**
- 每天必须休眠 6 个小时
- 30 分钟内没有外部请求，则休眠。
- 休眠后如果有新的外部请求实例则马上启动（但激活时此次发送邮件会失败）。

分析了一下上方的策略，如果不想付费的话，最佳使用方案就设置定时器，每天 7 - 23 点每 20 分钟访问一次，这样可以保持每天的绝大多数时间邮件服务是正常的。

## 配置Web主机域名
首先需要先配置下Web主机的域名，使用定时器时要用到。
## 添加新的环境变量
添加环境变量，**ADMIN_URL**,值设置为**https://你刚才设置的域名.avosapps.us/**,如图所示:
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/14.png)
## 添加定时器
**云引擎**,**定时任务**,**创建定时任务**,名称随便写,选**生产环境**,选择**self_wake**函数,选择**Corn表达式**,输入:
```
0 */20 7-23 * * ?
```
**保存**
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/13.png)
## 重启Valine-Admin项目
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/12.png)
## 查看定时器效果
**云引擎**,**日志**,看到如下信息表示自动唤醒任务运行成功:
```
自唤醒任务执行成功，响应状态码为: 200
```
# 测试邮件提醒效果
## 填写评论
填写昵称,邮箱,评论,然后提交
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/17.png)
## 查看邮件提醒
应该过不了多久就可以收到邮件提醒:
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/18.png)
点击邮件中的 **点击前往查看** 超链接,即可查看评论:
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/19.png)
# 删除评论
## 通过直接在表中的删除
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/20.png)

## 使用评论管理系统
## 添加用户
然后在Use表中增加账号， 
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/21.png)
只需要填写`password`和`username`。其中`username`必须设置为你的上面环境变量`SMTP_USER`的邮箱相同.不然无法登录
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/22.png)

## 登录评论管理系统
地址就是上面设置的web主机名:**https://你刚才设置的域名.avosapps.us/**
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/23.png)
进入评论系统后就可以查看评论或者删除评论了:
![](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Hexo/Next/Plugin/ValineCommentSystem/24.png)

<!-- 
Blog/Hexo/Next/Plugin/ValineCommentSystem/24
Blog/Hexo/Next/Plugin/ValineCommentSystem/24
Blog/Hexo/Next/Plugin/ValineCommentSystem/24
-->
# 参考资料
[使用Leancloud+valine打造Hexo-NexT评论系统](https://juejin.im/post/5d790e706fb9a06af8250665)
[https://github.com/zhaojun1998/Valine-Admin](https://github.com/zhaojun1998/Valine-Admin)
[https://github.com/zhaojun1998/Valine-Admin/blob/master/高级配置.md#web-评论管理](https://github.com/zhaojun1998/Valine-Admin/blob/master/%E9%AB%98%E7%BA%A7%E9%85%8D%E7%BD%AE.md#web-%E8%AF%84%E8%AE%BA%E7%AE%A1%E7%90%86)
[https://lqcoder.com/p/aab4c717.html](https://lqcoder.com/p/aab4c717.html)
