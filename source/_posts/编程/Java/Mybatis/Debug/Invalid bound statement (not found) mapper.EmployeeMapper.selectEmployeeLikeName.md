---
title: Invalid bound statement (not found) mapper.EmployeeMapper.selectEmployeeLikeName
categories: 
  - 编程
  - Java
  - Mybatis
  - Debug
date: 2020-09-01 11:58:17
updated: 2021-03-18 02:43:27
abbrlink: a0de93a7
---
# 错误提示
<pre>
Exception in thread "main" org.apache.ibatis.binding.BindingException: <mark>Invalid bound statement (not found): mapper.EmployeeMapper.selectEmployeeLikeName</mark>
	at org.apache.ibatis.binding.MapperMethod$SqlCommand.&lt;init&gt;(MapperMethod.java:225)
	at org.apache.ibatis.binding.MapperMethod.&lt;init&gt;(MapperMethod.java:48)
	at org.apache.ibatis.binding.MapperProxy.cachedMapperMethod(MapperProxy.java:65)
	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:58)
	at com.sun.proxy.$Proxy2.selectEmployeeLikeName(Unknown Source)
	at test.BindTest.main(BindTest.java:19)

</pre>

# 分析
拼写错误:
Mapper.xml文件中select语句的id和Mapper接口中的方法名不相同

## EmployeeMapper.xml
<pre>
&lt;!-- 测试bind属性 --&gt;
&lt;select
    id="<mark>seletEmployeeLikeName</mark>"
    resultType="domain.Employee"&gt;
    &lt;!-- 创建OGNL表达式并绑定到上下文的pattern属性中 --&gt;
    &lt;!-- _parameter表示传递的Employee对象 --&gt;
    &lt;!-- _parameter.getName()表示调用参数(Employee对象)的getName方法 --&gt;
    &lt;!-- 两个下划线`__`是like子句的通配符,一个下划线可以匹配一个字符,两个下划线表示可以匹配两个字符 --&gt;
    &lt;!-- like子句还有一个通配符%(百分号)这个通配符可以匹配任意多个字符 --&gt;
    &lt;!-- 整个表达式表示匹配以_parameter.getName()获取到的员工名字开通,并且后面还有两个任意字符的字符串 --&gt;
    &lt;bind
        name="pattern"
        value="_parameter.getName()+'__'"/&gt;
    &lt;!-- 通过mybatis表达式获取上下文中的pattern属性值 --&gt;
    select * from tb_employee where loginname like &#35;{pattern}
&lt;/select&gt;
</pre>

## EmployeeMapper.java
<pre>
package mapper;
......
public interface EmployeeMapper {
    ......
    List&lt;Employee&gt; <mark>selectEmployeeLikeName</mark>(Employee employee);
    ......
}
</pre>
# 解决方案
使`Mapper`接口中的方法名和`Mapper.xml`中的`select`方法的`id`属性值
相同即可.
