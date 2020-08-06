---
title: Log4j概述
categories: 
  - 编程
  - Java
  - Log4j教程
date: 2020-08-03 03:30:02
updated: 2020-08-03 11:21:24
abbrlink: f69dab82
---
<div id='my_toc'><a href="/blog/f69dab82/#Log4j概述" class="header_1">Log4j概述</a>&nbsp;<br><a href="/blog/f69dab82/#Log4j组成部分" class="header_2">Log4j组成部分</a>&nbsp;<br><a href="/blog/f69dab82/#Log4j的历史" class="header_2">Log4j的历史</a>&nbsp;<br><a href="/blog/f69dab82/#Log4j的功能" class="header_2">Log4j的功能</a>&nbsp;<br><a href="/blog/f69dab82/#记录日志的优缺点" class="header_2">记录日志的优缺点</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# Log4j概述
`Log4j`是一个使用`Java`语言编写的，可靠、快速、灵活的日志框架（`API`），使用`Apache Software License`授权。

它被移植到C、C++、C#、`Perl`、`Python`、`Ruby`和`Eiffel`语言中。

`Log4j`是高度可配置的，在运行期使用外部的**配置文件**对其进行配置。它按照优先级别记录日志，并可将日志信息定向输出到各种介质，比如数据库、文件、控制台、`Unix Syslog`等。
## Log4j组成部分
Log4j主要由三部分组成：
- `loggers`：负责采集日志信息。
- `appenders`：负责将日志信息发布到不同地方。
- `layouts`：负责以各种风格格式化日志信息。

## Log4j的历史
- 始于 1996 年，作为记录`E.U. SEMPER`(`Secure Electronic Marketplace for Europe`)项目跟踪信息的`API`。
- 经过大量的完善和蜕变，最初的`API`终于演进为`Log4j`，一个在`Java`社区流行的日志类库。
- 该类库使用`Apache Software License`授权，该授权是经开源促进协会认证的、完整的开源协议。
- 最新版本的`Log4j`，连同其代码、类文件和文档可通过[http://logging.apache.org/log4j/](http://logging.apache.org/log4j/)获取。

## Log4j的功能
- 线程安全。
- 速度优化。
- 基于命名的`logger`层次。
- 每个`logger`支持多种输出`appender`。
- 支持国际化。
- 不受限于预定义好的设施。
- 日志记录行为可在运行期通过配置文件设置。
- 设计之初就考虑了处理`Java`异常。
- 使用多个日志级别：
  - `ALL`、
  - `TRACE`、
  - `DEBUG`、
  - `INFO`、
  - `WARN`、
  - `ERROR`、
  - `FATAL`。
- 通过扩展`Layout`类可轻松改变输出日志的格式。
- 输出日志的目的和策略可通过实现`Appender`接口改变。
- 失败即停止。虽然`Log4j`努力做到最好，但不保证每一条日志都能发送到指定目的地。

## 记录日志的优缺点
记录日志是软件开发中的重要一环。编写良好的日志代码能为运行应用提供快速的诊断信息和良好的存储结构，方便维护。

记录日志也有其缺点，它会让应用变慢。假如输出太详细，可能会导致屏幕闪动。为了减轻这些影响，`Log4j`被设计为可靠的，更快的和可扩展的。

由于日志很少是应用程序关注的焦点，所以`Log4j API`力争做到简单并易于理解和使用。
