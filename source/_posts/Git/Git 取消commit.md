---
title: Git 取消commit
categories: 
  - Git
date: 2019-11-28 16:08:50
updated: 2019-12-15 10:01:43
abbrlink: ae0d2128
---
<div id='my_toc'><a href="/blog/ae0d2128/#问题描述" class="header_1">问题描述</a><br><a href="/blog/ae0d2128/#回退到上个版本" class="header_1">回退到上个版本</a><br><a href="/blog/ae0d2128/#回退到执行版本" class="header_1">回退到执行版本</a><br><a href="/blog/ae0d2128/#自动生成" class="header_1">自动生成</a><br></div>
<style>
    .header_1{
        margin-left: 1em;
    }
    .header_2{
        margin-left: 2em;
    }
    .header_3{
        margin-left: 3em;
    }
    .header_4{
        margin-left: 4em;
    }
    .header_5{
        margin-left: 5em;
    }
    .header_6{
        margin-left: 6em;
    }
</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
# 问题描述 #
你可能在执行git add .和git commit -m 'xxx'之后后悔了,如何回退到上一个版本呢。

|版本代号|描述|
|:---|:---|
|`HEAD`|表示当前版本|
|`HEAD^`|表示上一个版本|
|`HEAD^^`|上上一个版本就是|
|`HEAD~100`|当前版本之前的第100个版本|


# 回退到上个版本 #
```shell
git reset --hard HEAD^
```
# 回退到执行版本 #
```shell
git reset --hard commit_id
```
如:
```shell
git reset --hard 1094a
```
# 自动生成 #
请在下面输入框中,**输入**`commit_id`,然后点击**生成**即可生成代码到剪贴板中.

<input type="text" id="commitId" placeholder="请输入commit_d"><button onclick="switchCommit(document.getElementById('commitId').value)">生成代码</button>
<script>
    function switchCommit(text) {
        var input = document.getElementById('commitId');
        var code = "git reset --head " + text;
        input.value = '';
        copy(code);
    }
    function copy(text) {
        var temp = document.createElement("textarea");
        temp.value = text;
        document.body.appendChild(temp);
        temp.select();
        // alert('打断,看效果');
        document.execCommand('copy');
        document.body.removeChild(temp);
        alert('已经复制如下代码到剪贴板:\n'+text);
    }

