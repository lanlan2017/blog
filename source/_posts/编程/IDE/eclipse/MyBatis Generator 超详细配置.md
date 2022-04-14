---
title: MyBatis Generator 超详细配置
categories: 
  - IDE
  - eclipse
abbrlink: 63dfbbef
date: 2021-08-29 21:05:55
updated: 2022-04-04 00:51:45
---
#  创建Mybatis Generator配置文件
![image-20210829211230965](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210829211231.png)
![image-20210829211255484](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210829211255.png)

# 引入外部配置文件
MyBatis Generator config 是可以引入外部配置文件的，路径为相对于当前配置文件的路径。
在 `<generatorConfiguration>`下按下`alt+/`启动代码提示，然后选择properties

![image-20210829211525479](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210829211525.png)

然后在生成的properties标签里面按下`alt+/`，选择`resource`。

![image-20210829211610728](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210829211610.png)

输入properties文件的相对于MybatisGenerator配置文件的相对路径：
```xml
<generatorConfiguration>
    <properties resource="db.properties" />
    ...
</generatorConfiguration>
```

![image-20210829211751581](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210829211751.png)

如果配置正确的话，按下`Ctrl+鼠标左键`，点击properties的文件名，可以跳转到properties文件。

# 配置context
http://mybatis.org/generator/configreference/context.html

在 `<generatorConfiguration>` 下
```xml
<generatorConfiguration>
    <properties resource="db.properties" />
    <context id="context1" defaultModelType="flat" targetRuntime="MyBatis3Simple" >
        ...
    </context>
</generatorConfiguration>
```

|context属性值|描述|
|:---|:---|
|**id**|随便填，保证多个 **context**的id 不重复就行|
|**defaultModelType**|可以不填，默认值 **conditional**，**flat**表示一张表对应一个po|
|**targetRuntime**|可以不填，这个配置会影响生成的mapper.java和mapper.xml的内容。默认值 **MyBatis3**，常用的还有 **MyBatis3Simple**|

## context的targetRuntime属性
### MyBatis3
targetRuntime = MyBatis3，生成的 dao 和 mapper.xml 如下

### MyBatis3Simple
targetRuntime = MyBatis3Simple，生成的 dao 和 mapper.xml 如下，**接口会少很多，只包含最最常用的**

context标签的属性 就讲完了，唯一需要注意的就是targetRuntime的值，该配置成什么看个人喜好

## context子标签
context的子元素必须按照以下给出的个数、顺序配置。(是的，没错 MyBatis Generator 对配置的循序还有要求)

1. **property** (0..N)
2. **plugin** (0..N)
3. **commentGenerator** (0 or 1)
4. **jdbcConnection** (需要connectionFactory 或 jdbcConnection)
5. **javaTypeResolver** (0 or 1)
6. **javaModelGenerator** (至少1个)
7. **sqlMapGenerator** (0 or 1)
8. **javaClientGenerator** (0 or 1)
9. **table** (1..N)

