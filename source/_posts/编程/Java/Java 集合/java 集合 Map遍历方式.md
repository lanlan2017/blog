---
title: java 集合 Map遍历方式
categories: 
  - 编程
  - Java
  - Java 集合
date: 2018-12-14 21:43:36
updated: 2021-03-20 09:26:50
abbrlink: ef2dac38
---
<div id='my_toc'><a href="/blog/ef2dac38/#方式1-通过keysSet遍历Map" class="header_1">方式1 通过keysSet遍历Map</a>&nbsp;<br><a href="/blog/ef2dac38/#实例" class="header_2">实例</a>&nbsp;<br><a href="/blog/ef2dac38/#方式2-通过Map-Entry对象遍历Map" class="header_1">方式2 通过Map.Entry对象遍历Map</a>&nbsp;<br><a href="/blog/ef2dac38/#实例" class="header_2">实例</a>&nbsp;<br><a href="/blog/ef2dac38/#直接遍历所有的值" class="header_1">直接遍历所有的值</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# 方式1 通过keysSet遍历Map
- 先通过keySet方法先生成键key的Set集合，
- 然后再根据Set集合的迭代器从set集合里取出键key 
- 再根据键key 通过 Map 的get(key)方法取出值，这样就取出了键值对：key-value

## 实例
**先设置Map中的数据**
```java
Map<String, Integer> map2=new HashMap<String,Integer>();
map2.put("山羊", 123);
map2.put("茄子",456);
map2.put("西瓜",789);
```
**通过key来遍历**
```java
//1 获取Map中key的Set集合
Set<String> keys=map2.keySet();
// 生成key Set集合的迭代器
Iterator<String> its=keys.iterator();
// 遍历 key Set集合
while(its.hasNext())
{
    //2 使用迭代器从key Set集合中取出key
    String key=its.next();
    //3 根据key取出Map中对应的值
    int value=map2.get(key);//然后再根据键，取出值
    System.out.println("key="+key+" value="+value);
}
```
# 方式2 通过Map.Entry对象遍历Map
- 获取Map的Map.Entry对象的Set集合 
- 然后通过Map.Entry对象的迭代器 从Map.Entry对象的Set集合中，取出一个 Map.Entry对象：
- 再从该Map.Entry中分别取出key和value

## 实例
```java
//1 获取Map.Entry对象的Set集合
Set<Map.Entry<String, Integer>> mapEntry=map2.entrySet();
//2 Map.Entry对象的Set集合迭代器
Iterator<Map.Entry<String, Integer>> mapEntryIt=mapEntry.iterator();
while(mapEntryIt.hasNext())
{
    //2 从Set集合中取出一个 Map.Entry实例
    Map.Entry<String, Integer> mapEntryElement=mapEntryIt.next();
    //3 分别取出键和值
    String key=mapEntryElement.getKey();
    Integer value=mapEntryElement.getValue();
    System.out.println("key="+key+"value="+value);
}
```
# 直接遍历所有的值
```java
Collection<Integer> values = map2.values();
Iterator<Integer> it = values.iterator();
while (it.hasNext())
{
    int value = it.next();
    System.out.println("value=" + value);
}
```
