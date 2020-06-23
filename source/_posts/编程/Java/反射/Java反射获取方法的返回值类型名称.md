---
title: Java反射获取方法的返回值类型名称
categories:
  - 编程
  - Java
  - 反射
abbrlink: 85a0b802
date: 2019-12-29 09:14:06
updated: 2020-01-03 12:45:16
---
<div id='my_toc'><a href="/blog/85a0b802/#获取方法的返回值类型" class="header_1">获取方法的返回值类型</a>&nbsp;<br><a href="/blog/85a0b802/#Type接口方法" class="header_2">Type接口方法</a>&nbsp;<br><a href="/blog/85a0b802/#Class类获取类名方法" class="header_2">Class类获取类名方法</a>&nbsp;<br><a href="/blog/85a0b802/#获取方法的返回值类型名称" class="header_2">获取方法的返回值类型名称</a>&nbsp;<br><a href="/blog/85a0b802/#封装成方法" class="header_2">封装成方法</a>&nbsp;<br><a href="/blog/85a0b802/#程序示例" class="header_2">程序示例</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 获取方法的返回值类型

|方法|描述|
|:--|:--|
|`Type getGenericReturnType()`|返回表示返回值类型的Type对象|
|`Class<?> getReturnType()`|返回表示返回值类型的Class对象|

这两个方法的区别主要是在返回值类型上:
-`Type`是一个接口
-`Class`是一个`Type`接口的子类.
-`Type`接口只有一个方法
-`Class`类方法比较多

## Type接口方法

|方法|描述|
|:--|:--|
|`default String getTypeName()`|Returns a string describing this type, including information about any type parameters.|

这个方法会返回返回值类型的**全限定名**,如:
-`java.lang.String`
-`void`

## Class类获取类名方法

|方法|描述|
|:--|:--|
|`String getName()`|Returns the name of the entity (class, interface, array class, primitive type, or void) represented by this Class object, as a String.|

这个方法也会返回类的全限定名,和上面的一样.
## 获取方法的返回值类型名称
所以如果想获取一个方法的返回值类型的名称,使用如下两种方式都可以:
- `method.getReturnType().getName();`
- `method.getGenericReturnType().getTypeName();`

## 封装成方法
```java
public static String getMethodReturnTypeName1(Method method) {
    return method.getGenericReturnType().getTypeName();
}

public static String getMethodReturnTypeName2(Method method) {
    return method.getReturnType().getName();
}
```

## 程序示例

```java
package returntype;

public class Return {

    public String returnStringMethod() {
        System.out.println("调用返回值为String的方法");
        return "返回值";
    }

    public void returnVoidMethod() {
        System.out.println("调用void方法");
    }
}
```
测试类:
```java
package returntype;

import java.lang.reflect.Method;
import java.lang.reflect.Type;

public class TestMethodReturnType {
    public static void main(String[] args) throws Exception {
        // 加载类
        Class<?> class1 = Class.forName("returntype.Return");
        //testReturnType1(class1);
        testReturnType2(class1);
    }

    private static void testReturnType2(Class<?> class1) {
        Method[] methods = class1.getDeclaredMethods();
        for (Method method : methods) {
            System.out.print("方法名:" + method.getName());
            System.out.print(" 返回值类型1:" + getMethodReturnTypeName1(method));
            System.out.println(" 返回值类型2:" + getMethodReturnTypeName2(method));
        }
    }

    private static void testReturnType1(Class<?> class1) {
        // 获取所有的方法
        Class returnType1;
        Type returnType2;
        Method[] methods = class1.getDeclaredMethods();
        for (int i = 0; i < methods.length; i++) {
            returnType1 = methods[i].getReturnType();
            returnType2 = methods[i].getGenericReturnType();
            System.out.print("方法名称:" + methods[i].getName());
            System.out.print(" 返回值类型1:" + returnType1.getName());
            System.out.println(" 返回值类型2:" + returnType2.getTypeName());
        }
    }

    public static String getMethodReturnTypeName1(Method method) {
        return method.getGenericReturnType().getTypeName();
    }

    public static String getMethodReturnTypeName2(Method method) {
        return method.getReturnType().getName();
    }

}
```
运行结果:
```
方法名:returnVoidMethod 返回值类型1:void 返回值类型2:void
方法名:returnStringMethod 返回值类型1:java.lang.String 返回值类型2:java.lang.String
```
