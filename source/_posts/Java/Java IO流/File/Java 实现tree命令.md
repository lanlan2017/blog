---
title: Java 实现tree命令
categories: 
  - Java
  - Java IO流
  - File
date: 2019-04-30 20:00:58
updated: 2019-12-09 20:34:56
abbrlink: bf650217
---
<div id='my_toc'>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/bf650217/#问题描述">问题描述</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/bf650217/#文件名称过滤器">文件名称过滤器</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/bf650217/#默认文件">默认文件</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/bf650217/#Maven-Java-Web项目文件名称过滤器">Maven Java Web项目文件名称过滤器</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/bf650217/#打印目录树主类-MyTree-java">打印目录树主类 MyTree.java</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/bf650217/#MyTree程序参数说明">MyTree程序参数说明</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/bf650217/#不带参数">不带参数</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/bf650217/#带一个参数">带一个参数</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/bf650217/#运行结果">运行结果</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/bf650217/#只打印目录">只打印目录</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/bf650217/#打印目录和文件">打印目录和文件</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/bf650217/#显示Maven-Java-Web项目结构">显示Maven Java Web项目结构</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
## 问题描述 ##
最近先现实项目的目录结构,查了一下`cmd`之后由`tree`命令,但是项目中有些目录和文件(如`.class`文件)是项目自动生成的,并不全部显示出来,我这想显示该项目必须要有的目录和文件即可,对于`IDE`等工具生成的目录忽略掉。这样使用`cmd`提供的`tree`命令无法满足我的要求,我有必要自己实现一个`tree`命令。下来是我用`java`实现的一个满足我特定要求的`tree`命令。
## 文件名称过滤器 ##
### 默认文件 ###
```java
package tree;
import java.io.File;
import java.io.FilenameFilter;
public class DefaultFileNameFileter implements FilenameFilter
{
    @Override
    public boolean accept(File dir, String name)
    {
        return true;
    }
}
```
### Maven Java Web项目文件名称过滤器 ###
对于项目中的`.setting`目录,`bin`目录,`.class`文件`.project`文件,这些文件都是`eclipse`自动生成的,在打印项目目录时候,这些目录都不需要打印出来.为了满足这个需求我使用文件名过滤器。代码如下所示：
```java
package tree;
import java.io.File;
import java.io.FilenameFilter;
public class MavenJavaWebFileNameFilter implements FilenameFilter
{
    private String RootPath = null;
    MavenJavaWebFileNameFilter(String RootPath)
    {
        this.RootPath = RootPath;
    }
    @Override
    public boolean accept(File dir, String name)
    {
        // 该文件不能以点号开头,
        // 也不能以txt文件结尾
        // 文件名称不能是bin
        // 文件名称不能是target
        if (name.startsWith(".") || name.endsWith(".txt"))
        {
            return false;
        }
        // 如果是根目录
        if (RootPath.equals(dir.getAbsolutePath()))
        {
            // 第一级目录下的bin目录,
            // 或者target目录(maven,输出)不是java项目必须目录所以不输出
            if ("bin".equals(name) || "target".equals(name)
                    || "test".equals(name))
            {
                return false;
            }
        }
        return true;
    }
}
```
## 打印目录树主类 MyTree.java ##
`MyTree.java`用来打印目录树,如下所示：
```java
package tree;
import java.io.File;
import java.io.FilenameFilter;
public class MyTree
{
    private static String RootPath = null;
    private static MavenJavaWebFileNameFilter mavenJaveWebFileNameFilter = null;
    private static DefaultFileNameFileter defaultFileNameFileter=new DefaultFileNameFileter();
    public static void main(String args[])
    {
        // String path = "E:\\workspace\\Regex";
        // String path = "E:\\workspace_web\\app17a";
        // 通过剪贴板读入目录
        // String path =SysClipboardUtil.getSysClipboardText();
        // 使用当前目录作为目录
        String path = System.getProperty("user.dir");
        // 保存根目录,后续要用到
        RootPath = path;
        mavenJaveWebFileNameFilter = new MavenJavaWebFileNameFilter(RootPath);
        File dir = new File(path);
        switch (args.length)
        {
            case 1 :
                oneArgs(args, dir);
                break;
            default :
                printTreeDir(dir);
                break;
        }
    }
    /**
     * 输入一个参数的情况.
     * 
     * @param args
     *            参数列表
     * @param dir
     *            目录的File对象.
     */
    private static void oneArgs(String[] args, File dir)
    {
        // TODO Auto-generated method stub
        String arg1 = args[0];
        switch (arg1)
        {
            case "f" :
                printTreeFileAndDir(dir, defaultFileNameFileter);
                break;
            case "java" :
                printTreeFileAndDir(dir, mavenJaveWebFileNameFilter);
                break;
            default :
                break;
        }
    }
    /**
     * 打印dir表示的目录的目录树.
     * 
     * @param dir
     *            表示目录的File对象.
     */
    public static void printTreeDir(File dir)
    {
        System.out.println(dir.getAbsolutePath());
        printTreeDir(dir, "", 0);
    }
    /**
     * @param dir
     */
    private static void printTreeDir(File dir, String prefix, int deep)
    {
        if (dir.isDirectory())
        {
            // 生成目录下的子目录列表
            File[] dirList = dir.listFiles(new FilenameFilter()
            {
                @Override
                public boolean accept(File dir, String name)
                {
                    // 该文件是目录,并且不能以点号开头,
                    // 点号开头的一般是隐藏文件
                    return new File(dir, name).isDirectory()
                            && !name.startsWith(".");
                }
            });
            String thisPrefix = "";
            String nextPrefix = "";
            for (int i = 0; i < dirList.length; i++)
            {
                if (deep >= 0)
                {
                    // 如果不是最后一个元素
                    if ((i + 1 < dirList.length))
                    {
                        // 不是最后一个目录都打印这个符号
                        thisPrefix = prefix + "├─";
                        // 下一个打印这符号表示展开目录
                        nextPrefix = prefix + "│ ";
                    } else
                    {
                        // 最后一个子目录项
                        thisPrefix = prefix + "└─";
                        //
                        nextPrefix = prefix + "  ";
                    }
                }
                System.out.println(thisPrefix + dirList[i].getName());
                printTreeDir(dirList[i], nextPrefix, deep + 1);
            }
        }
    }
    /**
     * @param dir
     */
    public static void printTreeFileAndDir(File dir,FilenameFilter fileNameFilter)
    {
        // 打印根目录
        System.out.println(dir.getAbsolutePath());
        printTreeFileAndDir(dir, fileNameFilter,"", 0);
    }
    /**
     * 打印目录树
     * 
     * @param dir
     *            目录
     * @param prefix
     *            前缀,需要打印在文件或者目录之前
     * @param deep
     *            深度
     */
    private static void printTreeFileAndDir(File dir,
            FilenameFilter fileNameFilter, String prefix, int deep)
    {
        // 列出目录下的子目录
        File[] childs = dir.listFiles(fileNameFilter);
        // 遍历子目录
        for (int i = 0; i < childs.length; i++)
        {
            // 本次递归的前缀
            String thisPrefix = "";
            // 下一个递归的前缀
            String nextPrefix = "";
            if (deep >= 0)
            {
                // 如果不是最后一个元素
                if ((i + 1 < childs.length))
                {
                    nextPrefix = prefix + "│ ";
                    thisPrefix = prefix + "├─";
                } else
                {
                    nextPrefix = prefix + "  ";
                    thisPrefix = prefix + "└─";
                }
            }
            System.out.println(thisPrefix + childs[i].getName());
            if (childs[i].isDirectory())
            {
                printTreeFileAndDir(childs[i], fileNameFilter, nextPrefix,
                        deep + 1);
            }
        }
    }
}
```
## MyTree程序参数说明 ##
### 不带参数 ###
该程序默认**不带参数**,默认情况下**只打印**当前目录下的所有非点号`.`开头的**目录**。
### 带一个参数 ###
目前该程序只允许带一个参数,如下所示：
- **`f`参数**:**不仅打印目录,还会打印目录下的文件**.
- `java`参数,显示`java`项目的目录结构,隐藏`IDE`等工具生成的文件


