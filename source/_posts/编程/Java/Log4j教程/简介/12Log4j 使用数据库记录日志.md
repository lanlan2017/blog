---
title: 12Log4j 使用数据库记录日志
categories: 
  - 编程
  - Java
  - Log4j教程
  - 简介
date: 2020-08-05 03:14:46
updated: 2021-03-20 09:38:13
abbrlink: 17eaff0a
---
# Log4j 使用数据库记录日志
`Log4j API`提供了`org.apache.log4j.jdbc.JDBCAppender`对象，该对象可将日志信息记录到特定的数据库之中。
## JDBCAppender 配置

|属性|描述|
|:---|:---|
|`bufferSize`|设置缓冲区大小，缺省为 1。|
|`driver`|以字符串形式设置驱动类，如果未设置，缺省为`sun.jdbc.odbc.JdbcOdbcDriver`。|
|`layout`|设置`layout`，缺省为`org.apache.log4j.PatternLayout`。|
|`password`|设置数据库密码。|
|`sql`|设置每次日志事件触发时需要执行的`SQL`语句，该语句可以是`INSERT`、`UPDATE`或`DELETE`。|
|`URL`|设置`JDBC URL.`|
|`user`|设置数据库用户名。|

## 日志表的配置
在使用基于`JDBC`的日志之前，先要创建一张表以保存所有日志信息，下面是用来创建`LOGS`表的`SQL`语句：
```sql /Log4jDemo/src/logs.sql
# 创建数据库
drop database if exists dbname;
create database dbname default character set utf8;
# 进入数据库
use dbname;
# 创建表
create table logs(
    user_id varchar(20)    not null,
    date_time   datetime   not null,
    logger  varchar(50)    not null,
    level   varchar(10)    not null,
    message varchar(1000)  not null
);
```
## 示例配置文件
下面是一个为`JDBCAppender`编写的`Log4j.properties`的示例配置文件，使用该对象将日志信息记录到`LOGS`表中。
```properties /Log4jDemo/Log4jConfig/JDBCAppender/log4j.properties
# Define the root logger with appender DB and STDOUT
log4j.rootLogger = DEBUG, DB,STDOUT

# Define the DB appender
log4j.appender.DB=org.apache.log4j.jdbc.JDBCAppender

# Set JDBC URL
#log4j.appender.DB.URL=jdbc:mysql://localhost/DBNAME
log4j.appender.DB.URL=jdbc:mysql://localhost:3306/DBNAME?serverTimezone=UTC&characterEncoding=utf-8

# Set Database Driver
#log4j.appender.DB.driver=com.mysql.jdbc.Driver
# mysql8.0驱动
log4j.appender.DB.driver=com.mysql.cj.jdbc.Driver

# Set database user name and password
#log4j.appender.DB.user=user_name
log4j.appender.DB.user=root
#log4j.appender.DB.password=password
log4j.appender.DB.password=root

# Set the SQL statement to be executed.
#log4j.appender.DB.sql=INSERT INTO LOGS VALUES('%x','%d{yyyy-MM-dd HH:mm:ss}','%C','%p','%m')
log4j.appender.DB.sql=insert into logs(user_id,date_time,logger,level,message) values ('%x','%d{yyyy-MM-dd HH:mm:ss}','%C','%p','%m')

# Define the layout for file appender
log4j.appender.DB.layout=org.apache.log4j.PatternLayout

log4j.appender.STDOUT=org.apache.log4j.ConsoleAppender
log4j.appender.STDOUT.Target=System.out
log4j.appender.STDOUT.layout=org.apache.log4j.PatternLayout
log4j.appender.STDOUT.layout.ConversionPattern=user_id=%x,date_time=%d{yyyy-MM-dd HH:mm:ss},logger=%C,LEVEL=%p,message=%m%n

```
如果使用`MySQL`数据库，需要使用真实的`DBNAME`、用户名和密码，就是刚才用来创建`LOGS`表的那些属性。`SQL`语句执行`INSERT`语句，为`LOGS`表插入具体数值。
`JDBCAppender`不需要显示定义`layout`，传入的`SQL`语句会使用`PatternLayout`。
### 使用XML配置文件
如果您需要和上述`Log4j.properties`文件等价的`XML`配置文件，如下所示：
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE log4j:configuration
    PUBLIC "-//LOG4J//DTD LOG4J//EN"
    "https://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/xml/doc-files/log4j.dtd" >
