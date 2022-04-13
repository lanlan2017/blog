---
title: LeetCode注销账户后无法弹出登录框
categories: 
  - 其他
  - 网站使用问题
abbrlink: 8a4bfbf
date: 2021-09-07 09:43:57
updated: 2022-04-04 15:13:22
---
# 问题描述 注销LeetCode后进入LeetCode网站时不弹出登录框
我之前有使用QQ登录LeetCode，等我绑定邮箱的时候，才发现原来我之前有账户。
所以QQ登录时创建的账户我就注销掉了。
然后我打算登录原来的旧账户，但是奇怪的事情发生了。

在当前浏览器中，LeetCode的登录框无法弹出。如果换一个浏览器，则LeetCode的登录框可以弹出。

# 原因 原来账户的cache没清理掉
<!-- more -->

我QQ登录时，LeetCode创建的账号时会生成cache，保存在我当前的浏览器中。
所以我在当前浏览器中进入LeetCode网站的时候，浏览器上传了之前账号的cache。
又由于该账号已经注销，从而导致登录失败。

# 解决方案 清除cache
我当前用的Chrome，打开**设置**，然后输入**清除浏览数据**进行搜索
[chrome://settings/?search=%E6%B8%85%E9%99%A4%E6%B5%8F%E8%A7%88%E6%95%B0%E6%8D%AE](chrome://settings/?search=%E6%B8%85%E9%99%A4%E6%B5%8F%E8%A7%88%E6%95%B0%E6%8D%AE)

如图所示：
![image-20210907095420866](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/Sum/20210907095421.png)
# 验证
这样重新进入leetcode网站，就可以成功弹出登录框了。
