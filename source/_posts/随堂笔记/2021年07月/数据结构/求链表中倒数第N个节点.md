---
title: 求链表中倒数第N个节点
categories:
  - 随堂笔记
  - 2021年07月
  - 数据结构
abbrlink: dbdfa91a
date: 2021-07-29 20:54:37
updated: 2021-07-29 20:54:37
---
# 思想
- 定义两个指针a和b,
- 指针b指向顺数第N个节点的位置
- 然后指针a指向顺序第1个节点的位置
- 同时把指针b和指针a向后平移
- 当指针b指向最后一个节点时，此时的指针a指向的就是倒数第n个节点。

# java代码
```java
/**
 * 求链表中的倒数第N个节点
 * 
 * @param head 链表的尾节点
 * @param n 要求倒数第几个节点
 * @return 倒数第n个节点的引用变量。
 */
public static Node findNFromLast(Node head, int n) {
    Node nthFromFirst = head;
    // 先求顺数第n个节点的
    for (int i = 0; i < n - 1; i++) {
        nthFromFirst = nthFromFirst.next;
    }
    // 顺数第一个节点
    Node first = head;
    // 把顺数第n个节点向后移动到尾节点，那么
    // 顺数第1个节点就是倒数的第n个节点
    while (nthFromFirst.next != null) {
        nthFromFirst = nthFromFirst.next;
        first = first.next;
    }
    return first;
}
```
