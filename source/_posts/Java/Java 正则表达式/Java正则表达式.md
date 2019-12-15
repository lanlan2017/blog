---
title: Java正则表达式
categories: 
  - Java
  - Java 正则表达式
date: 2019-01-11 22:02:27
updated: 2019-12-09 19:45:21
abbrlink: 4ea1809c
---
------------------------------------------
#######################################
上述替换完成后StringBuffer中的内容------>before_ONEA
加上文本中剩余子串后StringBuffer中的内容-->before_ONEA_TWOa_THREEa_End
替换之前的文本:before_ONEa_TWOa_THREEa_End
全部替换之后的:before_ONEA_TWOa_THREEa_End

```
这里我们只替换了第一次，before_ONE`a`_TWOa_THREEa_End,然后StringBuffer中处理完毕的文本为`before_ONEA`，未处理的文本为`_TWOa_THREEa_End`，最后调用m.appendTail(sb);把未处理的文本也追加入到StringBuffer中，处理完毕的文本为:`before_ONEA_TWOa_THREEa_End`

### 小结： ###
- `find()`方法匹配子串的时候都会**记下**本次成功**匹配子串的`开始位置`和`结束位置`**
- `appendReplacement(sb`,`replacement)`方法先获取所有`从上次匹配的结束位置，到本次匹配结束位置的所有字符串`，然后`替换其中匹配的部分`，最后追加到`sb`中。
- `appendReplacement(sb)`方法把结束位置到文本结尾的所有字符追加到`sb`中。
- 使用appendReplace()和appendTail()方法可以更加灵活的进行替换操作，注意要结合find()方法使用。
