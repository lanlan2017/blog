---
title: 正则表达式 匹配JSP java javadoc注释
categories: 
  - 其他
  - 正则表达式
  - 实例
abbrlink: a2a97f71
date: 2018-12-15 02:33:36
updated: 2022-04-04 00:51:45
---
# 匹配注释
## 匹配JSP注释
### 问题描述
写博客经常需要贴代码，但是我不想让代码里面出现太多注释，免得占据太多空间。
用java来复制代码,把代码中的JSP`多行注释`移除掉。单行注释保留，单行注释作为代码的描述信息。
### 正则匹配JSP多行注释
```
<%\-\-(?:.*\n)+\s*\-\-%>
```
## 匹配Java多行注释 文档注释
### 问题描述
我之前喜欢把文字(注释)和代码写到一起，但是我现在想把代码描述，从代码中提取出来，放到文章中。但是复制出来的文本带有注释，如先所示：

### 需求
使用正则表达式删除掉前面的多行注释
### 匹配正则
```
\s*(?:\/\*{1,2}|\*\/|\*)
```
图解：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/regex/example/annotation/java_javadoc.png)
匹配效果：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/regex/example/annotation/java_javadoc_vscode.png)
注意: **正则表达式分支要特别注意分支的顺序**,`\*\/`要写在`\*`前面，如果写成`\s*(?:\/\*{1,2}|\*|\*\/)`d的话,匹配注释结束符号的时候会先匹配到单个星号`*`，正好与第二个分支合适，就不会再匹配`/`了，如下图所示：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/regex/example/annotation/shunxu.png)