### plugin
plugin标签可以配置一个插件，
具体有哪些插件可用，详见：[http://mybatis.org/generator/reference/plugins.html](http://mybatis.org/generator/reference/plugins.html)
#### 给生成的PO类添加equasl和hashCode方法
```xml
<generatorConfiguration>
    <properties resource="db.properties" />
    <context id="context1" defaultModelType="flat" targetRuntime="MyBatis3Simple" >
        <plugin type="org.mybatis.generator.plugins.EqualsHashCodePlugin"></plugin>
        <!-- <plugin type="org.mybatis.generator.plugins.ToStringPlugin"></plugin> -->
        ...
    </context>
</generatorConfiguration>
```
这个插件给生成的Java模型对象增加了equals和hashCode方法

### commentGenerator
http://mybatis.org/generator/configreference/commentGenerator.html
#### 默认会生成注释和时间戳
commentGenerator用来配置生成的注释。默认是生成注释的，并且会生成时间戳，如下

如果你想要保留注释和时间戳，可以不配置 **commentGenerator**。
#### 不保留时间戳
如果你不想保留时间戳，需要如下配置
```xml
<commentGenerator>
    <!-- 不希望生成的注释中包含时间戳 -->
    <property name="suppressDate" value="true"/>
</commentGenerator>
```
#### 保留数据库表中字段的注释信息
默认生成的注释是不会有 数据库 表中字段的注释，如果你想知道每个字段在数据库中的含义(前提是数据库中对应表的字段你添加了注释)，可以如下配置
```xml
<commentGenerator>
    <!-- 添加 db 表中字段的注释 -->
    <property name="addRemarkComments" value="true"/>
</commentGenerator>
```
#### 不生成注释信息
MyBatis Generator生成注释无用信息太多了，所以一般都选择不生成注释
```xml
<commentGenerator>
    <!-- 是否不生成注释 -->
    <property name="suppressAllComments" value="true" />
</commentGenerator>
```
目前的配置信息如下：
```xml
<generatorConfiguration>
    <properties resource="db.properties" />
    <context id="context1" defaultModelType="flat" targetRuntime="MyBatis3Simple">
        <plugin type="org.mybatis.generator.plugins.ToStringPlugin"></plugin>
        <commentGenerator>
            <property name="suppressAllComments" value="true" />
        </commentGenerator>
        ...
    </context>
</generatorConfiguration>
```
### jdbcConnection
http://mybatis.org/generator/configreference/jdbcConnection.html

MyBatis Generator 需要链接数据库，所以需要配置 **jdbcConnection**.
```xml
<jdbcConnection
        connectionURL="${dataSource.jdbcUrl}"
        driverClass="${dataSource.driverClass}"
        password="${dataSource.password}"
        userId="${dataSource.user}">
    <!--高版本的 mysql-connector-java 需要设置 nullCatalogMeansCurrent=true -->
    <property name="nullCatalogMeansCurrent" value="true" />
</jdbcConnection>
```
#### jdbcConnection的属性
connectionURL，driverClass，属性值`${xxx}`里面的`xxx`是,外部配置文件`db.properties`中的`key`名称，我的`properties`文件内容如下，根据你自己的`properties`文件填写即可。
```properties
dataSource.driverClass=com.mysql.jdbc.Driver
dataSource.jdbcUrl=jdbc:mysql://127.0.0.1:3306/mybatis
dataSource.user=root
dataSource.password=root
dataSource.maxPoolSize=20
dataSource.maxIdleTime = 1000
dataSource.minPoolSize=6
dataSource.initialPoolSize=5
```
你也可以写死,如下所示：
```xml
<jdbcConnection
        connectionURL="jdbc:mysql://127.0.0.1:3306/mybatis"
        driverClass="com.mysql.jdbc.Driver"
        password="root"
        userId="root">
    <!--高版本的 mysql-connector-java 需要设置 nullCatalogMeansCurrent=true -->
    <property name="nullCatalogMeansCurrent" value="true" />
</jdbcConnection>
```
那就不需要配置`<properties resource="db.properties"/>`了
#### mysql8需要配置
这里面值得注意的是`<property name="nullCatalogMeansCurrent" value="true"/>`,因为我用的 **mysql-connector-java** 版本是 8.0.17,如果不配置这一项，会找不到对应的数据库，[官网](https://link.juejin.cn?target=http%3A%2F%2Fwww.mybatis.org%2Fgenerator%2Fusage%2Fmysql.html)对此的解释是：

具体原因参考这篇文章 [MyBatis Generator踩坑与自救](https://link.juejin.cn/?target=https%3A%2F%2Fwww.jianshu.com%2Fp%2Fdbeeac29ff27)

### javaTypeResolver
http://mybatis.org/generator/configreference/javaTypeResolver.html
javaTypeResolver 是配置 JDBC 与 java 的类型转换规则，或者你也可以不用配置，使用它默认的转换规则。
就算配置也只能配置 bigDecimal 类型和时间类型的转换

```xml
<javaTypeResolver>
    <!--是否使用 bigDecimal，默认false。
        false，把JDBC DECIMAL 和 NUMERIC 类型解析为 Integer
        true，把JDBC DECIMAL 和 NUMERIC 类型解析为java.math.BigDecimal-->
    <property name="forceBigDecimals" value="true"/>
    <!--默认false
        false，将所有 JDBC 的时间类型解析为 java.util.Date
        true，将 JDBC 的时间类型按如下规则解析
            DATE                    -> java.time.LocalDate
            TIME                    -> java.time.LocalTime
            TIMESTAMP                   -> java.time.LocalDateTime
            TIME_WITH_TIMEZONE      -> java.time.OffsetTime
            TIMESTAMP_WITH_TIMEZONE    -> java.time.OffsetDateTime
        -->
    <property name="useJSR310Types" value="true"/>
</javaTypeResolver>
```
### javaModelGenerator
http://mybatis.org/generator/configreference/javaModelGenerator.html

配置 po类 生成的包路径和项目路径,如下
```xml
<javaModelGenerator targetPackage="com.po"
    targetProject="MyBookAppFenLi">
    <!-- 是否让schema作为包的后缀，默认为false -->
    <property name="enableSubPackages" value="true" />
    <!-- 是否针对string类型的字段在set方法中进行修剪，默认false -->
    <!-- <property name="trimStrings" value="true" /> -->
</javaModelGenerator>
```

### sqlMapGenerator
http://mybatis.org/generator/configreference/sqlMapGenerator.html
配置 Mapper.xml 文件的生成目录

```xml
<sqlMapGenerator targetPackage="com.mapper" targetProject="MyBookAppFenLi">
    <!--<property name="enableSubPackages" value="false"/>-->
</sqlMapGenerator>
```

### javaClientGenerator
http://mybatis.org/generator/configreference/javaClientGenerator.html
配置Mapper接口 XxxMapper.java 文件的生成目录
```xml
<javaClientGenerator targetPackage="com.wqlm.boot.user.dao" targetProject="src/main/java" type="XMLMAPPER">
    <!--<property name="enableSubPackages" value="false"/>-->
</javaClientGenerator>
```

#### type属性值
##### context targetRuntime is MyBatis3

|type属性值|描述|
|:---|:---|
|**ANNOTATEDMAPPER**|The generated objects will be Java interfaces for the MyBatis 3.x mapper infrastructure. The interfaces will be based on annotations and MyBatis 3.x SqlProviders. No XML mapper files will be generated.The ANNOTATEDMAPPER requires MyBatis version 3.0.4 or higher.|
|**MIXEDMAPPER**|The generated objects will be Java interfaces for the MyBatis 3.x mapper infrastructure. The interfaces will be based on a mix of annotations and XML. An annotation will be used where a simple annotation will work. This client will not generate and Sql Provider, so all complex dynamic SQL will be generated in XML.The MIXEDMAPPER requires MyBatis version 3.0.4 or higher.|
|**XMLMAPPER**|The generated objects will be Java interfaces for the MyBatis 3.x mapper infrastructure. The interfaces will be dependent on generated XML mapper files.|

#### context targetRuntime is MyBatis3Simple

|type属性值|描述|
|:---|:---|
|**ANNOTATEDMAPPER**|The generated objects will be Java interfaces for the MyBatis 3.x mapper infrastructure. The interfaces will be based on annotations and MyBatis 3.x SqlProviders. No XML mapper files will be generated.The ANNOTATEDMAPPER requires MyBatis version 3.0.4 or higher.|
|**XMLMAPPER**|The generated objects will be Java interfaces for the MyBatis 3.x mapper infrastructure. The interfaces will be dependent on generated XML mapper files.|

### table
http://mybatis.org/generator/configreference/table.html
一个 table 对应一张表，如果想同时生成多张表，需要配置多个 table
```xml
<table schema="" tableName="tb_user" domainObjectName="User"
    enableCountByExample="false" enableDeleteByExample="false"
    enableSelectByExample="false" enableUpdateByExample="false"
    selectByExampleQueryId="false">
    <!--是否使用实际列名,默认为false -->
    <!--<property name="useActualColumnNames" value="false" /> -->
</table>
```
#### domainObjectName
domainObjectName属性表示生成的PO类的类名，如果domainObjectName不配置时，它会按照帕斯卡命名法将表名转换成类名

#### enableXXXByExample属性
**enableXXXByExample** 默认为true，但只有在`targetRuntime="MyBatis3"`时才生效

生效时，会在po下多生成一个 `XxxExample.java` 的文件，如下

一个简单的user的Example帮助类有470行，我一般不会去用，如上全设置为false

当 `targetRuntime="MyBatis3Simple"`时，**enableXXXByExample** 不管为true、还是false 都不生效。


# 完整配置

```xml /MyBookAppFenLi/src/MybatisGeneratorConfig.xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE generatorConfiguration PUBLIC "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN" "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">
<generatorConfiguration>
    <properties resource="db.properties" />

    <!-- id="context1" id可以随便写，不要重复就行了 -->
    <!-- defaultModelType="flat" flat表示一张数据库表 生成一个po类 -->
    <!-- targetRuntime="MyBatis3Simple" 表示生成mapper的方式,MyBatis3Simple表示生成dao接口和xml -->
    <context id="context1" defaultModelType="flat" targetRuntime="MyBatis3Simple">

        <!-- 具体插件，详见http://mybatis.org/generator/reference/plugins.html -->
        <!-- 插件：自动生成equals，hashCode方法 -->
        <!-- <plugin type="org.mybatis.generator.plugins.EqualsHashCodePlugin"></plugin> -->
        <!-- 插件: 自动生成toString方法 -->
        <plugin type="org.mybatis.generator.plugins.ToStringPlugin"></plugin>
        <!-- 自动生成注释设置 -->
        <commentGenerator>
            <!-- 不希望生成的注释中包含时间戳 -->
            <!-- <property name="suppressDate" value="true" /> -->
            <!-- 添加 数据库 表中字段的注释 -->
            <!-- <property name="addRemarkComments" value="true" /> -->
            <!-- 是否不生成注释 -->
            <property name="suppressAllComments" value="true" />
        </commentGenerator>

        <jdbcConnection connectionURL="${dataSource.jdbcUrl}"
            driverClass="${dataSource.driverClass}" password="${dataSource.password}"
            userId="${dataSource.user}">
            <!--高版本的 mysql-connector-java 需要设置 nullCatalogMeansCurrent=true -->
            <property name="nullCatalogMeansCurrent" value="true" />
        </jdbcConnection>
        <!-- <javaTypeResolver> -->
        <!--是否使用 bigDecimal，默认false。
            false，把JDBC DECIMAL 和 NUMERIC 类型解析为 Integer
            true，把JDBC DECIMAL 和 NUMERIC 类型解析为java.math.BigDecimal -->
        <!-- <property name="forceBigDecimals" value="true" /> -->
        <!--默认false
            false，将所有 JDBC 的时间类型解析为 java.util.Date
            true，将 JDBC 的时间类型按如下规则解析
            DATE -> java.time.LocalDate
            TIME -> java.time.LocalTime
            TIMESTAMP -> java.time.LocalDateTime
            TIME_WITH_TIMEZONE -> java.time.OffsetTime
            TIMESTAMP_WITH_TIMEZONE -> java.time.OffsetDateTime
        -->
        <!-- <property name="useJSR310Types" value="true" /> -->
        <!-- </javaTypeResolver> -->

        <!-- PO类生成 -->
        <javaModelGenerator targetPackage="com.domain"
            targetProject="MyBookAppFenLi">
            <!-- 是否让schema作为包的后缀，默认为false -->
            <property name="enableSubPackages" value="true" />
            <!-- 是否针对string类型的字段在set方法中进行修剪，默认false -->
            <!-- <property name="trimStrings" value="true" /> -->
        </javaModelGenerator>
        <!-- Mapper.xml生成 -->
        <sqlMapGenerator targetPackage="com.mapper"
            targetProject="MyBookAppFenLi">
            <!-- 是否让schema作为包的后缀，默认为false -->
            <property name="enableSubPackages" value="true" />
        </sqlMapGenerator>
        <!-- Mapper接口生成 -->
        <javaClientGenerator targetPackage="com.mapper"
            targetProject="MyBookAppFenLi" type="XMLMAPPER" />
        <!-- schema为数据库名，oracle需要配置，mysql不需要配置。
            tableName为对应的数据库表名
            domainObjectName 是要生成的实体类名(可以不指定)
            enableXXXByExample 默认为 true， 为 true 会生成一个对应Example帮助类，帮助你进行条件查询，不想要可以设为false
        -->
        <!-- 数据库表和PO类的映射 -->
        <table schema="" tableName="tb_user" domainObjectName="User"
            enableCountByExample="false" enableDeleteByExample="false"
            enableSelectByExample="false" enableUpdateByExample="false"
            selectByExampleQueryId="false">
            <!--是否使用实际列名,默认为false -->
            <!--<property name="useActualColumnNames" value="false" /> -->
        </table>
        <table schema="" tableName="tb_book" domainObjectName="Book"
            enableCountByExample="false" enableDeleteByExample="false"
            enableSelectByExample="false" enableUpdateByExample="false"
            selectByExampleQueryId="false">
            <!--是否使用实际列名,默认为false -->
            <!--<property name="useActualColumnNames" value="false" /> -->
        </table>
    </context>
</generatorConfiguration>
```
# Eclipse运行MyBatisGenarator
在MybatisGenarator的配置文件上右键，选择 Run As，然后选择Run MyBatis Generator即可。
![image-20210829222745789](https://raw.githubusercontent.com/lanlan2017/images/master/Blog/2021/08/20210829222745.png)

# 生成的效果

## PO类

### Book.java
```java /MyBookAppFenLi/src/com/domain/Book.java
package com.domain;

import java.util.Date;

public class Book {
    private Integer id;

    private String name;

    private String author;

    private Date publicationdate;

    private String publication;

    private Double price;

    private String image;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getPublicationdate() {
        return publicationdate;
    }

    public void setPublicationdate(Date publicationdate) {
        this.publicationdate = publicationdate;
    }

    public String getPublication() {
        return publication;
    }

    public void setPublication(String publication) {
        this.publication = publication;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", author=").append(author);
        sb.append(", publicationdate=").append(publicationdate);
        sb.append(", publication=").append(publication);
        sb.append(", price=").append(price);
        sb.append(", image=").append(image);
        sb.append(", remark=").append(remark);
        sb.append("]");
        return sb.toString();
    }
}
```
### User.java
```java /MyBookAppFenLi/src/com/domain/User.java
package com.domain;

public class User {
    private Integer id;

    private String loginname;

    private String password;

    private String username;

    private String phone;

    private String address;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", loginname=").append(loginname);
        sb.append(", password=").append(password);
        sb.append(", username=").append(username);
        sb.append(", phone=").append(phone);
        sb.append(", address=").append(address);
        sb.append("]");
        return sb.toString();
    }
}
```
## mapper接口
### BookMapper.java
```java /MyBookAppFenLi/src/com/mapper/BookMapper.java
package com.mapper;

import com.domain.Book;
import java.util.List;

public interface BookMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Book record);

    Book selectByPrimaryKey(Integer id);

    List<Book> selectAll();

    int updateByPrimaryKey(Book record);
}
```
### UserMapper.java
```java /MyBookAppFenLi/src/com/mapper/UserMapper.java
package com.mapper;

import com.domain.User;
import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);
}
```
## Mapper.xml
### BookMapper.xml
```xml /MyBookAppFenLi/src/com/mapper/BookMapper.xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.mapper.BookMapper">
    <resultMap id="BaseResultMap" type="com.domain.Book">
        <id column="id" jdbcType="INTEGER" property="id" />
        <result column="name" jdbcType="VARCHAR" property="name" />
        <result column="author" jdbcType="VARCHAR" property="author" />
        <result column="publicationdate" jdbcType="DATE" property="publicationdate" />
        <result column="publication" jdbcType="VARCHAR" property="publication" />
        <result column="price" jdbcType="DOUBLE" property="price" />
        <result column="image" jdbcType="VARCHAR" property="image" />
        <result column="remark" jdbcType="VARCHAR" property="remark" />
    </resultMap>
    <delete id="deleteByPrimaryKey" parameterType="java.lang.Integer">
        delete from tb_book
        where id = #{id,jdbcType=INTEGER}
    </delete>
    <insert id="insert" parameterType="com.domain.Book">
        insert into tb_book (id, name, author,
        publicationdate, publication, price,
        image, remark)
        values (#{id,jdbcType=INTEGER}, #{name,jdbcType=VARCHAR}, #{author,jdbcType=VARCHAR},
        #{publicationdate,jdbcType=DATE}, #{publication,jdbcType=VARCHAR},
        #{price,jdbcType=DOUBLE},
        #{image,jdbcType=VARCHAR}, #{remark,jdbcType=VARCHAR})
    </insert>
    <update id="updateByPrimaryKey" parameterType="com.domain.Book">
        update tb_book
        set name = #{name,jdbcType=VARCHAR},
        author = #{author,jdbcType=VARCHAR},
        publicationdate = #{publicationdate,jdbcType=DATE},
        publication = #{publication,jdbcType=VARCHAR},
        price = #{price,jdbcType=DOUBLE},
        image = #{image,jdbcType=VARCHAR},
        remark = #{remark,jdbcType=VARCHAR}
        where id = #{id,jdbcType=INTEGER}
    </update>
    <select id="selectByPrimaryKey" parameterType="java.lang.Integer"
        resultMap="BaseResultMap">
        select id, name, author, publicationdate, publication, price, image, remark
        from tb_book
        where id = #{id,jdbcType=INTEGER}
    </select>
    <select id="selectAll" resultMap="BaseResultMap">
        select id, name, author, publicationdate, publication, price, image, remark
        from tb_book
    </select>
</mapper>
```
### UserMapper.xml
```xml /MyBookAppFenLi/src/com/mapper/UserMapper.xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.mapper.UserMapper">
    <resultMap id="BaseResultMap" type="com.domain.User">
        <id column="id" jdbcType="INTEGER" property="id" />
        <result column="loginname" jdbcType="VARCHAR" property="loginname" />
        <result column="password" jdbcType="VARCHAR" property="password" />
        <result column="username" jdbcType="VARCHAR" property="username" />
        <result column="phone" jdbcType="VARCHAR" property="phone" />
        <result column="address" jdbcType="VARCHAR" property="address" />
    </resultMap>
    <delete id="deleteByPrimaryKey" parameterType="java.lang.Integer">
        delete from tb_user
        where id = #{id,jdbcType=INTEGER}
    </delete>
    <insert id="insert" parameterType="com.domain.User">
        insert into tb_user (id, loginname, password,
        username, phone, address
        )
        values (#{id,jdbcType=INTEGER}, #{loginname,jdbcType=VARCHAR}, #{password,jdbcType=VARCHAR},
        #{username,jdbcType=VARCHAR}, #{phone,jdbcType=VARCHAR},
        #{address,jdbcType=VARCHAR}
        )
    </insert>
    <update id="updateByPrimaryKey" parameterType="com.domain.User">
        update tb_user
        set loginname = #{loginname,jdbcType=VARCHAR},
        password = #{password,jdbcType=VARCHAR},
        username = #{username,jdbcType=VARCHAR},
        phone = #{phone,jdbcType=VARCHAR},
        address = #{address,jdbcType=VARCHAR}
        where id = #{id,jdbcType=INTEGER}
    </update>
    <select id="selectByPrimaryKey" parameterType="java.lang.Integer"
        resultMap="BaseResultMap">
        select id, loginname, password, username, phone, address
        from tb_user
        where id = #{id,jdbcType=INTEGER}
    </select>
    <select id="selectAll" resultMap="BaseResultMap">
        select id, loginname, password, username, phone, address
        from tb_user
    </select>
</mapper>
```

# 生成动态SQL配置
动态生成需要把设置为，并设置为

```xml
<context id="context1" defaultModelType="flat" targetRuntime="MyBatis3">
    ...
    <!-- Mapper接口生成 -->
    <!-- type="XMLMAPPER"SQL实现写在Xml文件 -->
    <!-- type="ANNOTATEDMAPPER"SQL实现写在Mapper接口文件 -->
    <javaClientGenerator targetPackage="com.mapper"
        targetProject="MyBookAppFenLi" type="ANNOTATEDMAPPER" />
    ...
</context>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE generatorConfiguration PUBLIC "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN" "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">
<generatorConfiguration>
    <properties resource="db.properties" />
    <context id="context1" defaultModelType="flat" targetRuntime="MyBatis3">
        <plugin type="org.mybatis.generator.plugins.ToStringPlugin"></plugin>
        <commentGenerator>
            <property name="suppressAllComments" value="true" />
        </commentGenerator>

        <jdbcConnection connectionURL="${dataSource.jdbcUrl}"
            driverClass="${dataSource.driverClass}" password="${dataSource.password}"
            userId="${dataSource.user}">
            <property name="nullCatalogMeansCurrent" value="true" />
        </jdbcConnection>
        <!-- PO类生成 -->
        <javaModelGenerator targetPackage="com.domain"
            targetProject="MyBookAppFenLi">
            <property name="enableSubPackages" value="true" />
        </javaModelGenerator>
        <!-- Mapper.xml生成 -->
        <sqlMapGenerator targetPackage="com.mapper"
            targetProject="MyBookAppFenLi">
            <!-- 是否让schema作为包的后缀，默认为false -->
            <property name="enableSubPackages" value="true" />
        </sqlMapGenerator>
        <!-- Mapper接口生成 -->
        <!-- type="XMLMAPPER"SQL实现写在Xml文件 -->
        <!-- type="ANNOTATEDMAPPER"SQL实现写在Mapper接口文件 -->
        <javaClientGenerator targetPackage="com.mapper"
            targetProject="MyBookAppFenLi" type="ANNOTATEDMAPPER" />
        <!-- 数据库表和PO类的映射 -->
        <table schema="" tableName="tb_user" domainObjectName="User"
            enableCountByExample="false" enableDeleteByExample="false"
            enableSelectByExample="false" enableUpdateByExample="false"
            selectByExampleQueryId="false">
            <!--是否使用实际列名,默认为false -->
            <!--<property name="useActualColumnNames" value="false" /> -->
        </table>
        <table schema="" tableName="tb_book" domainObjectName="Book"
            enableCountByExample="false" enableDeleteByExample="false"
            enableSelectByExample="false" enableUpdateByExample="false"
            selectByExampleQueryId="false">
            <!--是否使用实际列名,默认为false -->
        </table>
    </context>
</generatorConfiguration>
```

# 参考资料

https://juejin.cn/post/6844903982582743048
