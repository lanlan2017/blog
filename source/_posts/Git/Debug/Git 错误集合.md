---
title: Git错误集合
categories: 
  - Git
date: 2019-04-30 23:53:43
updated: 2019-11-25 00:23:43
abbrlink: 7e675acc
---
<div id='my_toc'>

- [git error:bad signature](/blog/7e675acc/#git-error-bad-signature)
- [ERROR: You must verify your email address.](/blog/7e675acc/#ERROR-You-must-verify-your-email-address)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
## git error:bad signature ##
**解决方案:**删除`index`文件再重新生成
```cmd
rm -f .git/index
git reset
```
## ERROR: You must verify your email address. ##
今天使用Hexo发布博客时,报了如下错误:
```cmd
ERROR: You must verify your email address.
See https://github.com/settings/emails.
fatal: Could not read from remote repository.
Please make sure you have the correct access rights
and the repository exists.
FATAL Something's wrong. Maybe you can find the solution here: http://hexo.io/docs/troubleshooting.html
Error: Spawn failed
    at ChildProcess.<anonymous> (E:\Blog\blog6\node_modules\hexo-util\lib\spawn.js:52:19)
    at emitTwo (events.js:126:13)
    at ChildProcess.emit (events.js:214:7)
    at ChildProcess.cp.emit (E:\Blog\blog6\node_modules\cross-spawn\lib\enoent.js:40:29)
    at Process.ChildProcess._handle.onexit (internal/child_process.js:198:12)

```
这是因为邮箱突然没有通过验证,具体怎么回事不知道.打开提示的链接[https://github.com/settings/emails](https://github.com/settings/emails),然后重新验证就好了:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/git/Error/Email/1.png)
这时github会给你发邮件,打开邮箱接收邮件,然后点击按钮验证即可:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/git/Error/Email/2.png)

参考资料:[https://www.jianshu.com/p/d478f6fd381b](https://www.jianshu.com/p/d478f6fd381b)

>原文链接: [Git错误集合](https://lanlan2017.github.io/blog/7e675acc/)
