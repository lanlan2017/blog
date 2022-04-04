---
title: Git 取消commit
categories: 
  - Git
  - 命令
abbrlink: ae0d2128
date: 2019-11-28 16:08:50
updated: 2022-04-04 00:51:45
---
# 问题描述
你可能在执行git add .和git commit -m 'xxx'之后后悔了,如何回退到上一个版本呢。

|版本代号|描述|
|:---|:---|
|`HEAD`|表示当前版本|
|`HEAD^`|表示上一个版本|
|`HEAD^^`|上上一个版本就是|
|`HEAD~100`|当前版本之前的第100个版本|


# 回退到上个版本
```shell
git reset --hard HEAD^
```
# 回退到执行版本
```shell
git reset --hard commit_id
```
如:
```shell
git reset --hard 1094a
```
# 自动生成
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
</script>
