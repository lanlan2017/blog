---
title: Java Web项目常用Maven依赖
categories: 
  - Java
  - Java EE
  - 环境搭建
abbrlink: c20afdb9
date: 2019-04-29 20:25:38
updated: 2022-04-04 00:51:44
---
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
