---
title: eclipse正则表达式替换
categories: 
  - Java
  - Java 基础
  - IDE
  - eclipse
date: 2018-12-11 20:43:57
updated: 2019-12-17 05:17:09
abbrlink: eee91bf3
---
<div id='my_toc'><a href="/blog/eee91bf3/#查找替换框设置" class="header_2">查找替换框设置</a><br><a href="/blog/eee91bf3/#英文意思" class="header_2">英文意思</a><br><a href="/blog/eee91bf3/#参考链接" class="header_2">参考链接</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
<input type="button" onclick="open_closeTOC()" id="showcloseButton">
<script>
    function open_closeTOC() {var id = document.querySelector(".post-body > ul"); if (id.style.display == "block") {id.style.display = "none";document.getElementById("showcloseButton").value= "展开目录";}else if (id.style.display == "none") {id.style.display = "block";document.getElementById("showcloseButton").value="折叠目录";}}(function () {document.querySelector(".post-body > ul").style.display = "none";document.getElementById("showcloseButton").value="展开目录";})();
</script>

## 查找替换框设置 ##
在要替换的文件中按下`ctrl+f`打开查找替换框：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/regex/find_regex.png)
然后勾选`Regular  expressions`即可使用正则表达式进行查找替换,例如我这里要在jsp表达式`<%=.+%>`后面添加上html换行<br>标签：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/regex/replace.png)
具体英文意思如下：
## 英文意思 ##
- Find ： 要搜索的内容
- Replace With ： 要地换的内容
- Direction ：方向（向前向后）
    - Forward : 向前搜索
    - Backward :向后搜索
- Scope：范围
    - All ： 文件中所有代码中进行搜索
    - Selected lines ：从选中行中进行搜索
- Options：选项
    - Case Sensitive : 区分大小写
    - Wrap search ： 搜索/替换 `到文件最底部可回到文件开头进行匹配`
    - whole word :  全词 （完全匹配 - 默认）
    - Incremental：增量匹配（输入实时匹配），在Find输入框里`增加输入时`会实时匹配（需要修改搜索/替换时选用）
    - Regular  expressions ：正则表达式 （没有使用过）


## 参考链接 ##
[https://blog.csdn.net/superit401/article/details/80008281](https://blog.csdn.net/superit401/article/details/80008281)
[https://blog.csdn.net/a249198337/article/details/46467253](https://blog.csdn.net/a249198337/article/details/46467253)
