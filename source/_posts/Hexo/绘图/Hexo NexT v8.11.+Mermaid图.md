---
title: Hexo NexT v8.11.+Mermaid图
categories:
  - Hexo
  - 绘图
abbrlink: fa2a6430
date: 2022-04-15 16:57:37
updated: 2022-04-15 16:57:37
---
# NexT v8.11增加了对Mermaid的支持
https://theme-next.js.org/next-8-11-0-released/

# 使用方法
https://theme-next.js.org/docs/tag-plugins/mermaid.html
升级NexT版本到V8.11.0,然后在

# 显示效果

## 流程图

```mermaid
graph TD
A[Hard] -->|Text| B(Round)
B --> C{Decision}
C -->|One| D[Result 1]
C -->|Two| E[Result 2]
```

## 顺序图

```mermaid
sequenceDiagram
Alice->>John: Hello John, how are you?
loop Healthcheck
    John->>John: Fight against hypochondria
end
Note right of John: Rational thoughts!
John-->>Alice: Great!
John->>Bob: How about you?
Bob-->>John: Jolly good!
```

## 甘特图

```mermaid
gantt
dateFormat  YYYY-MM-DD
section Section
Completed :done,    des1, 2014-01-06,2014-01-08
Active        :active,  des2, 2014-01-07, 3d
Parallel 1   :         des3, after des1, 1d
Parallel 2   :         des4, after des1, 1d
Parallel 3   :         des5, after des3, 1d
Parallel 4   :         des6, after des4, 1d
```