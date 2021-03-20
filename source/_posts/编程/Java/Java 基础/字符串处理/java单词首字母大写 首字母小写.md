---
title: java单词首字母大写 首字母小写
categories: 
  - 编程
  - Java
  - Java 基础
  - 字符串处理
date: 2019-04-03 22:05:32
updated: 2021-03-20 07:57:49
abbrlink: 9d84ecc2
---
<div id='my_toc'><a href="/blog/9d84ecc2/#原理" class="header_2">原理</a>&nbsp;<br><a href="/blog/9d84ecc2/#ASCII码运算" class="header_3">ASCII码运算</a>&nbsp;<br><a href="/blog/9d84ecc2/#结论" class="header_3">结论</a>&nbsp;<br><a href="/blog/9d84ecc2/#代码" class="header_2">代码</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 原理
### ASCII码运算
先来看实例代码:
```java
System.out.println("a-z:"+(int)'a'+"-"+(int)'z');
System.out.println("A-Z:"+(int)'A'+"-"+(int)'Z');
System.out.println("0-9:"+(int)'0'+"-"+(int)'9');
System.out.println("a减去A="+(int)('a'-'A'));
```
运行结果:
```cmd
a-z:97-122
A-Z:65-90
0-9:48-57
a减去A=32
```
### 结论
- 小写字母`a到z`的`ASCII`码范围为:`97到122`。
- 大写字母`A到Z`的`ASCII`码范围为:`65到90`,
- **小写字母减去`32`就得到大写字母,同样的大写字母加上`32`就得到了小写字母.**

## 代码
```java
package first.letter;
public class LowerUpperCaseFirstLetter
{
    public static void main(String[] args)
    {
        // 首字母小写
        System.out.println("首字母变小写:" + lowerCaseFirstLetter("Java"));
        // 首字母大写
        System.out.println("首字母变大写:" + upperCaseFirstLetter("java"));
//        System.out.println("a-z:"+(int)'a'+"-"+(int)'z');
//        System.out.println("A-Z:"+(int)'A'+"-"+(int)'Z');
//        System.out.println("0-9:"+(int)'0'+"-"+(int)'9');
//        System.out.println("a减去A="+(int)('a'-'A'));
    }
    /**
     * 首字母变大写.
     * 
     * @param str
     *            英文单词.
     * @return 首字母大写的英文单词.
     */
    public static String upperCaseFirstLetter(String str)
    {
        char[] chars = str.toCharArray();
        // 如果是小写字母
        if ('a' <= chars[0] && chars[0] <= 'z')
        {
            System.out.println(chars[0] + ":" + (int) (chars[0]));
            // 小写-32变大写
            chars[0] = (char) (chars[0] - 32);
        }
        return String.valueOf(chars);
    }
    /**
     * 首字母变小写.
     * @param str 英文单词.
     * @return 首字母变小写的英文单词.
     */
    public static String lowerCaseFirstLetter(String str)
    {
        char[] chars = str.toCharArray();
        // 如果是大写字母
        if ('A' <= chars[0] && chars[0] <= 'Z')
        {
            System.out.println(chars[0] + ":" + (int) (chars[0]));
            // 大写+32是变小写
            chars[0] += 32;
        }
        return String.valueOf(chars);
    }
}
```
运行结果:
```cmd
J:74
首字母变小写:java
j:106
首字母变大写:Java
```