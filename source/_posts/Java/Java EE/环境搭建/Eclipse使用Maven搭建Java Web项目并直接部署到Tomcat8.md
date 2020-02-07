---
title: Eclipse使用Maven搭建Java Web项目并直接部署到Tomcat8
categories: 
  - Java
  - Java EE
  - 环境搭建
date: 2019-04-26 17:42:04
updated: 2019-12-17 05:18:52
abbrlink: 9b044702
---
<div id='my_toc'><a href="/blog/9b044702/#使用的软件版本" class="header_1">使用的软件版本</a>&nbsp;<br><a href="/blog/9b044702/#Maven安装" class="header_1">Maven安装</a>&nbsp;<br><a href="/blog/9b044702/#下载" class="header_2">下载</a>&nbsp;<br><a href="/blog/9b044702/#解压" class="header_2">解压</a>&nbsp;<br><a href="/blog/9b044702/#配置环境变量" class="header_2">配置环境变量</a>&nbsp;<br><a href="/blog/9b044702/#M2_HOME环境变量" class="header_3">M2_HOME环境变量</a>&nbsp;<br><a href="/blog/9b044702/#path环境变量" class="header_3">path环境变量</a>&nbsp;<br><a href="/blog/9b044702/#集成到Eclipse" class="header_2">集成到Eclipse</a>&nbsp;<br><a href="/blog/9b044702/#Eclipse之中创建Maven-Web项目" class="header_1">Eclipse之中创建Maven Web项目</a>&nbsp;<br><a href="/blog/9b044702/#创建Maven-Web项目" class="header_2">创建Maven Web项目</a>&nbsp;<br><a href="/blog/9b044702/#修改项目配置" class="header_2">修改项目配置</a>&nbsp;<br><a href="/blog/9b044702/#把Maven-Web项目改为Java-Web项目" class="header_3">把Maven Web项目改为Java Web项目</a>&nbsp;<br><a href="/blog/9b044702/#选择JDK版本" class="header_4">选择JDK版本</a>&nbsp;<br><a href="/blog/9b044702/#选择Dynamic-Web-Module版本" class="header_4">选择Dynamic Web Module版本</a>&nbsp;<br><a href="/blog/9b044702/#选择Tomcat" class="header_4">选择Tomcat</a>&nbsp;<br><a href="/blog/9b044702/#创建java目录" class="header_4">创建java目录</a>&nbsp;<br><a href="/blog/9b044702/#效果" class="header_4">效果</a>&nbsp;<br><a href="/blog/9b044702/#修改web-xml" class="header_3">修改web.xml</a>&nbsp;<br><a href="/blog/9b044702/#修改pom-xml" class="header_3">修改pom.xml</a>&nbsp;<br><a href="/blog/9b044702/#测试" class="header_3">测试</a>&nbsp;<br><a href="/blog/9b044702/#编写HelloWorldServlet" class="header_4">编写HelloWorldServlet</a>&nbsp;<br><a href="/blog/9b044702/#使用Maven一键部署到Tomcat中" class="header_1">使用Maven一键部署到Tomcat中</a>&nbsp;<br><a href="/blog/9b044702/#设置tomcat用户密码" class="header_2">设置tomcat用户密码</a>&nbsp;<br><a href="/blog/9b044702/#修改Mawen的配置文件" class="header_2">修改Mawen的配置文件</a>&nbsp;<br><a href="/blog/9b044702/#安装Tomcat-Maven部署插件" class="header_2">安装Tomcat Maven部署插件</a>&nbsp;<br><a href="/blog/9b044702/#部署" class="header_2">部署</a>&nbsp;<br><a href="/blog/9b044702/#运行服务器" class="header_3">运行服务器</a>&nbsp;<br><a href="/blog/9b044702/#使用Maven部署项目" class="header_3">使用Maven部署项目</a>&nbsp;<br><a href="/blog/9b044702/#Tomcat之中部署的效果" class="header_2">Tomcat之中部署的效果</a>&nbsp;<br><a href="/blog/9b044702/#参考资料" class="header_1">参考资料</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 使用的软件版本 #
- `eclipse for Java EE 2019`
- `jdk 1.8`
- `Tomacat 8.5`
- `Maven 3.5.4`

# Maven安装 #
## 下载 ##
## 解压 ##
## 配置环境变量 ##
### M2_HOME环境变量 ###
### path环境变量 ###
## 集成到Eclipse ##

# Eclipse之中创建Maven Web项目 #
## 创建Maven Web项目 ##
在`Eclipse`显示项目的`Package Explorer`的空白处点击鼠标右键,然后依次选择:`New-Other...`
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/1.png)
在弹出的`New`窗口中,展开`Maven`,选择`Maven Project`,然后点击`Next`。
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/2.png)
然后默认,点击`Next`
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/3.png)
往下拖动滚动条到最后,选择`maven-archetype-webapp`,点击`Next`
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/4.png)
填入坐标,`Group Id`，`Artifact Id`,剩下的随意,最后点击`Finish`即可
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/5.png)
这样就创建好了一个`Maven`的`Web`项目,这个项目会报错,如下图所示,这是因为还没有引入`Tomcat`的库导致的.
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/6.png)
## 修改项目配置 ##
### 把Maven Web项目改为Java Web项目 ###
在项目上点击右键,选择`Properties`：
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/7.png)
#### 选择JDK版本 ####
展开`Maven`,选择`Proiect Facets`,取消勾选`Dynamic Web Module`,然后把Java的版本改为`1.8`,然后点击`Apply`
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/8.png)
#### 选择Dynamic Web Module版本 ####
接着把`Dynamic Web Module`的版本改为`3.1`,然后勾选上`Dynamic Web Module`,这个时候下面会弹出这个链接`Further configuration available....`:
###3 指定Web应用根目录 ####
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/18.png)
点击这个连接,然后勾选上`Generate web. xml deployment descriptor`,点击`OK`
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/19.png)
#### 选择Tomcat ####
然后点击右边的`Runtimes`勾选上对应的`Tomcat`,最后点击`Apply and Close`即可。
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/20.png)
#### 创建java目录 ####
在`src`下面的`main`目录下创建一个`java`目录,我们后面的`java`代码会放在这里
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/21.png)
#### 效果 ####
此时的项目结构如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/22.png)
### 修改web.xml ###
打开`web.xml`文件,可以看到默认生成的代码如下：
```xml
<!DOCTYPE web-app PUBLIC
 "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
 "http://java.sun.com/dtd/web-app_2_3.dtd" >
<web-app>
  <display-name>Archetype Created Web Application</display-name>
</web-app>
```
全选,然后粘贴如下代码:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns="http://xmlns.jcp.org/xml/ns/javaee"
    xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
    id="WebApp_ID" version="3.1">
    <display-name>HelloWorld</display-name>
