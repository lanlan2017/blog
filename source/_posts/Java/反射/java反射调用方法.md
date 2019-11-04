---
title: java反射调用方法
categories: 
  - Java
  - 反射
date: 2019-06-16 13:53:20
updated: 2019-10-30 11:55:40
abbrlink: 40640d2
---
- [反射调用方法步骤](/blog/html/40640d2/#反射调用方法步骤)
- [实例](/blog/html/40640d2/#实例)
    - [项目结构](/blog/html/40640d2/#项目结构)
    - [Tool.java](/blog/html/40640d2/#Tool-java)
    - [Test.java](/blog/html/40640d2/#Test-java)
    - [调用静态方法](/blog/html/40640d2/#调用静态方法)
        - [调用无参的静态方法](/blog/html/40640d2/#调用无参的静态方法)
        - [调用带参的静态方法](/blog/html/40640d2/#调用带参的静态方法)
    - [调用实例方法](/blog/html/40640d2/#调用实例方法)
        - [调用无参实例方法](/blog/html/40640d2/#调用无参实例方法)
        - [调用带参实例方法](/blog/html/40640d2/#调用带参实例方法)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 反射调用方法步骤 #
- 1.获取`Class`对象,使用`Class.forName("类的全限定名")`来加载类的实例,
- 2.获取要调用的方法的`Method`对象,使用`Class对象.getMethod("方法名",形参列表)`获取要调用的方法.
- 3.使用`Method对象.invoke(该方法的拥有者,实参列表)`调用方法.
    - 方法的拥有者可以是类和实例,
        - 如果是静态方法则拥有者设为类(`Class`对象),
        - 如果是实例方法,则方法的拥有者设置为实例(`Object`对象).这时就要求先创建好实例(`Object`对象). 
            - 创建实例时,可以通过调用无参构造方法来创建。`Class对象.newInstance()`可以调用无参构造器,创建默认实例
            - 创建实例时,也可以调用带参构造器,通过`Class对象.getConstructor(形参列表)`可以创建一个指定的构造器(`Constructor`),然后调用`Constructor对象.newInstance(实参列表);`就可创建指定参数的实例.

# 实例 #
## 项目结构 ##
```cmd
E:\workspace_web2\TestReflect
└─src
  ├─test
  │ └─Test.java
  └─tools
    └─Tools.java
```
## Tool.java ##
```java
package tools;
public class Tools {
    String name;
    String sex;
    /**
     * @param name
     * @param sex
     */
    public Tools(String name, String sex)
    {
        super();
        this.name = name;
        this.sex = sex;
    }
    public static void publicStaticMethod()
    {
        System.out.println("公有 无参 静态 方法 被调用...");
    }
    public static void publicStaticMethod(String arg1, String arg2)
    {
        System.out.println("公有 带参 静态 方法 被调用...");
        System.out.println("    参数1:" + arg1 + ",参数2:" + arg2);
    }
    public void puablicInstanceMethod()
    {
        System.out.println("公有 无参 实例 方法 被调用...");
        System.out.println("Tools [name=" + name + ", sex=" + sex + "]");
    }
    public void puablicInstanceMethod(String arg1, String arg2)
    {
        System.out.println("公有 带参 实例 方法 被调用...");
        System.out.println("    参数1:" + arg1 + ",参数2:" + arg2);
    }
}
```
`Tools.java`中定义了一个带参的构造方法,以及无参的静态方法,带参的静态方法,无参的实例方法,带参的实例方法.下面使用反射来调用这些方法.
## Test.java ##
使用反射会抛出大量的异常,但是本文的重点在于反射,所以我把所有的异常简单的抛出.
```java
package test;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
public class Test {
    public static void main(String[] args) throws Exception
    {
//         callPublicStaticMethod();
//         callPublicStaticMethod("Hello", "World");
//         callPublicInstanceMethod();
        callPublicInstanceMethod("Hello", "World");
    }
    private static void callPublicStaticMethod() throws Exception
    {
        Class<?> classIns = Class.forName("tools.Tools");
        // 获取不带参数的方法,
        // getMethod第一个参数是方法名称,后面是方法的形参列表
        Method method = classIns.getMethod("publicStaticMethod");
        // invoke方法的第一个参数是该方法的调用者,
        // 如果是静态方法,则设置调用者为类,
        // 如果是实例方法,则调用者为实例
        // invoke后面的参数是方法的实参列表,不需要参数可以省略.
        // 调用类classIns的无参静态方法
        method.invoke(classIns);
    }
    private static void callPublicStaticMethod(String arg1, String age2) throws Exception
    {
        Class<?> classIns = Class.forName("tools.Tools");
        // 获取不带参数的方法,
        // getMethod第一个参数是方法名称,后面是方法的形参列表
        Method method = classIns.getMethod("publicStaticMethod", String.class, String.class);
        // invoke方法的第一个参数是该方法的调用者,如果是静态方法,则设置调用者为类,如果是实例方法,则调用者为实例
        // invoke后面的参数是方法的实参列表,不需要参数可以不写
        // 调用类classIns的带参静态方法
        method.invoke(classIns, arg1, age2);
    }
    private static void callPublicInstanceMethod() throws Exception
    {
        // 获取类
        Class<?> class1 = Class.forName("tools.Tools");
        // 根据参数列表获取构造器
        Constructor<?> constructor = class1.getConstructor(String.class, String.class);
        // 创建对象
        Object object = constructor.newInstance("小明", "男");
        // 获取不带参数的方法,
        // getMethod第一个参数是方法名称,后面的参数是方法的形参列表,没有参数可以不写
        Method method = class1.getMethod("puablicInstanceMethod");
        // 调用实例object的puablicInstanceMethod方法.
        method.invoke(object);
    }
    private static void callPublicInstanceMethod(String arg1, String arg2) throws Exception
    {
        // 获取类
        Class<?> class1 = Class.forName("tools.Tools");
        // 根据参数列表获取构造器
        Constructor<?> constructor = class1.getConstructor(String.class, String.class);
        // 创建对象
        Object object = constructor.newInstance("小明", "男");
        // 获取不带参数的方法,
        // getMethod第一个参数是方法名称,后面的参数是方法的形参列表,没有参数可以不写
        Method method = class1.getMethod("puablicInstanceMethod", String.class, String.class);
        // invoke方法的第一个参数是该方法的调用者,
        // 如果是静态方法,则设置调用者为类,
        // 如果是实例方法,则调用者为实例
        // invoke后面的参数是方法的实参列表,
        // 调用实例object的puablicInstanceMethod方法.
        method.invoke(object, arg1, arg2);
    }
}
```
## 调用静态方法 ##
### 调用无参的静态方法 ###
```java
private static void callPublicStaticMethod() throws Exception
{
    Class<?> classIns = Class.forName("tools.Tools");
    // 获取不带参数的方法,
    // getMethod第一个参数是方法名称,后面是方法的形参列表
    Method method = classIns.getMethod("publicStaticMethod");
    // invoke方法的第一个参数是该方法的调用者,如果是静态方法,则设置调用者为类,如果是实例方法,则调用者为实例
    // invoke后面的参数是方法的实参列表,不需要参数可以不写
    // 调用类classIns的无参静态方法
    method.invoke(classIns);
}
```
#### 运行效果 ####
```cmd
公有 无参 静态 方法 被调用...
```
### 调用带参的静态方法 ###
```java
private static void callPublicStaticMethod(String arg1, String age2) throws Exception
{
    Class<?> classIns = Class.forName("tools.Tools");
    // 获取不带参数的方法,
    // getMethod第一个参数是方法名称,后面是方法的形参列表
    Method method = classIns.getMethod("publicStaticMethod", String.class, String.class);
    // invoke方法的第一个参数是该方法的调用者,如果是静态方法,则设置调用者为类,如果是实例方法,则调用者为实例
    // invoke后面的参数是方法的实参列表,不需要参数可以不写
    // 调用类classIns的带参静态方法
    method.invoke(classIns, arg1, age2);
}
```
#### 运行效果 ####
```cmd
公有 带参 静态 方法 被调用...
    参数1:Hello,参数2:World
```
## 调用实例方法 ##
### 调用无参实例方法 ###
```java
private static void callPublicInstanceMethod() throws Exception
{
    // 获取类
    Class<?> class1 = Class.forName("tools.Tools");
    // 根据参数列表获取构造器
    Constructor<?> constructor = class1.getConstructor(String.class, String.class);
    // 创建对象
    Object object = constructor.newInstance("小明", "男");
    // 获取不带参数的方法,
    // getMethod第一个参数是方法名称,后面的参数是方法的形参列表,没有参数可以不写
    Method method = class1.getMethod("puablicInstanceMethod");
    // 调用实例object的puablicInstanceMethod方法.
    method.invoke(object);
}
```
运行效果:
```cmd
公有 无参 实例 方法 被调用...
Tools [name=小明, sex=男]
```
### 调用带参实例方法 ###
```java
private static void callPublicInstanceMethod(String arg1, String arg2) throws Exception
{
    // 获取类
    Class<?> class1 = Class.forName("tools.Tools");
    // 根据参数列表获取构造器
    Constructor<?> constructor = class1.getConstructor(String.class, String.class);
    // 创建对象
    Object object = constructor.newInstance("小明", "男");
    // 获取不带参数的方法,
    // getMethod第一个参数是方法名称,后面的参数是方法的形参列表,没有参数可以不写
    Method method = class1.getMethod("puablicInstanceMethod", String.class, String.class);
    // invoke方法的第一个参数是要调用方法的拥有者,后面剩下的参数是该方法的实参列表
    method.invoke(object, arg1, arg2);
}
```
运行效果:
```cmd
公有 带参 实例 方法 被调用...
    参数1:Hello,参数2:World
```
>原文链接: [java反射调用方法](https://lanlan2017.github.io/blog/40640d2/)