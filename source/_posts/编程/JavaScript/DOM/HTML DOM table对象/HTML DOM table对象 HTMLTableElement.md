---
title: HTML DOM table对象 HTMLTableElement
categories:
  - 编程
  - JavaScript
  - DOM
  - HTML DOM table对象
abbrlink: d91920ba
date: 2021-08-11 16:47:39
updated: 2021-08-11 16:47:39
---
# HTMLTableElement
[https://developer.mozilla.org/zh-CN/docs/Web/API/HTMLTableElement](https://developer.mozilla.org/zh-CN/docs/Web/API/HTMLTableElement)
> HTMLTableElement.insertRow() (en-US)
> 返回一个 HTMLTableRowElement，表示表格中的一个新行。它会被立即插入到行集合中给定 index 位置所表示的 <tr> 元素之前。如果有必要一个 <tbody> (en-US) 会被创建。如果 index 值为 -1， 这个新行会被追加到集合中。如果 index 值小于 -1 或者大于集合中的行总数，一个带有 IndexSizeError 值的异常 DOMException 会发生。

## HTMLTableElement.insertRow(index)
[https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableElement/insertRow](https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableElement/insertRow)
### 句法
```javascript
var newRow = HTMLTableElement.insertRow(index);
```
### 参数
index 可选的

新行的行索引。如果index是-1或等于行数，该行被追加为最后一行。如果index大于行数，IndexSizeError则会导致异常。如果index省略，则默认为-1。


## HTMLTableRowElement.insertCell(index)
[https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableRowElement/insertCell](https://developer.mozilla.org/en-US/docs/Web/API/HTMLTableRowElement/insertCell)
### 句法
```javascript
var newCell = HTMLTableRowElement.insertCell(index);
```
### 参数
index 可选的

index是新单元格的单元格索引。如果index是 -1或等于细胞的数量，细胞被附加作为行中的最后一个单元。如果index大于单元格数， IndexSizeError则会导致异常。如果index省略，则默认为-1。
