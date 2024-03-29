---
title: 解决String concatenation as argument to 'StringBuffer.append()' call警告
categories: 
  - Java
  - Java 基础
  - 代码优化
abbrlink: e14f1dac
date: 2019-10-03 21:19:47
updated: 2022-04-04 00:51:44
---
# 解决 String concatenation as argument to 'StringBuffer.append()' call 警告
## 问题描述
最近带idea中老是收到下面这个警告:
```
Warning:(20, 16) String concatenation as argument to 'StringBuffer.append()' call
```
出现警告的代码:
```java
sb.append("<property name=\"" + group1 + "\" value=\"${" + group1+ "}\"/>\r\n");
```
## 分析原因
其实这个提示是表示方法使用不恰当,因为`StringBuffer`对象的`append`方法目的就是做对象拼接用的,里面再通过"`+`"来拼接就不得当,这是编译器对`Java`的代码规范。

## 解决方案
### 1. 全部使用append方法
#### 替换`+`号为`).append(`
因为`append`方法的返回值还是`StringBuffer`,所以可以链式调用,我们可以通过链式调用来替换掉里面的加号。
也就是，将:
```java
sb.append("<property name=\"" + group1 + "\" value=\"${" + group1+ "}\"/>\r\n");
```
替换成:
```java
sb.append("<property name=\"").append(group1).append("\" value=\"${").append(group1).append("}\"/>\r\n");
```
#### 使用IDE的查找替换功能进行替换
当然,手动替换可能有些繁琐,需要使用`查找替换功能`,
1. 查找:`+`
2. 替换为:`).append(`即可。

#### 写代码实现替换
核心代码如下:
```java
/**
 * 把StringBuffer或StringBuilder中的字符串连接符<code>+</code>替换append()方法
 *
 * @return 替换后的字符串.
 */
public String StringConnectorToAppend(String stringBufferAppendCode) {
    String returnValue = "// " + stringBufferAppendCode + "\n";
    return returnValue + stringBufferAppendCode.replaceAll("\\s*\\+\\s*", ").append(");
}
```
### 2. 忽略
这个不替换也能运行,而且替换后代码长度变长了,不好阅读,可以选择忽略.
