---
title: 手动部署Servlet
categories: 
  - 编程
  - Java
  - Java EE
  - Servlet
date: 2019-04-19 14:31:25
updated: 2020-04-11 09:21:19
abbrlink: 4a8ee7ac
---
# 手动部署Servlet #
## 创建项目结构 ##
### java web应用部署路径 ###
`java web`项目会部署到`Tomcat`的安装目录下的`webapps`目录中：`E:\apache-tomcat-8.5.35\webapps\`
### 创建项目目录 ###
在`webapps`目录下新建一个文件夹,取名为`app01a`,这个目录表示一个名为`app01a`的`Java web`项目。
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/Servlet/byHand/5.png)
### 项目目录下创建WEB-INF目录 ###
在项目目录`app01a`下创建`WEB-INF`目录,`WEB-INF`目录是无法通过浏览器进行访问的,`WEB-INF`之外的其他路径都可以通过浏览器来访问到。
#### WEB-INF下创建lib目录 ####
在`WEB-INF`目录下创建`lib`目录
#### WEB-INF下创建classes目录 ####
在项目目录`WEB-INF`下创建`classes`目录,`classes`目录用来存放编译好的`Servlet`(`.class`):

## 编写Servlet ##
随便找个地方创建一个名为`MyServlet.java`的文件,然后在该文件中粘贴如下测试代码:
```java
package app01a;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
@WebServlet(
    name = "MyServlet",
    urlPatterns ={"/my"}
)
public class MyServlet
    implements
        Servlet
{
    private transient ServletConfig servletConfig;
    @Override
    public void init(ServletConfig servletConfig) 
        throws ServletException
    {
        this.servletConfig = servletConfig;
    }
    @Override
    public ServletConfig getServletConfig()
    {
        return servletConfig;
    }
    @Override
    public String getServletInfo()
    {
        return "My Servlet";
    }
    @Override
    public void service(ServletRequest request,
        ServletResponse response)
            throws ServletException,IOException
    {
        String servletName =
            servletConfig.getServletName();
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        writer.print("<html><head></head>" +
            "<body>Hello from " + 
            servletName + 
            "</body></html>");
    }
    @Override
    public void destroy()
    {}
}
```
## 编译Servlet ##
### 配置编译环境 ###
**这个MyServlet.java源文件是不能直接用javac编译的**,错误输出如下:
```cmd
E:\workspace_web\app01a\src\app01a>javac -encoding utf-8 MyServlet.java
MyServlet.java:4: 错误: 程序包javax.servlet不存在
import javax.servlet.Servlet;
                    ^
MyServlet.java:5: 错误: 程序包javax.servlet不存在
import javax.servlet.ServletConfig;
                    ^
MyServlet.java:6: 错误: 程序包javax.servlet不存在
import javax.servlet.ServletException;
                    ^
MyServlet.java:7: 错误: 程序包javax.servlet不存在
import javax.servlet.ServletRequest;
                    ^
MyServlet.java:8: 错误: 程序包javax.servlet不存在
import javax.servlet.ServletResponse;
                    ^
MyServlet.java:9: 错误: 程序包javax.servlet.annotation不存在
import javax.servlet.annotation.WebServlet;
```
这是因为`javac`命令找不到`servlet-api.jar`这个`jar`包,这个`servlet-api.jar`可以在`Tomcat`的安装路径下的`lib`目录中找到：
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/Servlet/byHand/4.png)
复制这个`jar`文件,粘贴到`%JAVA_HOME%\jre\lib\ext\`目录下,如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/Servlet/byHand/1.png)
这样我们就可以直接编译`java`源文件了.
### 使用javac命令编译 ###
我使用的编码是`UTF-8`的，所以用：`javac -encoding utf-8 MyServlet.java`进行编译:
```cmd
Microsoft Windows [版本 10.0.17134.407]
(c) 2018 Microsoft Corporation。保留所有权利。
E:\workspace_web\app01a\src\app01a>javac -encoding utf-8 MyServlet.java
E:\workspace_web\app01a\src\app01a>
```
这样会在当前目录下生成一个`MyServlet.class`文件,如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/Servlet/byHand/2.png)
## 部署Servlet ##
### 创建包目录 ###
在`WEB-INF/classes/`目录下创建对应的包目录:`app01a`
### 粘贴字节码文件到包目录中 ###
复制生成的`MyServlet.class`,然后粘贴到包目录`WEB-INF/classes/app01a/`下,这样`MyServlet`就部署完毕了,最终的目录结构如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/Servlet/byHand/6.png)
## 访问Servlet ##
通过下面的`URL`即可访问到该`Servlet`,
[http://localhost:8080/app01a/my](http://localhost:8080/app01a/my)
浏览器显示效果如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/Servlet/byHand/3.png)
