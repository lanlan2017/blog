---
title: java字符串数组去重复
categories: 
  - Java
  - 字符串处理
abbrlink: 87cde06d
date: 2021-03-20 04:55:35
updated: 2022-04-04 00:51:44
---
# java字符串数组去重复 算法描述
依次从原来的数组中取出元素，放入到缓存数组中。
每次放入之前先在缓存数组中查找该元素，如果缓存数组中已经有该元素了，就不放入缓存数组，如果没有，则放入缓存数组中。
# 实现方式
创建list集合，每次放入之前先在list里面查找，list里面没有则放入。
利用Set集合不能放入重复的元素的特性，直接放入Set集合。
