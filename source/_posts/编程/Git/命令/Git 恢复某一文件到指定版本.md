---
title: Git 恢复某一文件到指定版本
categories: 
  - Git
  - 命令
abbrlink: 1d8980fe
date: 2019-12-23 09:52:43
updated: 2022-04-04 00:51:45
---
# 问题描述
今天我查看之前的写的文章的时候我发现`'批处理 for命令.md'`**这批文章中的大部分内容都丢失**了,应该是我写的文件处理程序出bug造成的,不过幸好有版本控制,只要将该文件恢复到`文件处理程序`操作之前的状态即可.
## 查看某个文件的commit记录
格式:
```shell
git log --pretty=oneline 文件路径
```
例如:先cd到`'批处理 for命令.md'`这个文件所在的目录,然后输入如下命令,查看该文件的提交记录.
```shell
git log --pretty=oneline '批处理 for命令.md'
```
```shell
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog/source/_posts/Windows/CMD 批处理/语法/构建程序相关命令 (master)
$ git log --pretty=oneline '批处理 for命令.md'
3306a587de0ee6adcf93b06c02fcdb516b3518a8 (HEAD -> master, origin/master, origin/HEAD) 添加新的文章,添加新的批处理文件
8a373f61d04c84cae3baf38926fafb4edc7792d1 更新目录摘要
f9d10aa3896969a9b156079ff4036e08f37e48e0 添加目录摘要
ee428318f7e27468239b0df33696860fe869e1e0 删除自定义FM
65103097ba7830ba0b47b0123dd6e7abaa090299 删除原文链接
4a7e71d88ef2c2272baa3a48fc33bf4965a9b1a7 更新目录摘要
b8abfe524937e2d8f63c7fa607f6afb8812cb5d7 调整文章路径,添加新的文章

lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog/source/_posts/Windows/CMD 批处理/语法/构建程序相关命令 (master)
```
## 比较两个版本之间文件的不同
```shell
git diff commit_id1 commit_id2 -- 文件名
```
注意这两个commit_id的顺序不同显示不同.commit_id1应该为更久远的版本,commit_id2应该为更近的版本.
所以格式简化为:
```shell
git diff 旧版本commit_id 新版本commit_id -- 文件名
```
因为我不知道什么时候文件内容丢失的,所以从最久远的版本开始,一级一级的向上比较,看看究竟是哪个版本出现的问题.

先来比较4a7e71d88e版本(倒数第二久远版本),对b8abfe5249(最久远版本)做了哪些修改:
```shell
git diff b8abfe5249 4a7e71d88e -- '批处理 for命令.md'
```
运行效果:
```
lan@DESKTOP-8ISAT6B MINGW64 /e/Blog/blog/source/_posts/Windows/CMD 批处理/语法/构建程序相关命令 (master)
$ git diff b8abfe5249 4a7e71d88e -- &#x27;批处理 for命令.md&#x27;
diff --git a/source/_posts/Windows/CMD 批处理/语法/构建程序相关命令/批处理 for命令.md b/source/_posts/Windows/CMD 批处理/语法/构建程序相关命令/批处理 for命令.md
index 11f5b2b..52811fc 100644
--- a/source/_posts/Windows/CMD 批处理/语法/构建程序相关命令/批处理 for命令.md
+++ b/source/_posts/Windows/CMD 批处理/语法/构建程序相关命令/批处理 for命令.md
@@ -6,214 +6,16 @@ categories:
   - 语法
   - 构建程序相关命令
 date: 2019-02-01 21:57:48
-updated: 2019-11-29 21:19:58
+updated: 2019-12-09 19:45:23
 abbrlink: c4029a06
 ---
-&lt;div id=&#x27;my_toc&#x27;&gt;
-
-- [命令格式](/blog/c4029a06/#命令格式)
-    - [无参数](/blog/c4029a06/#无参数)
-    - [参数 /d](/blog/c4029a06/#参数-d)
-    - [参数 /R](/blog/c4029a06/#参数-R)
-    - [参数 /L](/blog/c4029a06/#参数-L)
-    - [参数 /F](/blog/c4029a06/#参数-F)
-- [参考资料](/blog/c4029a06/#参考资料)
-
-&lt;/div&gt;
-&lt;!--more--&gt;
-&lt;script&gt;if (navigator.platform.search(&#x27;arm&#x27;)==-1){document.getElementById(&#x27;my_toc&#x27;).style.display = &#x27;none&#x27;;}&lt;/script&gt;
+&lt;div id=&#x27;my_toc&#x27;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;a href=&quot;/blog/c4029a06/#参考资料&quot;&gt;参考资料&lt;/a&gt;&lt;br/&gt;&lt;/div&gt;&lt;!--more--&gt;
+&lt;script&gt;if (navigator.platform.search(&#x27;arm&#x27;)==-1){document.getElementById(&#x27;my_toc&#x27;).style.display = &#x27;none&#x27;;}
+var e,p = document.getElementsByTagName(&#x27;p&#x27;);while (p.length&gt;0) {e = p[0];e.parentElement.removeChild(e);}
+&lt;/script&gt;

 &lt;!--end--&gt;
-&#35;&#35; 命令格式 &#35;&#35;
-&#x60;&#x60;&#x60;cmd
-for [参数] %%变量名 in (相关文件或命令) do 执行的命令
-&#x60;&#x60;&#x60;
-对一个或一组&#x60;文件&#x60;，&#x60;字符串&#x60;或&#x60;命令结果&#x60;中的每一个对象执行特定命令，达到我们想要的结果。
-**注意**:
-- 在&#x60;批处理文件&#x60;中使用 &#x60;for&#x60; 命令时，指定变量请使用 &#x60;%%variable&#x60;,而不要用 &#x60;%variable&#x60;,而在cmd窗口中直接输入的for命令则使用&#x60;%variable&#x60;的形式。
-- 变量名称是区分大小写的，所以 &#x60;%i&#x60; 不同于 &#x60;%I&#x60;.
-
-for命令可以带参数或不带参数，带参数时支持以下参数:&#x60;/d&#x60;,&#x60;/l&#x60;,&#x60;/r&#x60;,&#x60;/f&#x60;.
-&#35;&#35;&#35; 无参数 &#35;&#35;&#35;
-......省略
-&#x60;&#x60;&#x60;
-D:\学习9\书籍\批处理&gt;for_f4.bat
-\\DESKTOP-8ISAT6B 的用户帐户
--------------------------------------------------------------------------------
+----------------------------------------------------------------------------
 Administrator            DefaultAccount           Guest
 lan                      WDAGUtilityAccount
 命令成功完成。
```
可以看到就是倒数第二久远版本(4a7e71d88e)中,我的文章内容被删除掉了.所以我只要将该文件恢复到最久远版本(b8abfe5249)就可以恢复丢失的文章内容.
## 取出指定版本的文件
```shell
git checkout commitId 文件路径
```
现在取出最久远版本的文件'批处理 for命令.md':
```shell
git checkout b8abfe5249 '批处理 for命令.md'
```
然后查看该文件内容:
```
cat '批处理 for命令.md'
```
如果需要修改,那就修改,确认无误后再:
```shell
git add .
git commit -m '恢复文件到xxxx版本'
```
添加到版本库中即可.
