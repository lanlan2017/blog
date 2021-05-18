---
title: Linux 比较两文件是否相同：通过hash算法值来比较
categories:
  - 编程
  - Linux
  - 通用
  - 文件比较
mathjax: true
abbrlink: d23c9652
date: 2021-05-15 23:54:38
updated: 2021-05-15 23:57:07
---
# md5sum/sha1sum:文件内容比较
- 使用MD5算法（散列函数）根据文件内容生成16字节hash值，比较hash值是否相
同，就可断定两文件内容是否完全相同，（md5sum命令）
- 使用SHA-1算法的命令名为sha1sum (20字节hash值)
- 其他散列函数也可以用来完成这一任务: sha512sum

md5算法常用于数据完整性（Data Integrity）验证和判断位于网络不同机器上的两个文件的内容是否相同。例如网上给出的安装程序经常会给出对应的md5值，我们可以对下载的安装程序计算md5值，如果我们计算的md5值与官网给出的md5值相同，则表示该安装程序没有被第三方篡改过，是安全的。

## md5sum
### 测试文件
```
[root@localhost cmp]# cat -n a.txt 
     1    this is line a
     2    this is line b
     3    helloworld!
     4    this is line d
[root@localhost cmp]# cat -n b.txt 
     1    this is line a
     2    this is line b
     3    this is line c
     4    this is line d
[root@localhost cmp]# cat -n c.txt 
     1    this is line a
     2    this is line b
     3    helloworld!
     4    this is line d
[root@localhost cmp]# 
```
可看到a.txt与c.txt的内容是相同的。
对着三个文件执行md5sum命令：

<pre>
[root@localhost cmp]&#35; md5sum a.txt 
<mark>abd3291ec48e1700a70d39ee5db7fb7d</mark>  a.txt
[root@localhost cmp]&#35; md5sum b.txt 
bf56342c3e159e45ea1e434122410291  b.txt
[root@localhost cmp]&#35; md5sum c.txt 
<mark>abd3291ec48e1700a70d39ee5db7fb7d</mark>  c.txt
[root@localhost cmp]&#35; 
</pre>

可以看到a.txt和c.txt的计算结果都是：<mark>abd3291ec48e1700a70d39ee5db7fb7d</mark>所以，这两个文件是相同的。
## md5sum -c md5文件：比较当前文件是否被篡改
测试文件：
```
[root@localhost cmp]# cat -n a.txt 
     1    this is line a
     2    this is line b
     3    helloworld!
     4    this is line d
[root@localhost cmp]# cat -n b.txt 
     1    this is line a
     2    this is line b
     3    this is line c
     4    this is line d
[root@localhost cmp]#
```
计算这两个文件的md5值，保存到文件中：
```
[root@localhost cmp]# md5sum a.txt b.txt
abd3291ec48e1700a70d39ee5db7fb7d  a.txt
bf56342c3e159e45ea1e434122410291  b.txt
[root@localhost cmp]# md5sum a.txt b.txt >a_b.md5
```
修改a.txt文件，在末尾加入一行：
```
[root@localhost cmp]# vim a.txt 
[root@localhost cmp]# cat a.txt 
this is line a
this is line b
helloworld!
this is line d
this is some new word
[root@localhost cmp]#
```
执行md5校验：
```
[root@localhost cmp]# md5sum -c a_b.md5
a.txt: 失败
b.txt: 确定
md5sum: 警告：1 个校验和不匹配
[root@localhost cmp]# 
```
可以看到我们修改a.txt后，该文件md5校验失败，这表示a.txt文件被篡改了。

# hash算法失误率
MD5: $2^{-128} =3.4×10^{-38}$
SHA-1: $2^{-160} =4.7×10^{-50}$

# 参考资料
