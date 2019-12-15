---
title: java打印表格 将ResultSet中的数据打印成表格
categories: 
  - Java
  - java工具类
date: 2019-10-23 22:19:13
updated: 2019-12-09 19:45:22
abbrlink: d58ef648
---
<div id='my_toc'><a href="/blog/d58ef648/#java打印表格-将ResultSet中的数据打印成表格">java打印表格 将ResultSet中的数据打印成表格</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d58ef648/#问题描述">问题描述</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d58ef648/#思路">思路</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d58ef648/#字符串格式化方式">字符串格式化方式</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d58ef648/#左对齐">左对齐</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d58ef648/#右对齐">右对齐</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d58ef648/#实现">实现</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d58ef648/#测试">测试</a><br/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/blog/d58ef648/#运行结果">运行结果</a><br/></div><!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}
var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}
</script>

<!--end-->
# java打印表格 将ResultSet中的数据打印成表格 #
## 问题描述 ##
`MySQL`的查询语句输出如下:
```cmd
mysql> select * from instructor;
+-------+------------+------------+-----------+
| ID    | name       | dept_name  | salary    |
+-------+------------+------------+-----------+
| 10101 | Srinivasan | Comp. Sci. | 65000.00  |
| 12121 | Wu         | Finance    | 90000.00  |
| 15151 | Mozart     | Music      | 40000.00  |
| 22222 | Einstein   | Physics    | 95000.00  |
| 25566 | Brown      | Biology    | 100000.00 |
| 30765 | Green      | Music      | NULL      |
| 32343 | El Said    | History    | 60000.00  |
| 33456 | Gold       | Physics    | 87000.00  |
| 45565 | Katz       | Comp. Sci. | 75000.00  |
| 58583 | Califieri  | History    | 62000.00  |
| 76543 | Singh      | Finance    | 80000.00  |
| 76766 | Crick      | Biology    | 72000.00  |
| 77987 | Kim        | Physics    | 98000.00  |
| 83821 | Brandt     | Comp. Sci. | 92000.00  |
| 88877 | Perry      | Finance    | 125000.00 |
| 88878 | Perry      | Finance    | 125000.00 |
| 98345 | Kim        | Elec. Eng. | 80000.00  |
+-------+------------+------------+-----------+
17 rows in set (0.04 sec)
```
使用`JDBC`执行上述的查询语句,将结果集中的查询结果以表格的形式打印出来。
## 思路 ##
- 通过结果集的元数据可以知道结果集中的列数,和列名.
- 然后遍历结果集,分别统计每一列中的最大字符数。
- 然后通过`System.out.printf()`方法进行格式化输出。

