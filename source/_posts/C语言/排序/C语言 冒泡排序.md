---
title: C语言 冒泡排序
categories: 
  - C语言
  - 排序
date: 2018-11-18 14:11:07
updated: 2019-12-09 19:55:22
abbrlink: ae21e76c
---
<div id='my_toc'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/ae21e76c/#实例-数组冒泡排序">实例 数组冒泡排序</a><br/><a href="/blog/ae21e76c/#include-<stdio-h>">include <stdio.h></a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
## 实例 数组冒泡排序 ##
```c
# include <stdio.h>
int main(void)
{
    //待排序的数字
    int a[] = {900, 2, 3, -58, 34, 76, 32, 43, 56, -70, 35, -234, 532, 543, 2500};
    int n;  //存放数组a中元素的个数
    int i;  //比较的轮数
    int j;  //每轮比较的次数
    int buf;  //交换数据时用于存放中间数据
    //计算数组个数
    n = sizeof(a) / sizeof(a[0]);  /*a[0]是int型, 占4字节, 所以总的字节数除以4等于数组中元素的个数*/
    for (i=0; i<n-1; i++)  //比较n-1轮
    {
        for (j=0; j<n-1-i; j++)  //每轮比较n-1-i次,
        {
            //比较如果后面的数大
            if (a[j] < a[j+1])
            {
                //交换
                buf = a[j];     //把小的先缓存
                a[j] = a[j+1];  //把大的放到前面
                a[j+1] = buf;   //把小的放后面
            }
        }
    }
    for (i=0; i<n; ++i)
    {
        printf("%d\x20", a[i]);
    }
    printf("\n");
    return 0;
}
```
运行结果：
```
2500 900 543 532 76 56 43 35 34 32 3 2 -58 -70 -234
```
>原文链接: [C语言 冒泡排序](https://lanlan2017.github.io/blog/ae21e76c/)
