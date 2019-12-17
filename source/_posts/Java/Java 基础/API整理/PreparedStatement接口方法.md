---
title: PreparedStatement接口方法
categories: 
  - Java
  - Java 基础
  - API整理
date: 2019-05-21 23:50:19
updated: 2019-12-17 05:17:09
abbrlink: 87bdbf10
---
<div id='my_toc'><a href="/blog/87bdbf10/#PreparedStatement接口方法2" class="header_1">PreparedStatement接口方法2</a><br><a href="/blog/87bdbf10/#执行SQL语句的方法" class="header_2">执行SQL语句的方法</a><br><a href="/blog/87bdbf10/#其他方法" class="header_2">其他方法</a><br><a href="/blog/87bdbf10/#getXXX方法" class="header_2">getXXX方法</a><br><a href="/blog/87bdbf10/#setXXX方法" class="header_2">setXXX方法</a><br><a href="/blog/87bdbf10/#setObject方法" class="header_3">setObject方法</a><br><a href="/blog/87bdbf10/#设置数组的方法" class="header_3">设置数组的方法</a><br><a href="/blog/87bdbf10/#设置输入流的方法" class="header_3">设置输入流的方法</a><br><a href="/blog/87bdbf10/#设置大数字对象的方法" class="header_3">设置大数字对象的方法</a><br><a href="/blog/87bdbf10/#Set基本数据类型方法" class="header_3">Set基本数据类型方法</a><br><a href="/blog/87bdbf10/#设定为Reader对象的方法" class="header_3">设定为Reader对象的方法</a><br><a href="/blog/87bdbf10/#set时间方法" class="header_3">set时间方法</a><br><a href="/blog/87bdbf10/#setString方法" class="header_3">setString方法</a><br><a href="/blog/87bdbf10/#setNull方法" class="header_3">setNull方法</a><br><a href="/blog/87bdbf10/#其他set方法" class="header_3">其他set方法</a><br><a href="/blog/87bdbf10/#从接口-java.sql.Statement-继承的方法" class="header_2">从接口 java.sql.Statement 继承的方法</a><br><a href="/blog/87bdbf10/#从接口-java.sql.Wrapper-继承的方法" class="header_2">从接口 java.sql.Wrapper 继承的方法</a><br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# PreparedStatement接口方法2 #
接口`PreparedStatement`位于`java.sql`包
所有超级接口： 
`Statement`, `Wrapper `
所有已知子接口： 
`CallableStatement `
## 执行SQL语句的方法 ##
|方法|描述|
|:---|:---|
| `boolean execute()`|在此 `PreparedStatement `对象中执行 `SQL `语句，该语句可以是任何种类的 `SQL `语句。|
| `ResultSet executeQuery()`|在此 `PreparedStatement `对象中执行 `SQL `查询，并返回该查询生成的 `ResultSet `对象。|
| `int executeUpdate()`|在此 `PreparedStatement `对象中执行 `SQL `语句，该语句必须是一个 `SQL `数据操作语言（`Data Manipulation Language`，`DML`）语句，比如 `INSERT`、`UPDATE `或 `DELETE `语句；或者是无返回内容的 `SQL `语句，比如 `DDL `语句。|
## 其他方法 ##
|方法|描述|
|:---|:---|
|`void addBatch()`|将一组参数添加到此 `PreparedStatement `对象的批处理命令中。|
| `void clearParameters()`|立即清除当前参数值。|
## getXXX方法 ##
|方法|描述|
|:---|:---|
| `ResultSetMetaData getMetaData()`|获取包含有关 `ResultSet `对象列信息的 `ResultSetMetaData `对象，`ResultSet `对象将在执行此 `PreparedStatement `对象时返回。|
| `ParameterMetaData getParameterMetaData()`|获取此 `PreparedStatement `对象的参数的编号、类型和属性。|
## setXXX方法 ##
### setObject方法 ###
|方法|描述|
|:---|:---|
| `void setObject(int parameterIndex, Object x)`|使用给定对象设置指定参数的值。|
| `void setObject(int parameterIndex, Object x, int targetSqlType)`|使用给定对象设置指定参数的值。|
| `void setObject(int parameterIndex, Object x, int targetSqlType, int scaleOrLength)`|使用给定对象设置指定参数的值。|
### 设置数组的方法 ###
|方法|描述|
|:---|:---|
| `void setArray(int parameterIndex, Array x)`|将指定参数设置为给定 `java.sql.Array `对象。|
### 设置输入流的方法 ###
|方法|描述|
|:---|:---|
| `void setAsciiStream(int parameterIndex, InputStream x)`|将指定参数设置为给定输入流。|
| `void setAsciiStream(int parameterIndex, InputStream x, int length)`|将指定参数设置为给定输入流，该输入流将具有给定字节数。|
| `void setAsciiStream(int parameterIndex, InputStream x, long length)`|将指定参数设置为给定输入流，该输入流将具有指定字节数。|
| `void setBinaryStream(int parameterIndex,InputStream x)`|将指定参数设置为给定输入流。|
| `void setBinaryStream(int parameterIndex, InputStream x, int length)`|将指定参数设置为给定输入流，该输入流将具有给定字节数。|
| `void setBinaryStream(int parameterIndex, InputStream x, long length)`|将指定参数设置为给定输入流，该输入流将具有指定字节数。|

