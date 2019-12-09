---
title: java 循环控制结构break continue return
categories: 
  - Java
  - Java 流程控制
date: 2019-01-16 20:13:29
updated: 2019-12-09 19:45:21
abbrlink: 3ac4e85f
---
<div id='my_toc'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/3ac4e85f/#前言">前言</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/3ac4e85f/#使用-break结束循环">使用 break结束循环</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/3ac4e85f/#结束本层循环">结束本层循环</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/3ac4e85f/#break-标签-结束标签指定的外层循环">break 标签 结束标签指定的外层循环</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/3ac4e85f/#使用-continue忽略本次循环剩下语句">使用 continue忽略本次循环剩下语句</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/3ac4e85f/#continue不要放在循环体最后面">continue不要放在循环体最后面</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/3ac4e85f/#continue标签-结束本次外层循环">continue标签 结束本次外层循环</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/3ac4e85f/#使用-return结束方法">使用 return结束方法</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
## 前言 ##
Java语言没有提供goto语句来控制程序的跳转,这种做法提高了程序流程控制的可读性,但降低了程序流程控制的灵活性。为了弥补这种不足,Java提供了break和 continue来控制循环结构。除此之外, return可以结束整个方法,当然也就结束了一次循环
## 使用 break结束循环 ##
### 结束本层循环 ###
某些时候需要在某种条件出现时强行终止循环,而不是等到循环条件为 false时才退出循环。此时,可以使用 break来完成这个功能。 **break用于完全结束一个循环,跳出循环体。不管是哪种循环,一旦在循环体中遇到 break,系统将完全结東该循环,开始执行循环之后的代码。**例如如下程序。
```java
// 一个简单的for循环
for (int i = 0; i < 10 ; i++ )
{
    System.out.println("i的值是" + i);
    if (i == 2)
    {
        // 执行该语句时将结束循环
        break;
    }
}
```
运行结果：
```
i的值是0
i的值是1
i的值是2
```
运行上面程序,将看到i循环到2时即结束,当i等于2时,循环体内遇到 break语句,程序跳出该循环。

### break 标签 结束标签指定的外层循环 ###
break语句不仅可以结束其所在的循环,还可以**直接结束其外层循环**。此时需要在 **break后紧跟一个标签**,这个标签用于标识一个外层循环，Java中的标签就是一个紧跟着英文冒号(:)的标识符。与其他语言不同的是,**Java中的标签只有放在循环语句之前才有作用**。例如下面代码。
```java
// 外层循环，outer作为标识符
outer:
for (int i = 0 ; i < 5 ; i++ )
{
    // 内层循环
    for (int j = 0; j < 3 ; j++ )
    {
        System.out.println("i的值为:" + i + "  j的值为:" + j);
        if (j == 1)
        {
            // 跳出outer标签所标识的循环。
            break outer;
        }
    }
}
```
运行结果：
```
i的值为:0  j的值为:0
i的值为:0  j的值为:1
```
程序从外层循环进入内层循环后,当j等于1时,程序遇到一个 `break outer;`语句,这行代码将会结束 outer标签指定的外层循环,而不是结束 break所在的循环。所以看到上面的运行结果。

值得指出的是, break后的标签必须是一个**`有效的标签`**,即**这个标签必须`在 break语句所在的循环之前定义`,或者在其所在循环的`外层循环之前定义`**。当然,如果把这个标签放在 break语句所在的循环之前,虽然在语法上是没有错的,但是break默认就是结束其所在的循环,多加一个标签来结束本层循环显然画蛇添足。
## 使用 continue忽略本次循环剩下语句 ##
continue的功能和 break有点类似,区别是 continue只是忽略本次循环剩下语句,接着开始下一次循环,并不会终止循环;而 break则是完全终止循环本身。如下程序示范了 continue的用法。
```java
// 一个简单的for循环
for (int i = 0; i < 3 ; i++ )
{
    System.out.println("i的值是" + i);
    if (i == 1)
    {
        // 忽略本次循环的剩下语句
        continue;
    }
    System.out.println("continue后的输出语句");
}
```
运行结果：
```
i的值是0
continue后的输出语句
i的值是1
i的值是2
continue后的输出语句
```
从上面运行结果来看,当i等于1时,程序没有输出“ continue后的输出语句”字符串,因为程序执行到 continue时,忽略了当次循环中 continue语句后的代码。
### continue不要放在循环体最后面 ###
从这个意义上来看,如果把一个 continue语句放在单次循环的最后一行,这个 continue语句是没有任何意义的—因为它仅仅忽略了一片空白,没有忽略任何程序语句。
### continue标签 结束本次外层循环 ###
与 break类似的是, continue后也可以紧跟一个标签,用于直接跳过标签所标识循环的当次循环的剩下语句,重新开始下一次循环。例如下面代码。
```java
// 外层循环
outer:
for (int i = 0 ; i < 5 ; i++ )
{
    // 内层循环
    for (int j = 0; j < 5 ; j++ )
    {
        System.out.println("i的值为:" + i + "  j的值为:" + j);
        if (j == 1)
        {
            // 忽略outer标签所指定的循环中本次循环所剩下语句。
            continue outer;
        }
    }
}
```
运行结果：
```
i的值为:0  j的值为:0
i的值为:0  j的值为:1
i的值为:1  j的值为:0
i的值为:1  j的值为:1
i的值为:2  j的值为:0
i的值为:2  j的值为:1
i的值为:3  j的值为:0
i的值为:3  j的值为:1
i的值为:4  j的值为:0
i的值为:4  j的值为:1
```
可以看到,循环变量j的值将无法超过1,因为每当j等于1时, `continue outer;`语句就结束了本次外层循环,内层循环没有机会执行完成，直接开始下一次外层循环。与 break类似的是, continue后的标签也必须是一个有效标签,即`这个标签通常应该定义在 continue所在循环的外层循环之前`。
## 使用 return结束方法 ##
return关键字并不是专门用于结束循环的, **return的功能是结束一个方法**。**当一个方法执行到一个return语句时**( return关键字后还可以跟变量、常量和表达式,这将在方法介绍中有更详细的解释),**这个方法将被结束**。
Java程序中大部分循环都被放在方法中执行,例如前面介绍的所有循环示范程序。一**旦在循环体内执行到一个 return语句, return语句就会结束该方法,循环自然也随之结束**。例如下面程序
```java
// 一个简单的for循环
for (int i = 0; i < 3 ; i++ )
{
    System.out.println("i的值是" + i);
    if (i == 1)
    {
        return;
    }
    System.out.println("return后的输出语句");
}
```
运行结果：
```
i的值是0
return后的输出语句
i的值是1
```
运行上面程序,循环只能执行到i等于1时,当i等于1时程序将完全结束(当main方法结束时,也就是Java程序结束时)。从这个运行结果来看,虽然 return并不是专门用于循环结构控制的关键字,但通过 return语句确实可以结束一个循环。与 continue和 break不同的是, **return直接结束整个方法,不管这个 return处于多少层循环之内**。
>原文链接: [java 循环控制结构break continue return](https://lanlan2017.github.io/blog/3ac4e85f/)