<log4j:configuration>
    <appender name="DB"
        class="org.apache.log4j.jdbc.JDBCAppender">
        <param name="driver" value="com.mysql.cj.jdbc.Driver" />
        <param name="URL"
            value="jdbc:mysql://localhost:3306/DBNAME?serverTimezone=UTC&amp;characterEncoding=UTF-8" />
        <param name="user" value="root" />
        <param name="password" value="root" />
        <!-- <param name="sql" value="insert into logs(user_id,date_time,logger,level,message) 
            values ('%x','%d','%C','%p','%m')" /> -->

        <layout class="org.apache.log4j.PatternLayout">
            <param name="ConversionPattern"
                value="insert into logs(user_id,date_time,logger,level,message) values ('%x','%d{yyyy-MM-dd HH:mm:ss}','%C','%p','%m')" />
        </layout>
    </appender>

    <root>
        <level value="DEBUG" />
        <appender-ref ref="DB" />
    </root>
</log4j:configuration>
```
#### log4j.xml把SQL写到layout的ConversionPattern属性
经过我的测试,把sql写在layout的ConversionPattern属性中,程序可以运行.
而使用appender的sql属性中的sql语句无法正常运行。
#### log4j.properties把SQL写在 appender的sql属性
在log4j.properties配置文件中,SQL既可以写在appender的sql属性中,也可以写在layout的ConversionPattern属性中.
```properties
log4j.appender.DB.sql=insert into logs(user_id,date_time,logger,level,message) values ('%x','%d{yyyy-MM-dd HH:mm:ss}','%C','%p','%m')

# Define the layout for file appender
log4j.appender.DB.layout=org.apache.log4j.PatternLayout
# log4j.appender.DB.layout.ConversionPattern=insert into logs(user_id,date_time,logger,level,message) values ('%x','%d{yyyy-MM-dd HH:mm:ss}','%C','%p','%m')
```
和
```properties
#log4j.appender.DB.sql=insert into logs(user_id,date_time,logger,level,message) values ('%x','%d{yyyy-MM-dd HH:mm:ss}','%C','%p','%m')

# Define the layout for file appender
log4j.appender.DB.layout=org.apache.log4j.PatternLayout
log4j.appender.DB.layout.ConversionPattern=insert into logs(user_id,date_time,logger,level,message) values ('%x','%d{yyyy-MM-dd HH:mm:ss}','%C','%p','%m')
```
这两种方式都是可以的。

## 示例程序
下述`Java`类是一个非常简单的例子，该类在`Java`应用中初始化并使用了`Log4j`类库。
```java /Log4jDemo/src/demo/Log4jExample.java
package demo;

import java.io.IOException;
import java.sql.SQLException;
import org.apache.log4j.Logger;

public class Log4jExample
{
    /* Get actual class name to be printed on */
    static Logger log = Logger.getLogger(Log4jExample.class.getName());

    public static void main(String[] args) throws IOException, SQLException
    {
        log.debug("Hello this is a debug message");
        log.info("Hello this is an info message");
    }
}
```
运行`Log4jExample.java`,然后查询``DBNAME`数据库中的``LOGS`表，会发现如下条目：
```cmd
mysql> select * from LOGS;
+---------+---------------------+-------------------+-------+-------------------------------+
| user_id | date_time           | logger            | level | message                       |
+---------+---------------------+-------------------+-------+-------------------------------+
|         | 2020-08-05 18:22:49 | demo.Log4jExample | DEBUG | Hello-this-is-a-debug-message |
|         | 2020-08-05 18:22:51 | demo.Log4jExample | INFO  | Hello this is an info message |
+---------+---------------------+-------------------+-------+-------------------------------+
2 rows in set (0.02 sec)
```