### 设置大数字对象的方法 ###
|方法|描述|
|:---|:---|
| `void setBigDecimal(int parameterIndex, BigDecimal x)`|将指定参数设置为给定 `java.math.BigDecimal `值。|
| `void setBlob(int parameterIndex, Blob x)`|将指定参数设置为给定 `java.sql.Blob `对象。|
| `void setBlob(int parameterIndex, InputStream inputStream)`|将指定参数设置为 `InputStream `对象。|
| `void setBlob(int parameterIndex, InputStream inputStream, long length)`|将指定参数设置为 `InputStream `对象。|
| `void setClob(int parameterIndex, Clob x)`|将指定参数设置为给定 `java.sql.Clob `对象。|
| `void setClob(int parameterIndex, Reader reader)`|将指定参数设置为 `Reader `对象。|
| `void setClob(int parameterIndex, Reader reader, long length)`|将指定参数设置为 `Reader `对象。|
| `void setNClob(int parameterIndex, NClob value)`|将指定参数设置为 `java.sql.NClob `对象。|
| `void setNClob(int parameterIndex, Reader reader)`|将指定参数设置为 `Reader `对象。|
| `void setNClob(int parameterIndex, Reader reader, long length)`|将指定参数设置为 `Reader `对象。|
### Set基本数据类型方法 ###
|方法|描述|
|:---|:---|
| `void setByte(int parameterIndex, byte x)`|将指定参数设置为给定 `Java byte `值。|
| `void setBytes(int parameterIndex, byte[] x)`|将指定参数设置为给定 `Java byte `数组。|
| `void setShort(int parameterIndex, short x)`|将指定参数设置为给定 `Java short `值。|
| `void setInt(int parameterIndex, int x)`|将指定参数设置为给定 `Java int `值。|
| `void setLong(int parameterIndex, long x)`|将指定参数设置为给定 `Java long `值。|
| `void setFloat(int parameterIndex, float x)`|将指定参数设置为给定 `Java REAL `值。|
| `void setDouble(int parameterIndex, double x)`|将指定参数设置为给定 `Java double `值。|
| `void setBoolean(int parameterIndex, boolean x)`|将指定参数设置为给定 `Java boolean `值。|

### 设定为Reader对象的方法 ###
|方法|描述|
|:---|:---|
| `void setCharacterStream(int parameterIndex, Reader reader)`|将指定参数设置为给定 `Reader `对象。|
| `void setCharacterStream(int parameterIndex, Reader reader, int length)`|将给定参数设置为给定 `Reader `对象，该对象具有给定字符数长度。|
| `void setCharacterStream(int parameterIndex, Reader reader, long length)`|将指定参数设置为给定 `Reader `对象，该对象具有给定字符数长度。|
| `void setNCharacterStream(int parameterIndex, Reader value)`|将指定参数设置为 `Reader `对象。|
| `void setNCharacterStream(int parameterIndex, Reader value, long length)`|将指定参数设置为 `Reader `对象。|

### set时间方法 ###
|方法|描述|
|:---|:---|
| `void setDate(int parameterIndex, Date x)`|使用运行应用程序的虚拟机的默认时区将指定参数设置为给定 `java.sql.Date `值。|
| `void setDate(int parameterIndex, Date x, Calendar cal)`|使用给定的 `Calendar `对象将指定参数设置为给定 `java.sql.Date `值。|
| `void setTime(int parameterIndex, Time x)`|将指定参数设置为给定 `java.sql.Time `值。|
| `void setTime(int parameterIndex, Time x, Calendar cal)`|使用给定的 `Calendar `对象将指定参数设置为给定 `java.sql.Time `值。|
| `void setTimestamp(int parameterIndex, Timestamp x)`|将指定参数设置为给定 `java.sql.Timestamp `值。|
| `void setTimestamp(int parameterIndex, Timestamp x, Calendar cal)`|使用给定的 `Calendar `对象将指定参数设置为给定 `java.sql.Timestamp `值。|
### setString方法 ###
|方法|描述|
|:---|:---|
| `void setString(int parameterIndex, String x)`|将指定参数设置为给定 `Java String `值。|
| `void setNString(int parameterIndex, String value)`|将指定参数设置为给定 `String `对象。|
### setNull方法 ###
|方法|描述|
|:---|:---|
| `void setNull(int parameterIndex, int sqlType)`|将指定参数设置为 `SQL NULL`。|
| `void setNull(int parameterIndex, int sqlType, String typeName)`|将指定参数设置为 `SQL NULL`。|
| `void setRef(int parameterIndex, Ref x)`|将指定参数设置为给定 `REF(<structured-type>) `值。|
### 其他set方法 ###
|方法|描述|
|:---|:---|
| `void setRowId(int parameterIndex, RowId x)`|将指定参数设置为给定 `java.sql.RowId `对象。|
| `void setSQLXML(int parameterIndex, SQLXML xmlObject)`|将指定参数设置为给定 `java.sql.SQLXML `对象。|
| `void setURL(int parameterIndex, URL x)`|将指定参数设置为给定 `java.net.URL `值。|
## 从接口 java.sql.Statement 继承的方法  ##
`addBatch`, `cancel`, `clearBatch`, `clearWarnings`, `close`, `execute`, `execute`, `execute`, `execute`, `executeBatch`, `executeQuery`, `executeUpdate`, `executeUpdate`, `executeUpdate`, `executeUpdate`, `getConnection`, `getFetchDirection`, `getFetchSize`, `getGeneratedKeys`, `getMaxFieldSize`, `getMaxRows`, `getMoreResults`, `getMoreResults`, `getQueryTimeout`, `getResultSet`, `getResultSetConcurrency`, `getResultSetHoldability`, `getResultSetType`, `getUpdateCount`, `getWarnings`, `isClosed`, `isPoolable`, `setCursorName`, `setEscapeProcessing`, `setFetchDirection`, `setFetchSize`, `setMaxFieldSize`, `setMaxRows`, `setPoolable`, `setQueryTimeout `
## 从接口 java.sql.Wrapper 继承的方法  ##
`isWrapperFor`, `unwrap `
