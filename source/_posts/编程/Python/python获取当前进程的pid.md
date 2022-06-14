---
title: python获取当前进程的pid
categories:
  - 编程
  - Python
abbrlink: 131f02e4
date: 2022-05-24 18:23:14
updated: 2022-05-24 18:23:14
---
# python获取进程id号
os.getpid()获取当前进程id
os.getppid()获取父进程id
<!-- more -->


# 示例
```py D:\Desktop\test\Python\pid\pidDemo.py
import os

print("当前进程的pid：",os.getpid())
print("父进程的pid：",os.getppid())
```
运行结果：

```
当前进程的pid： 7216
父进程的pid： 8496
```
# 关闭指定pid的进程:taskkill -f -pid 16660
获取到当前进程的pid之后，就可以使用taskkill
```
taskkill -f -pid 16660
```
## 示例2
对于可能长时间运行的后台进程，可以把当前进程的pid写到文件中。
这样可以在需要的时候，从文件中读取后台进程的pid,从而关掉该进程。
```py D:\Desktop\test\Python\pid\pidDemo2.py
import os
import time

f = open("pid.txt", "w")
f.write(str(os.getpid()))
f.close()

while True:
    print("后台进程...")
    time.sleep(1.0)
```
运行该程序，将会在同级目录下生成pid.txt文件：
```txt D:\Desktop\test\Python\pid\pid.txt
5444
```
此时就可以在其他地方使用taskkill命令来关闭该进程了。
```
D:\Desktop\test\CMD>taskkill -f -pid 5444
成功: 已终止 PID 为 5444 的进程。

D:\Desktop\test\CMD>
```

# 参考资料
https://www.cnblogs.com/ming-4/p/11908135.html