</web-app>
```
到这里就可启动项目了,看到效果了。

### 修改pom.xml ###
把`junit`版本改为4.12.
### 测试 ###
启动项目,浏览器将显示`index.jsp`页面之中的内容,如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/24.png)
#### 编写HelloWorldServlet ####
在`src/main/java`下创建一个`hello`包,创建一个`HelloWorldServlet.java`文件,粘贴如下代码：
```java
package hello;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/HelloWorldServlet")
public class HelloWorldServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException,IOException
    {
        response.setContentType("text/html,charset=utf-8;");
        PrintWriter writer = response.getWriter();
        writer.println(
            "<html><head><title>helloworld</title></head>"
                + "<body><h2>HelloWorld</h2></body>"
                + "</html>");
    }
}
```
地址上面输入URL:[http://localhost:8080/HelloWorld/HelloWorldServlet](http://localhost:8080/HelloWorld/HelloWorldServlet)即可访问到该`Servlet`,显示效果如下:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/23.png)

# 使用Maven一键部署到Tomcat中 #
上面我们用的是`Eclipse`部署的,使用`Maven`可以打包把项目部署成`war`包
## 设置tomcat用户密码 ##
打开`Tomcat`安装目录中`conf`目录下的`tomcat-users.xml`配置文件,或者`Eclipse`中`Server`项目中的`tomcat-users.xml`,在`<tomcat-users></tomcat-users>`之中添加如下代码:
```xml
<role rolename="manager-gui" />
<role rolename="manager-script" />
<role rolename="manager-jmx" />
<role rolename="manager-status" />
<user password="admin" username="admin"
    roles="manager-gui,manager-script,manager-jmx,manager-status" />
```
`user`标签表示一个后台管理员，其中`username`,`password`分别是该后台管理员的账户和密码,`roles`属性对应上面的`role`标签,一个`role`表示一个权限
## 修改Mawen的配置文件 ##
打开`Maven`安装目录下`conf`目录下的`settings.xml`配置文件,或者%`HOME`%`\.m2`目录下的`settings.xml`
`<servers></servers>`标签中添加如下代码:
```xml
<server> 
    <id>tomcat8</id>
    <username>admin</username>
    <password>admin</password>
</server>
```
## 安装Tomcat Maven部署插件 ##
项目中的`pom.xml`,在`<build></build>`标签之中添加如下代码:
```xml
<plugins>
    <plugin>
        <groupId>org.apache.tomcat.maven</groupId>
        <artifactId>tomcat7-maven-plugin</artifactId>
        <version>2.2</version>
        <configuration>
            <url>http://127.0.0.1:8080/manager/text</url>
            <username>admin</username>
            <password>admin</password>
            <path>/HelloWorld</path>
        </configuration>
    </plugin>
</plugins>
```
用户名和密码与上面一致，其中<`path`>标签表示部署在`tomcat`,`webapp`下的路径,
## 部署 ##
### 运行服务器 ###
在eclipse之中运行服务器,
### 使用Maven部署项目 ###
右键项目，

![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/12.png)
输入如下命令:
```cmd
clean install tomcat7:redeploy
```
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/13.png)
部署成功控制台输出如下：
```cmd
[INFO] Deploying war to http://127.0.0.1:8080/HelloWorld  
Uploading: http://127.0.0.1:8080/manager/text/deploy?path=%2FHelloWorld&update=true
Uploaded: http://127.0.0.1:8080/manager/text/deploy?path=%2FHelloWorld&update=true (3 KB at 2249.0 KB/sec)
[INFO] tomcatManager status code:200, ReasonPhrase:
[INFO] OK - Deployed application at context path [/HelloWorld]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 3.765 s
[INFO] Finished at: 2019-04-26T18:45:17+08:00
[INFO] ------------------------------------------------------------------------
```
看到`BUILD SUCCESS`这句话就表示部署成功了,`Deploying war to http://127.0.0.1:8080/HelloWorld`
这句话表示部署到了[http://127.0.0.1:8080/HelloWorld](http://127.0.0.1:8080/HelloWorld)这个URL上.打开这个`URL`即可看到效果：
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/14.png)
## Tomcat之中部署的效果 ##
打开`tomcat`的`webapps`目录可以看到`Maven`部署的`war`包:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/15.png)

# 参考资料 #
[https://blog.csdn.net/ai_lian_shuo/article/details/77096071#t11](https://blog.csdn.net/ai_lian_shuo/article/details/77096071#t11)
[https://www.linuxidc.com/Linux/2017-05/143308.htm](https://www.linuxidc.com/Linux/2017-05/143308.htm)
