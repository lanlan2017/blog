---
title: Github SSH地址和HTTPS地址的相互转换
categories: 
  - Git
  - 命令
abbrlink: 9f3d9944
date: 2019-12-03 10:38:35
updated: 2022-04-04 00:51:45
---
# 问题描述
我在手机上想通过SSH克隆我的仓库,但是需要登入到Github上才能获取到SSH链接,其他方式好像只能获取HTTPS链接.有时候登陆比较麻烦,所以我需要写点代码来实现HTTPS和SSH地址的相互转换。
# 实例
在下面输入框中`输入地址`,然后点击`转换`按钮即可转换HTTPS地址为SSH地址,或者转换SSH地址为HTTPS地址:

<input type="text" id='input' placeholder="请输入HTTPS/SSH地址" size="40"/><button onclick='switchHttpsSsh()'>转换</button>
<script>
    var input = document.getElementById('input');
    function switchHttpsSsh(text) {
        if (text == null) {
            copy(switchHttpsSsh(input.value));
        } else {
            var httpsRegex = /^https:\/\/(.+?)\/(.+?\/.+?\.git)$/;
            var sshRegex = /^git@(.+?):(.+?\/.+?\.git)$/;
            if (httpsRegex.test(text)) {
                // 将https的git仓库地址转为ssh
                text = text.replace(httpsRegex, "git@$1:$2");
            } else if (sshRegex.test(text)) {
                // 将ssh的git仓库地址转为https
                text = text.replace(sshRegex, "https://$1/$2");
            }
            input.value=text;
            return text;
        }
    }
    function copy(text) {
        var temp = document.createElement("textarea");
        temp.value = text;
        document.body.appendChild(temp);
        temp.select();
        // alert('打断,看效果');
        document.execCommand('copy');
        document.body.removeChild(temp);
    }
</script>

# SSH链接格式
```
git@远程仓库域名:用户名/仓库名.git
```
例如:
```
git@github.com:lanlan2017/lanlan2017.github.io.git
```
# Https格式
```
https://远程仓库域名/用户名/仓库名.git
```
例如:
```
https://github.com/lanlan2017/lanlan2017.github.io.git
```
# 转换规则
经过观察,我发现后面的`用户名/仓库名.git`都是一样的,
- 在这部分前面加上`git@远程仓库域名:`就得到SSH地址,
- 在这部分前面加上`https://远程仓库域名/`就得到HTTPS地址.

## SSH转HTTPS
匹配正则:
```
^git@(.+?):(.+?/.+?\.git)$
```
替换正则:
```
https://$1/$2
```
## HTTPS转SSH
```
^https://(.+?)/(.+?/.+?\.git)$
```
替换正则:
```
git@$1:$2
```
# 源码
```html
<input type="text" id='input' placeholder="请输入HTTPS/SSH地址" size="40"/><button onclick='switchHttpsSsh()'>转换</button>
<script>
    var input = document.getElementById('input');
    function switchHttpsSsh(text) {
        if (text == null) {
            copy(switchHttpsSsh(input.value));
        } else {
            var httpsRegex = /^https:\/\/(.+?)\/(.+?\/.+?\.git)$/;
            var sshRegex = /^git@(.+?):(.+?\/.+?\.git)$/;
            if (httpsRegex.test(text)) {
                // 将https的git仓库地址转为ssh
                text = text.replace(httpsRegex, "git@$1:$2");
            } else if (sshRegex.test(text)) {
                // 将ssh的git仓库地址转为https
                text = text.replace(sshRegex, "https://$1/$2");
            }
            input.value=text;
            return text;
        }
    }
    function copy(text) {
        var temp = document.createElement("textarea");
        temp.value = text;
        document.body.appendChild(temp);
        temp.select();
        // alert('打断,看效果');
        document.execCommand('copy');
        document.body.removeChild(temp);
    }
</script>
```
