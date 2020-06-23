---
title: Java Web项目常用Maven依赖
categories:
  - 编程
  - Java
  - Java EE
  - 环境搭建
abbrlink: c20afdb9
date: 2019-04-29 20:25:38
updated: 2019-12-17 05:18:52
---
<div id='my_toc'><a href="/blog/c20afdb9/#Java-Web项目常用Maven依赖" class="header_1">Java Web项目常用Maven依赖</a>&nbsp;<br><a href="/blog/c20afdb9/#Spring-MVC-Maven依赖" class="header_2">Spring MVC Maven依赖</a>&nbsp;<br><a href="/blog/c20afdb9/#JSTL-Maven依赖" class="header_2">JSTL Maven依赖</a>&nbsp;<br><a href="/blog/c20afdb9/#jackson-Maven依赖" class="header_2">jackson Maven依赖</a>&nbsp;<br><a href="/blog/c20afdb9/#Fastjson-Maven依赖" class="header_2">Fastjson Maven依赖</a>&nbsp;<br><a href="/blog/c20afdb9/#MyBatis-Maven依赖" class="header_2">MyBatis Maven依赖</a>&nbsp;<br><a href="/blog/c20afdb9/#mysql驱动-Maven依赖" class="header_2">mysql驱动 Maven依赖</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Java Web项目常用Maven依赖 #
## Spring MVC Maven依赖 ##
```xml
<!-- Spring MVC依赖 -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-aop</artifactId>
    <version>5.1.7.RELEASE</version>
</dependency>
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-beans</artifactId>
    <version>5.1.7.RELEASE</version>
</dependency>
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.1.7.RELEASE</version>
</dependency>
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-expression</artifactId>
    <version>5.1.7.RELEASE</version>
</dependency>
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-web</artifactId>
    <version>5.1.7.RELEASE</version>
</dependency>
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-webmvc</artifactId>
    <version>5.1.7.RELEASE</version>
</dependency>
<dependency>
    <groupId>commons-logging</groupId>
    <artifactId>commons-logging</artifactId>
    <version>1.2</version>
</dependency>
<!-- Spring MVC依赖结束 -->
```
## JSTL Maven依赖 ##
```xml
<!-- JSTL依赖 开始 -->
<dependency>
    <groupId>jstl</groupId>
    <artifactId>jstl</artifactId>
    <version>1.2</version>
</dependency>
<!-- JSTL依赖 结束 -->
```
## jackson Maven依赖 ##
```xml
<!-- jackson依赖开始 -->
<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-databind</artifactId>
    <version>2.9.8</version>
</dependency>
<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-core</artifactId>
    <version>2.9.8</version>
</dependency>
<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-annotations</artifactId>
    <version>2.9.8</version>
</dependency>
<!-- jackson依赖结束 -->
```
## Fastjson Maven依赖 ##
```xml
<!-- Fastjson 依赖 开始 -->
<dependency>
    <groupId>com.alibaba</groupId>
    <artifactId>fastjson</artifactId>
    <version>1.2.58</version>
</dependency>
<!-- Fastjson 依赖 结束 -->
```
## MyBatis Maven依赖 ##
```xml
<!-- MyBatis 依赖 开始 -->
<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis</artifactId>
    <version>3.4.6</version>
</dependency>
<!-- MyBatis 依赖 结束 -->
```
## mysql驱动 Maven依赖 ##
```xml
<!-- mysql 依赖 开始 -->
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>5.1.47</version>
</dependency>
<!-- mysql 依赖 结束 -->
```
