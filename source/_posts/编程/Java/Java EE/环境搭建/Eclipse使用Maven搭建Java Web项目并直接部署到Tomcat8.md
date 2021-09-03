---
title: Eclipse使用Maven搭建Java Web项目并直接部署到Tomcat8
categories: 
  - 编程
  - Java
  - Java EE
  - 环境搭建
date: 2019-04-26 17:42:04
updated: 2020-04-11 09:21:19
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

# Eclipse创建Maven Web项目并运行 #
## 创建Maven Web项目 ##
在`Eclipse`显示项目的`Package Explorer`的空白处点击鼠标右键,然后依次选择:`New-Other...`

![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/1.png)

在弹出的`New`窗口中,展开`Maven`,选择`Maven Project`,然后点击`Next`。

![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/2.png)

然后默认,点击`Next`

![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/3.png)

往下拖动滚动条到最后,选择`maven-archetype-webapp`,点击`Next`

![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/4.png)

如果找不到，可以选择Internal，然后拖动到滚动条到最后，选择`maven-archetype-webapp`,点击`Next`

![image-20210831165051568](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210831165058.png)

填入坐标,`Group Id`，`Artifact Id`,剩下的随意,最后点击`Finish`即可

![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/5.png)

这样就创建好了一个`Maven`的`Web`项目,这个项目会报错,如下图所示,这是因为还没有引入`Tomcat`的库导致的.

![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/6.png)

## 修改项目配置 ##
### 把Maven Web项目改为Java Web项目 ###
在项目上点击右键,选择`Properties`：

![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/7.png)

#### 选择JDK版本 ####
展开`Maven`,选择`Proiect Facets`,**取消勾选**`Dynamic Web Module`,然后把Java的版本改为`1.8`,然后点击`Apply`

![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/8.png)

#### 重新选择Dynamic Web Module版本 ####
接着把`Dynamic Web Module`的版本改为`3.1`,然后勾选上`Dynamic Web Module`,这个时候下面会弹出这个链接`Further configuration available....`:

##### 指定Web应用根目录 ######

![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/18.png)

点击这个连接,然后勾选上`Generate web. xml deployment descriptor`,点击`OK`

![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/19.png)

![image-20210831165704903](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210831165705.png)

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
这个2.3版本太老了。改成3.1版本的。
#### 修改方式1：复制粘贴
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
#### 修改方式2：生成

删除掉web.xml

![image-20210831170105661](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210831170105.png)

重新生成

![image-20210831170207424](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210831170207.png)

到这里就可启动项目了,看到效果了。

### 修改pom.xml ###
把`junit`版本改为4.12.
## 测试 ##
### 启动项目Run on Server

![image-20210831170538987](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210831170539.png)

浏览器将显示`index.jsp`页面之中的内容,如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/24.png)

## 编写代码
### 编写HelloWorldServlet ####

#### 创建包

在`src/main/java`下创建一个`hello`包,

![image-20210831170739596](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210831170739.png)

#### 创建Servlet

在包上面，右键，选择Servlet:

![image-20210831170919372](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210831170919.png)

输入Servlet名称HelloWorldServlet

![image-20210831171035960](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210831171036.png)

点击next,设置这个Servlet的URL

![image-20210831171137384](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210831171137.png)

勾选要实现的方法：

![image-20210831171331247](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210831171331.png)

#### HelloWorldServlet完整代码
修改`HelloWorldServlet`文件,得到如下代码：

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
#### 浏览器访问
**Run On server**,然后打开浏览器，在地址上面输入URL:
[http://localhost:8080/HelloWorld/HelloWorldServlet](http://localhost:8080/HelloWorld/HelloWorldServlet)
即可访问到该`Servlet`,显示效果如下:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/23.png)

# 使用Maven一键部署到Tomcat中 #
上面我们用的是`Eclipse`部署的,使用`Maven`可以打包把项目部署成`war`包
## 设置tomcat用户密码 ##
打开`Tomcat`安装目录中`conf`目录下的`tomcat-users.xml`配置文件,

或者`Eclipse`中`Server`项目中的`tomcat-users.xml`,在`<tomcat-users></tomcat-users>`之中添加如下代码:

```xml
<role rolename="admin"/>
<role rolename="manager"/>
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<user username="admin" password="admin" roles="admin,manager,manager-gui,manager-script"/>
```
- `role`标签表示权限。
- `user`标签表示一个后台管理员，`user`标签的
  - `username`,`password`这两个属性分别是该后台管理员的**账户**和**密码**,
  - `roles`属性对应上面的`role`标签.



