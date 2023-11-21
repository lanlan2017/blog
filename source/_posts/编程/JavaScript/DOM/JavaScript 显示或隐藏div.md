---
title: JavaScript 显示或隐藏div
categories:
  - 编程
  - JavaScript
  - DOM
abbrlink: 12755a5a
date: 2023-01-17 15:07:57
updated: 2023-01-17 15:07:57
---
# JavaScript 显示隐藏div js显示或隐藏div

```javascript
// 被控制的<div>
const controlDiv = document.createElement('div');
// 按钮
const showHideBtn = document.createElement('button');
// 设置按钮的文本
showHideBtn.innerText = '隐藏';
// 按钮的事件处理程序
showHideBtn.onclick = function () {
    // 当按钮的文字是隐藏时
    if (showHideBtn.innerText === '隐藏') {
        // 隐藏被控制的div
        controlDiv.style.display = 'none';
        // 修改按钮的提示文本为显示
        showHideBtn.innerText = '显示';
    } else if (showHideBtn.innerText === '显示') {
        // 显示被控制的<div>
        controlDiv.style.display = 'block';
        // 修改按钮的提示文本
        showHideBtn.innerText = '隐藏';
    }
}
```