## 字符串格式化方式 ##
### 左对齐 ###
`%-10s`表示这个字符串的长度为10,不足10的地方以空格填充,带`-`的表示左对齐.
```java
System.out.printf("属性:%-10s ", rsmd.getColumnName(i));
System.out.printf("类型:%-10s\n", rsmd.getColumnTypeName(i));
```
```cmd
属性:ID         类型:VARCHAR   
属性:name       类型:VARCHAR   
属性:dept_name  类型:VARCHAR   
属性:salary     类型:DECIMAL  
```
### 右对齐 ###
`%10s`表示这个字符串的长度为10,不足10的地方以空格填充,默认右对齐
```java
System.out.printf("属性:%10s ", rsmd.getColumnName(i));
System.out.printf("类型:%10s\n", rsmd.getColumnTypeName(i));
```
```cmd
属性:        ID 类型:   VARCHAR
属性:      name 类型:   VARCHAR
属性: dept_name 类型:   VARCHAR
属性:    salary 类型:   DECIMAL
```
## 实现 ##
```java
package tools;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * 结果集打印机.将结果集中的数据打印成表格.
 */
public class ResultSetPrinter {
    public static void printResultSet(ResultSet rs) throws SQLException {
        ResultSetMetaData resultSetMetaData = rs.getMetaData();
        // 获取列数
        int ColumnCount = resultSetMetaData.getColumnCount();
        // 保存当前列最大长度的数组
        int[] columnMaxLengths = new int[ColumnCount];
        // 缓存结果集,结果集可能有序,所以用ArrayList保存变得打乱顺序.
        ArrayList<String[]> results = new ArrayList<>();
        // 按行遍历
        while (rs.next()) {
            // 保存当前行所有列
            String[] columnStr = new String[ColumnCount];
            // 获取属性值.
            for (int i = 0; i < ColumnCount; i++) {
                // 获取一列
                columnStr[i] = rs.getString(i + 1);
                // 计算当前列的最大长度
                columnMaxLengths[i] = Math.max(columnMaxLengths[i], (columnStr[i] == null) ? 0 : columnStr[i].length());
            }
            // 缓存这一行.
            results.add(columnStr);
        }
        printSeparator(columnMaxLengths);
        printColumnName(resultSetMetaData, columnMaxLengths);
        printSeparator(columnMaxLengths);
        // 遍历集合输出结果
        Iterator<String[]> iterator = results.iterator();
        String[] columnStr;
        while (iterator.hasNext()) {
            columnStr = iterator.next();
            for (int i = 0; i < ColumnCount; i++) {
                // System.out.printf("|%" + (columnMaxLengths[i] + 1) + "s", columnStr[i]);
                System.out.printf("|%" + columnMaxLengths[i] + "s", columnStr[i]);
            }
            System.out.println("|");
        }
        printSeparator(columnMaxLengths);
    }

    /**
     * 输出列名.
     *
     * @param resultSetMetaData 结果集的元数据对象.
     * @param columnMaxLengths  每一列最大长度的字符串的长度.
     * @throws SQLException
     */
    private static void printColumnName(ResultSetMetaData resultSetMetaData, int[] columnMaxLengths) throws SQLException {
        int columnCount = resultSetMetaData.getColumnCount();
        for (int i = 0; i < columnCount; i++) {
            // System.out.printf("|%" + (columnMaxLengths[i] + 1) + "s", resultSetMetaData.getColumnName(i + 1));
            System.out.printf("|%" + columnMaxLengths[i] + "s", resultSetMetaData.getColumnName(i + 1));
        }
        System.out.println("|");
    }

    /**
     * 输出分隔符.
     *
     * @param columnMaxLengths 保存结果集中每一列的最长的字符串的长度.
     */
    private static void printSeparator(int[] columnMaxLengths) {
        for (int i = 0; i < columnMaxLengths.length; i++) {
            System.out.print("+");
            // for (int j = 0; j < columnMaxLengths[i] + 1; j++) {
            for (int j = 0; j < columnMaxLengths[i]; j++) {
                System.out.print("-");
            }
        }
        System.out.println("+");
    }

}

```
## 测试 ##
```java
package tools;
import java.sql.*;

public class Test {
    private static String driver = "com.mysql.cj.jdbc.Driver";
    private static String URL = "jdbc:mysql://127.0.0.1:3306/university?serverTimezone=UTC";
    private static String user = "root";
    private static String password = "root";

    /**
     * JDBC测试.
     */
    private static void JDBCexample() {
        // 1.加载数据库驱动
        try {

            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        testStatement();
    }

    /**
     * 测试Statement的用法.
     */
    private static void testStatement() {
        try (// 2.打开数据库连接
             Connection conn = DriverManager.getConnection(URL, user, password);
             // 3.创建语句
             Statement stmt = conn.createStatement()) {
            // 模拟SQL注入
            testSqlInjecton(stmt);

        } catch (SQLException sqle) {
            System.out.println("SQLException : " + sqle);
        }
    }

    /**
     * 模拟SQL注入.
     *
     * @param stmt Statement对象.
     * @throws SQLException
     */
    private static void testSqlInjecton(Statement stmt) throws SQLException {
        String name = "X' or 'Y' = 'Y";
        String sql = "select * from instructor where name = '" + name + "'";
        ResultSet rs = stmt.executeQuery(sql);
        ResultSetPrinter.printResultSet(rs);
    }

    public static void main(String[] args) {
        JDBCexample();
    }
}
```
## 运行结果 ##
```cmd
+-----+----------+----------+---------+
|   ID|      name| dept_name|   salary|
+-----+----------+----------+---------+
|10101|Srinivasan|Comp. Sci.| 65000.00|
|12121|        Wu|   Finance| 90000.00|
|15151|    Mozart|     Music| 40000.00|
|22222|  Einstein|   Physics| 95000.00|
|25566|     Brown|   Biology|100000.00|
|30765|     Green|     Music|     null|
|32343|   El Said|   History| 60000.00|
|33456|      Gold|   Physics| 87000.00|
|45565|      Katz|Comp. Sci.| 75000.00|
|58583| Califieri|   History| 62000.00|
|76543|     Singh|   Finance| 80000.00|
|76766|     Crick|   Biology| 72000.00|
|77987|       Kim|   Physics| 98000.00|
|83821|    Brandt|Comp. Sci.| 92000.00|
|88877|     Perry|   Finance|125000.00|
|88878|     Perry|   Finance|125000.00|
|98345|       Kim|Elec. Eng.| 80000.00|
+-----+----------+----------+---------+
```