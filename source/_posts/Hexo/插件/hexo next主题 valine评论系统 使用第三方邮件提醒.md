---
title: hexo next主题 valine评论系统 使用第三方邮件提醒
categories: 
  - Hexo
  - 插件
date: 2018-11-11 14:27:40
updated: 2019-12-17 05:17:08
abbrlink: f1fdd2cf
---
<div id='my_toc'><a href="/blog/f1fdd2cf/#valine自带的邮件提醒设置" class="header_2">valine自带的邮件提醒设置</a><br><a href="/blog/f1fdd2cf/#使用第三方邮件提醒" class="header_2">使用第三方邮件提醒</a><br><a href="/blog/f1fdd2cf/#关闭valine自带的邮件提醒" class="header_3">关闭valine自带的邮件提醒</a><br><a href="/blog/f1fdd2cf/#怎么获取SMTP授权码" class="header_3">怎么获取SMTP授权码</a><br><a href="/blog/f1fdd2cf/#重新部署使环境变量生效" class="header_3">重新部署使环境变量生效</a><br><a href="/blog/f1fdd2cf/#提示邮件中文章链接错误加载不到评论" class="header_3">提示邮件中文章链接错误加载不到评论</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
<input type="button" onclick="open_closeTOC()" id="showcloseButton">
<script>
    function open_closeTOC() {var id = document.querySelector(".post-body > ul"); if (id.style.display == "block") {id.style.display = "none";document.getElementById("showcloseButton").value= "展开目录";}else if (id.style.display == "none") {id.style.display = "block";document.getElementById("showcloseButton").value="折叠目录";}}(function () {document.querySelector(".post-body > ul").style.display = "none";document.getElementById("showcloseButton").value="展开目录";})();
</script>

## valine自带的邮件提醒设置 ##
参见：[Valine 评论系统中的邮件提醒设置 ](https://valine.js.org/notify.html)
## 使用第三方邮件提醒 ##
参见：[https://github.com/zhaojun1998/Valine-Admin](https://github.com/zhaojun1998/Valine-Admin)
### 关闭valine自带的邮件提醒 ###
使用第三方评论插件的话，就不要使用valine自带的邮件提醒插件，在主题配置文件`E:\Blog\bolg5\themes\next\_config.yml`中把notify设置为false。
```
valine:
  ......
  notify: false # mail notifier , https://github.com/xCss/Valine/wiki #是否开启邮箱提醒
  .......
```
### 怎么获取SMTP授权码 ###
上面的文档没有介绍怎么获取SMTP授权码，我这里来说明一下，我使用的是163的邮箱：
参见：[163邮箱设置smtp密码步骤](http://blog.51cto.com/13284080/2065376)
### 重新部署使环境变量生效 ###
设置好上述的环境变量后，需要重新部署一下让环境变量生效。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexoSettings/NextSettings/Valine/chongxinbushuranghuangjiangbiangliangshengxiao.png)
### 提示邮件中文章链接错误加载不到评论 ###
可以正常收到邮件提醒后,点击`前往参看`链接：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexoSettings/NextSettings/Valine/youxiang/wenzhangdizhicuowu.png)
打开的链接为：`https://www.lansheng.net.cn//blog/4f1b06ea/#comments`
这样地址是不对的，也就加载不到评论信息，这是因为上面设置的环境变量错了：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexoSettings/NextSettings/Valine/youxiang/errorSITE_URL.png)
这样也就加载不到评论了：

解决方案：把错误的SITE_URL`https://www.lansheng.net.cn/`最后的斜杆删除掉，改成`https://www.lansheng.net.cn`,然后点击保存，然后点击`部署标签`，点击`部署按钮`，重新部署，让设置生效即可。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexoSettings/NextSettings/Valine/chongxinbushuranghuangjiangbiangliangshengxiao.png)