## 运行结果 ##
### 只打印目录 ###
**执行程序,不带任何参数**将会只打印目录
```cmd
E:\workspace_web\app17a
├─src
│ ├─main
│ │ ├─java
│ │ │ └─app17a
│ │ │   ├─controller
│ │ │   ├─domain
│ │ │   └─form
│ │ ├─resources
│ │ └─webapp
│ │   ├─css
│ │   ├─META-INF
│ │   └─WEB-INF
│ │     ├─jsp
│ │     └─lib
│ └─test
│   └─java
└─target
  ├─classes
  │ └─app17a
  │   ├─controller
  │   ├─domain
  │   └─form
  ├─m2e-wtp
  │ └─web-resources
  │   └─META-INF
  │     └─maven
  │       └─com.lan
  │         └─app17a
  └─test-classes
```
### 打印目录和文件 ###
**使用参数`f`,将打印目录和文件**,如下所示:
```cmd
E:\workspace_web\app17a
├─.classpath
├─.project
├─.settings
│ ├─.jsdtscope
│ ├─org.eclipse.jdt.core.prefs
│ ├─org.eclipse.m2e.core.prefs
│ ├─org.eclipse.wst.common.component
│ ├─org.eclipse.wst.common.project.facet.core.xml
│ ├─org.eclipse.wst.jsdt.ui.superType.container
│ ├─org.eclipse.wst.jsdt.ui.superType.name
│ └─org.eclipse.wst.validation.prefs
├─pom.xml
├─src
│ ├─main
│ │ ├─java
│ │ │ └─app17a
│ │ │   ├─controller
│ │ │   │ ├─InputProductController.java
│ │ │   │ └─SaveProductController.java
│ │ │   ├─domain
│ │ │   │ └─Product.java
│ │ │   └─form
│ │ │     └─ProductForm.java
│ │ ├─resources
│ │ └─webapp
│ │   ├─css
│ │   │ └─main.css
│ │   ├─index.jsp
│ │   ├─META-INF
│ │   │ └─MANIFEST.MF
│ │   └─WEB-INF
│ │     ├─jsp
│ │     │ ├─ProductDetails.jsp
│ │     │ └─ProductForm.jsp
│ │     ├─lib
│ │     ├─springmvc-servlet.xml
│ │     └─web.xml
│ └─test
│   └─java
└─target
  ├─classes
  │ └─app17a
  │   ├─controller
  │   │ ├─InputProductController.class
  │   │ └─SaveProductController.class
  │   ├─domain
  │   │ └─Product.class
  │   └─form
  │     └─ProductForm.class
  ├─m2e-wtp
  │ └─web-resources
  │   └─META-INF
  │     ├─MANIFEST.MF
  │     └─maven
  │       └─com.lan
  │         └─app17a
  │           ├─pom.properties
  │           └─pom.xml
  └─test-classes
```
### 显示Maven Java Web项目结构 ###
输入参数`java`,将调用这个功能.这个是我定制的功能,可能还是有些不足的地方,先这样用吧.
```cmd
E:\workspace_web\app17a
├─pom.xml
└─src
  ├─main
  │ ├─java
  │ │ └─app17a
  │ │   ├─controller
  │ │   │ ├─InputProductController.java
  │ │   │ └─SaveProductController.java
  │ │   ├─domain
  │ │   │ └─Product.java
  │ │   └─form
  │ │     └─ProductForm.java
  │ ├─resources
  │ └─webapp
  │   ├─css
  │   │ └─main.css
  │   ├─index.jsp
  │   ├─META-INF
  │   │ └─MANIFEST.MF
  │   └─WEB-INF
  │     ├─jsp
  │     │ ├─ProductDetails.jsp
  │     │ └─ProductForm.jsp
  │     ├─lib
  │     ├─springmvc-servlet.xml
  │     └─web.xml
  └─test
    └─java
```
