---
title: python中如何退出多层循环
categories:
  - 编程
  - Python
abbrlink: cb38d3c8
date: 2022-05-23 15:22:23
updated: 2022-05-23 15:22:23
---
# python中如何退出多层循环
1、定义标记变量；利用变量值的变化退出循环
2、利用else continue和外层的break跳出循环
3、使用函数配合return关键字 实现跳出循环（在函数内部只要执行完return语句 则直接退出函数）

<!-- more -->
## 1、定义标记变量；利用变量值的变化退出循环
### for循环形式
```py
# 第一种嵌套形式
a = [[1, 2, 3], [5, 5, 6], [7, 8, 9]]
# init_i = 0
# init_j = 0
flag = True
for i in range(3):
    for j in range(3):
        # print(i, j)
        if a[i][j] == 5:
            flag = False
            init_i = i
            init_j = j
            # 退出内层循环
            break
    # 如果flag为flase就退出外层循环
    if not flag:
        break
print(init_i, init_j)
print(i, j)
```
### while循环形式

```py
# 第二种嵌套形式
flag = True
# 每次循环之前都判断flag
while flag:
    for i in range(10):
        print(x)
        flag = False
        # 退出内层循环
        break
```

## 2、利用else continue和外层的break跳出循环
### for循环形式
```py
a = [[1, 2, 3], [5, 5, 6], [7, 8, 9]]
init_i = 0
init_j = 0
flag = True
for i in range(3):
    for j in range(3):
        # print(i, j)
        if a[i][j] == 5:
            flag = False
            init_i = i
            init_j = j
            break
    else:
        # 继续外层循环
        continue
    # 退出外层循环
    break
    # if not flag:
    #     break
print(init_i, init_j)
print(i, j)
```
### while循环形式
```py
while True:
    for x in range(4):
        print(x)
        if x == 2:
            break
    else:
        print("未执行")
        continue
    break
```
## 3、使用函数配合return关键字 实现跳出循环（在函数内部只要执行完return语句 则直接退出函数）
```py
# 定义方法
def test():
    while True:
        for x in range(10):
            print(x)
            return


test()
```

# 参考链接
https://www.cnblogs.com/lybigdata/p/10025030.html