![image-20210901104704380](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210901104704.png)

## 验证密码

启动Tomcat,然后进入manager

![image-20210901104919066](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210901104919.png)

此时会要求你输入密码，输入你上面设置好的密码:

![image-20210901105020297](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210901105020.png)

如果能成功进入如下界面，则说明设置Tomcat的密码成功了：

![image-20210901105447959](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210901105448.png)

## 修改Maven的配置文件 ##

打开`Maven`安装目录下`conf`目录下的`settings.xml`配置文件,或者`%HOME%\.m2`目录下的`settings.xml`,在
`<servers></servers>`标签中添加如下代码:

```xml
<server>
    <id>tomcatserver</id>
    <username>admin</username>
    <password>admin</password>
</server>
```
![image-20210901111047787](https://gitee.com/XiaoLan223/images/raw/master/Blog/Sum/20210901111047.png)

## 安装Tomcat Maven部署插件 ##

### tomcat7的插件
项目中的`pom.xml`,在`<build></build>`标签之中添加如下代码:
```xml
<project ...>
    ...
    <build>
        <finalName>HelloWorld</finalName>
        <plugins>
            <plugin>
                <!-- https://mvnrepository.com/artifact/org.apache.tomcat.maven/tomcat7-maven-plugin -->
                <groupId>org.apache.tomcat.maven</groupId>
                <artifactId>tomcat7-maven-plugin</artifactId>
                <version>2.2</version>
                <configuration>
                    <url>http://localhost:8080/manager/text</url>
                    <server>tomcatserver</server>
                    <!-- <path>/HelloWorld</path> -->
                    <username>admin</username>
                    <password>admin</password>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
```
`<plugin>`元素详解
- groupId，artifactId，version为固定内容，这里使用的是tomcat7-maven-plugin，类似的还有tomcat8-maven-plugin和tomcat9-maven-plugin。但是我使用8和9的都部署失败。不知道是什么原因
- configuration标签的子标签
- `<url>`标签。Tomcat8.5的管理界面的url为`http://localhost:8080/manager/html`,把html该成text就得到url标签的值。至于为什么要改成text,这个我不知道。我为html，时运行失败。
- `<path>`标签表示该web项目将部署到在`tomcat`的`webapp`下的的`/HelloWorld`路径中。path可以不指定，如果不指定的，会使用项目名。**最好不要指定path**,这样便于把这段代码复制到其他项目中，会在webapp中生成该项目的同名目录。而不是继续部署到webapp下的HelloWorld中。
  - 例如这段代码原本写在HelloWorld的pom中，现在复制到Login6SsmMaven的pom中，如果保留path标签，则Login6SsmMaven项目的内容，就会覆盖到HelloWorld，造成HelloWorld原来的内容丢失。并且通过路径/Login6SsmMaven也访问不到Login6SsmMaven，必须通过/HelloWorld来访问Login6SsmMaven项目的内容。
- `<username>`和`<password>`与上面的Maven的`settings.xml`配置文件中设置的用户名和密码一样
- `<server>`中的`tomcatserver`和上面的Maven的`settings.xml`配置文件中设置的id一样。



## 部署 ##

### 先运行Tomcat ###
**先运行Tomcat再部署**,**先运行Tomcat再部署**，**先运行Tomcat再部署**

到Tomcat安装目录下的bin目录下，运行`startup.bat`
```
G:\apache-tomcat-8.5.35-windows-x64\apache-tomcat-8.5.35\bin\startup.bat
```
如果在Eclipse中启动Tomcat的话，然后再部署，我之前是可以成功部署的。但是今天实测不能部署，所以保险起见还是通过startup.bat来启动Tomcat比较合适。
### 再使用Maven部署项目 ###
回到Eclipse中，右键项目，

![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/12.png)
输入如下命令:
```cmd
clean install tomcat7:redeploy
```
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/13.png)
部署成功控制台输出如下：

