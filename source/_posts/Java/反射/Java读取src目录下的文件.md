---
title: Java读取src目录下的文件
categories: 
  - Java
  - 反射
date: 2019-06-09 22:53:08
updated: 2019-12-09 19:45:22
abbrlink: 5bc9db15
---
# 如何读取src目录下的文件 #
`src`目录下的文件都是**资源文件**,运行程序时,可以通过反射来获取这些资源文件的输入流,进而读取这些文件中的内容。
**放到`src`目录下的文件会被打包到`jar`包中**。
# 我的用法 #
平常会用到好多代码模板,我会把这些`代码的模板`放到`src`目录下,这样当打包成可执行`jar`的时候,这些代码会被打包到`jar`文件中。
以后我要获取这些`代码模板`时候.我只需要运行这个可执行`jar`包.然后通过命令行参数确定我要使用哪个模板文件,然后程序读取`jar`包中的这个模板文件的内容,然后输出到剪贴板上.
这样我就直接粘贴即可使用这些代码模板。
# 读取资源文件的工具类 #
```java
/**
 * 这个类专门用来读取资源文件
 */
public class ResourceFileReader
{
     public static void main(String[] args)
     {
     System.out.println(getResourceFileContent("/AudioPlay.html", "utf-8"));
     }
    /**
     * 
     * /** 读入资源目录下的path文件中的内容.会以UTF-8编码来读取,所以该文件必须要保存为UTF-8编码格式.
     * 
     * @param path
     *            资源文件的路径,必须以<code>/</code>开头.<br>
     *            例如项目资源目录res下的的<code>AudioPlay.html</code>的路径为:
     *            <code>"/AudioPlay.html"</code>
     * @return 资源目录下的path文件的内容
     */
    public static String getResourceFileContent(String path, String charset)
    {
        if (path.startsWith("/"))
        {
            String content = null;
            // TODO Auto-generated method stub
            InputStream inputStream = ResourceFileReader.class
                    .getResourceAsStream(path);
            try (BufferedReader reader = new BufferedReader(
                    new InputStreamReader(inputStream, charset));)
            {
                StringBuilder builder = new StringBuilder();
                char[] charArray = new char[200];
                int number = -1;
                while ((number = reader.read(charArray)) != -1)
                {
                    builder.append(charArray, 0, number);
                }
                content = builder.toString();
                // System.out.println(builder.toString());
            } catch (FileNotFoundException e)
            {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e)
            {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return content;
        }
        return null;
    }
}
```
# 使用示例 #
例如现在有一个`MybatisMapperTemplete.xml`文件，路径`/CodeGenerator/src/res/MybatisMapperTemplete.xml`,内容如下:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="">

</mapper>
```
现在使用上面的工具类来读取这个资源文件.

需要注意的是:资源文件的路径是相对于`src`目录的路径.也就是把`src/`作为根路径`/`,从而得到的路径为:`/res/MybatisMapperTemplete.xml`
然后调用上面的工具方法即可读取该文件中的内容:
```java
public static void main(String[] args)
{
    System.out.println(
        ResourceFileReader.getResourceFileContent("/res/MybatisMapperTemplete.xml", "utf-8"));
}
```
控制台会输出该文件中的内容,如下所示:
```cmd
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="">

</mapper>
```