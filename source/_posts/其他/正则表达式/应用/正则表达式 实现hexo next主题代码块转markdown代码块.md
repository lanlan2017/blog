---
title: 正则表达式 实现hexo next主题代码块转markdown代码块
categories:
  - 其他
  - 正则表达式
  - 应用
abbrlink: accb1b6
date: 2018-12-16 20:05:20
updated: 2019-12-17 05:18:53
---
<div id='my_toc'><a href="/blog/accb1b6/#处理文本" class="header_2">处理文本</a>&nbsp;<br><a href="/blog/accb1b6/#获取代码文本" class="header_2">获取代码文本</a>&nbsp;<br><a href="/blog/accb1b6/#删除代码块行数" class="header_3">删除代码块行数</a>&nbsp;<br><a href="/blog/accb1b6/#替换换行符" class="header_3">替换换行符</a>&nbsp;<br><a href="/blog/accb1b6/#删除剩下的所有html标签" class="header_3">删除剩下的所有html标签</a>&nbsp;<br><a href="/blog/accb1b6/#删除空行" class="header_3">删除空行</a>&nbsp;<br><a href="/blog/accb1b6/#删除多余空白符" class="header_3">删除多余空白符</a>&nbsp;<br><a href="/blog/accb1b6/#HTML逆转义" class="header_3">HTML逆转义</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 处理文本 ##
hexo next主题 生成的代码块html代码，如下所示
```html
<figure class="highlight plain">
    <table>
        <tr>
            <td class="gutter">
                <pre><span class="line">1</span><br></pre>
            </td>
            <td class="code">
                <pre><span class="line">&lt;div class=&quot;post-body&quot;.*?&gt;(.+)&lt;\/div&gt;</span><br></pre>
            </td>
        </tr>
    </table>
</figure>
```
现在把这段代码转为原生的markdown代码块：

## 获取代码文本 ##

### 删除代码块行数 ###
**匹配正则**
```
<td class="gutter">(\s*.*?)+?<\/td>
```
**替换正则**
空字符串
**替换结果**
```
<figure class="highlight plain">
    <table>
        <tr>

            <td class="code">
                <pre><span class="line">&lt;div class=&quot;post-body&quot;.*?&gt;(.+)&lt;\/div&gt;</span><br></pre>
            </td>
        </tr>
    </table>
</figure>
```
### 替换换行符 ###
代码文可能有多行，需要把换行符从`<br>`换成`\n`:
**匹配正则:**`<br>`
**替换正则:**`\n`
**替换结果:**
```
<figure class="highlight plain">
    <table>
        <tr>
            
            <td class="code">
                <pre><span class="line">&lt;div class=&quot;post-body&quot;.*?&gt;(.+)&lt;\/div&gt;</span>
</pre>
            </td>
        </tr>
    </table>
</figure>
```

### 删除剩下的所有html标签 ###
删除掉行号之后，旧简单了，只要删除掉所有的html标签即可得到代码块中的文本
**匹配正则**
```
<\/?.*?>
```
**替换正则:**空字符串
**替换结果:**
```

    
        
            
            
                &lt;div class=&quot;post-body&quot;.*?&gt;(.+)&lt;\/div&gt;

            
        
    

```
### 删除空行 ###
**匹配正则:**`^\s*$(\n|\r\n)*`
**替换正则:**`""`,空字符串
**替换结果:**
```
                &lt;div class=&quot;post-body&quot;.*?&gt;(.+)&lt;\/div&gt;

```
### 删除多余空白符 ###
**匹配正则：**`^\s{2}`
**替换正则:**空字符串
**替换结果:**
```
&lt;div class=&quot;post-body&quot;.*?&gt;(.+)&lt;\/div&gt;

```
### HTML逆转义 ###
我这里没有找到什么好的办法，暂时先使用穷举法来弄，就是把看到的html转移字符逐个进行替换。
&lt;div class=&quot;post-body&quot;.*?&gt;(.+)&lt;\/div&gt;
`&lt;`替换为`<`
`&quot;`替换为`"`
`&gt;`替换为`>`