```
[INFO] Scanning for projects...
[INFO] 
[INFO] ------------------------< com.blue:HelloWorld >-------------------------
[INFO] Building HelloWorld Maven Webapp 0.0.1-SNAPSHOT
[INFO] --------------------------------[ war ]---------------------------------
[INFO] 
[INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ HelloWorld ---
[INFO] Deleting E:\dev2\workspacne_JDK8Tomcat8.5\HelloWorld\target
[INFO] >> 阿里云Maven中央仓库为阿里云云效提供的公共代理仓库
[INFO] >> 云效也提供了免费、可靠的Maven私有仓库Packages，欢迎您体验使用
[INFO] >> https://packages.aliyun.com?channel=pd_maven_download
[INFO] 
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ HelloWorld ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] Copying 0 resource
[INFO] >> 阿里云Maven中央仓库为阿里云云效提供的公共代理仓库
[INFO] >> 云效也提供了免费、可靠的Maven私有仓库Packages，欢迎您体验使用
[INFO] >> https://packages.aliyun.com?channel=pd_maven_download
[INFO] 
[INFO] --- maven-compiler-plugin:3.1:compile (default-compile) @ HelloWorld ---
[INFO] Changes detected - recompiling the module!
[WARNING] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
[INFO] Compiling 1 source file to E:\dev2\workspacne_JDK8Tomcat8.5\HelloWorld\target\classes
[INFO] >> 阿里云Maven中央仓库为阿里云云效提供的公共代理仓库
[INFO] >> 云效也提供了免费、可靠的Maven私有仓库Packages，欢迎您体验使用
[INFO] >> https://packages.aliyun.com?channel=pd_maven_download
[INFO] 
[INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ HelloWorld ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory E:\dev2\workspacne_JDK8Tomcat8.5\HelloWorld\src\test\resources
[INFO] >> 阿里云Maven中央仓库为阿里云云效提供的公共代理仓库
[INFO] >> 云效也提供了免费、可靠的Maven私有仓库Packages，欢迎您体验使用
[INFO] >> https://packages.aliyun.com?channel=pd_maven_download
[INFO] 
[INFO] --- maven-compiler-plugin:3.1:testCompile (default-testCompile) @ HelloWorld ---
[INFO] Nothing to compile - all classes are up to date
[INFO] 
[INFO] --- maven-surefire-plugin:2.12.4:test (default-test) @ HelloWorld ---
[INFO] No tests to run.
[INFO] 
[INFO] --- maven-war-plugin:2.2:war (default-war) @ HelloWorld ---
[INFO] Packaging webapp
[INFO] Assembling webapp [HelloWorld] in [E:\dev2\workspacne_JDK8Tomcat8.5\HelloWorld\target\HelloWorld]
[INFO] Processing war project
[INFO] Copying webapp resources [E:\dev2\workspacne_JDK8Tomcat8.5\HelloWorld\src\main\webapp]
[INFO] Webapp assembled in [53 msecs]
[INFO] Building war: E:\dev2\workspacne_JDK8Tomcat8.5\HelloWorld\target\HelloWorld.war
[INFO] WEB-INF\web.xml already added, skipping
[INFO] 
[INFO] --- maven-install-plugin:2.4:install (default-install) @ HelloWorld ---
[INFO] Installing E:\dev2\workspacne_JDK8Tomcat8.5\HelloWorld\target\HelloWorld.war to G:\dev2\maven_my\libs\com\blue\HelloWorld\0.0.1-SNAPSHOT\HelloWorld-0.0.1-SNAPSHOT.war
[INFO] Installing E:\dev2\workspacne_JDK8Tomcat8.5\HelloWorld\pom.xml to G:\dev2\maven_my\libs\com\blue\HelloWorld\0.0.1-SNAPSHOT\HelloWorld-0.0.1-SNAPSHOT.pom
[INFO] >> 阿里云Maven中央仓库为阿里云云效提供的公共代理仓库
[INFO] >> 云效也提供了免费、可靠的Maven私有仓库Packages，欢迎您体验使用
[INFO] >> https://packages.aliyun.com?channel=pd_maven_download
[INFO] 
[INFO] >>> tomcat7-maven-plugin:2.2:redeploy (default-cli) > package @ HelloWorld >>>
[INFO] 
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ HelloWorld ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] Copying 0 resource
[INFO] >> 阿里云Maven中央仓库为阿里云云效提供的公共代理仓库
[INFO] >> 云效也提供了免费、可靠的Maven私有仓库Packages，欢迎您体验使用
[INFO] >> https://packages.aliyun.com?channel=pd_maven_download
[INFO] 
[INFO] --- maven-compiler-plugin:3.1:compile (default-compile) @ HelloWorld ---
[INFO] Nothing to compile - all classes are up to date
[INFO] >> 阿里云Maven中央仓库为阿里云云效提供的公共代理仓库
[INFO] >> 云效也提供了免费、可靠的Maven私有仓库Packages，欢迎您体验使用
[INFO] >> https://packages.aliyun.com?channel=pd_maven_download
[INFO] 
[INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ HelloWorld ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory E:\dev2\workspacne_JDK8Tomcat8.5\HelloWorld\src\test\resources
[INFO] >> 阿里云Maven中央仓库为阿里云云效提供的公共代理仓库
[INFO] >> 云效也提供了免费、可靠的Maven私有仓库Packages，欢迎您体验使用
[INFO] >> https://packages.aliyun.com?channel=pd_maven_download
[INFO] 
[INFO] --- maven-compiler-plugin:3.1:testCompile (default-testCompile) @ HelloWorld ---
[INFO] Nothing to compile - all classes are up to date
[INFO] 
[INFO] --- maven-surefire-plugin:2.12.4:test (default-test) @ HelloWorld ---
[INFO] No tests to run.
[INFO] Skipping execution of surefire because it has already been run for this configuration
[INFO] 
[INFO] --- maven-war-plugin:2.2:war (default-war) @ HelloWorld ---
[INFO] Packaging webapp
[INFO] Assembling webapp [HelloWorld] in [E:\dev2\workspacne_JDK8Tomcat8.5\HelloWorld\target\HelloWorld]
[INFO] Processing war project
[INFO] Copying webapp resources [E:\dev2\workspacne_JDK8Tomcat8.5\HelloWorld\src\main\webapp]
[INFO] Webapp assembled in [8 msecs]
[INFO] Building war: E:\dev2\workspacne_JDK8Tomcat8.5\HelloWorld\target\HelloWorld.war
[INFO] WEB-INF\web.xml already added, skipping
[INFO] 
[INFO] <<< tomcat7-maven-plugin:2.2:redeploy (default-cli) < package @ HelloWorld <<<
[INFO] 
[INFO] 
[INFO] --- tomcat7-maven-plugin:2.2:redeploy (default-cli) @ HelloWorld ---
[INFO] Deploying war to http://localhost:8080/HelloWorld  
Uploading: http://localhost:8080/manager/text/deploy?path=%2FHelloWorld&update=true
Uploaded: http://localhost:8080/manager/text/deploy?path=%2FHelloWorld&update=true (4 KB at 3268.6 KB/sec)

[INFO] tomcatManager status code:200, ReasonPhrase:
[INFO] OK - Deployed application at context path [/HelloWorld]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  4.402 s
[INFO] Finished at: 2021-09-01T11:33:16+08:00
[INFO] ------------------------------------------------------------------------
```

