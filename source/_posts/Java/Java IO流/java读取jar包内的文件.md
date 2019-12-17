---
title: java读取jar包内的文件
categories: 
  - Java
  - Java IO流
date: 2018-10-26 19:56:09
updated: 2019-12-16 02:40:33
abbrlink: 18ab79a8
---
<div id='my_toc'><a href="/blog/18ab79a8/#首先介绍怎么把资源文件打包到可执行jar包中" class="header_2">首先介绍怎么把资源文件打包到可执行jar包中</a><br><a href="/blog/18ab79a8/#读取jar包中的文件" class="header_2">读取jar包中的文件</a><br><a href="/blog/18ab79a8/#读取jar包中资源文件子目录中的文件" class="header_2">读取jar包中资源文件子目录中的文件</a><br></div>
<style>
    .header_1{
        margin-left: 1em;
    }
    .header_2{
        margin-left: 2em;
    }
    .header_3{
        margin-left: 3em;
    }
    .header_4{
        margin-left: 4em;
    }
    .header_5{
        margin-left: 5em;
    }
    .header_6{
        margin-left: 6em;
    }
</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
## 首先介绍怎么把资源文件打包到可执行jar包中 ##
打开eclipse，在你Java项目下建立一个资源文件夹res，然后在里面放入要打包到可执行jar包中的文件(我这里是JSTest.html)，如下图所示：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/Java%20IO%E6%B5%81/java%E8%AF%BB%E5%8F%96jar%E5%8C%85%E5%86%85%E7%9A%84%E6%96%87%E4%BB%B6/new_res_folder.png)
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/Java%20IO%E6%B5%81/java%E8%AF%BB%E5%8F%96jar%E5%8C%85%E5%86%85%E7%9A%84%E6%96%87%E4%BB%B6/project_view.png)
这样等我们打包成可执行jar包时，JSTest.html被放到jar包里面的根目录下：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/Java%20IO%E6%B5%81/java%E8%AF%BB%E5%8F%96jar%E5%8C%85%E5%86%85%E7%9A%84%E6%96%87%E4%BB%B6/afterpackingfilepath.png)
## 读取jar包中的文件 ##
那么我们怎么在JSTest类中读取jar包中的这个JSTest.html文件呢，使用下面的代码即可获取包内文件的InputStream实例。后面就跟读取普通文件一样了。
```
InputStream inputStream = JSTest.class.getResourceAsStream("/JSTest.html");
```
完整代码：
```java
package js.test;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class JSTest
{
    public static void main(String[] args)
    {
        InputStream inputStream = JSTest.class.getResourceAsStream("/JSTest.html");

        try
        {
            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(inputStream, "UTF-8"));
            StringBuilder builder = new StringBuilder();
            char[] charArray = new char[200];
            int number = -1;
            while ((number = reader.read(charArray)) != -1)
            {
                builder.append(charArray,0,number);
            }
            System.out.println(builder.toString());

        } catch (FileNotFoundException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}
```
JSTest.html文件内容：
```html
<html>
        <head>
                <meta charset="utf-8">
        </head>
        <body>

        </body>
</html>
```
然后我们打包成可执行jar包，运行该可执行jar包即可读取它自己包内的`JSTest.html`文件：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/Java%20IO%E6%B5%81/java%E8%AF%BB%E5%8F%96jar%E5%8C%85%E5%86%85%E7%9A%84%E6%96%87%E4%BB%B6/runjar_show.png)
可以看到，已经成功把JSTest.html中的内容输出到控制台了。
## 读取jar包中资源文件子目录中的文件 ##
如下图所示，如果想读取资源目录res下的子目录son中的文件inside.txt。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/Java%20IO%E6%B5%81/java%E8%AF%BB%E5%8F%96jar%E5%8C%85%E5%86%85%E7%9A%84%E6%96%87%E4%BB%B6/fileInSonFolder.png)
只需要把上面的代码改成即可：
```java
InputStream inputStream = JSTest.class.getResourceAsStream("/son/inside.txt");
```
其他的代码不用改动。打包成可执行jar包红，inside.txt在jar包中的位置：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/Java%20IO%E6%B5%81/java%E8%AF%BB%E5%8F%96jar%E5%8C%85%E5%86%85%E7%9A%84%E6%96%87%E4%BB%B6/fileInJarSonFolder.png)
运行可执行jar包：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/Java%20IO%E6%B5%81/java%E8%AF%BB%E5%8F%96jar%E5%8C%85%E5%86%85%E7%9A%84%E6%96%87%E4%BB%B6/runjar_show_sonFolder.png)
同样运行成功。