看到`BUILD SUCCESS`这句话就表示部署成功了:
```cmd
[INFO] Deploying war to http://localhost:8080/HelloWorld  
Uploading: http://localhost:8080/manager/text/deploy?path=%2FHelloWorld&update=true
Uploaded: http://localhost:8080/manager/text/deploy?path=%2FHelloWorld&update=true (4 KB at 3268.6 KB/sec)

[INFO] tomcatManager status code:200, ReasonPhrase:
[INFO] OK - Deployed application at context path [/HelloWorld]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  4.402 s
[INFO] Finished at: 2021-09-01T11:33:16+08:00
[INFO] ------------------------------------------------------------------------
```

`Deploying war to http://127.0.0.1:8080/HelloWorld`
这句话表示部署到了
[http://127.0.0.1:8080/HelloWorld](http://127.0.0.1:8080/HelloWorld)
这个URL上.打开这个`URL`即可看到效果：
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/14.png)

```xml
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>4.0.0</version>
    <scope>provided</scope>
</dependency>
```
## Tomcat之中部署的效果 ##
打开`tomcat`的`webapps`目录可以看到`Maven`部署的`war`包:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/JavaEE/IDE/Eclipse/Maven/JavaWeb/15.png)

# 参考资料 #
[https://blog.csdn.net/ai_lian_shuo/article/details/77096071#t11](https://blog.csdn.net/ai_lian_shuo/article/details/77096071#t11)

[https://www.linuxidc.com/Linux/2017-05/143308.htm](https://www.linuxidc.com/Linux/2017-05/143308.htm)
