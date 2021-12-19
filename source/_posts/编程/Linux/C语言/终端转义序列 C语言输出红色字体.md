---
title: 终端转义序列 C语言输出红色字体
categories: 
  - 编程
  - Linux
  - C语言
abbrlink: 82e2c9af
date: 2021-04-03 22:37:27
updated: 2021-04-03 23:14:48
---
# 终端转义序列
## 转义字符
```
Esc：ASCII码1B（十进制27，八进制033）
```
## 主机发往终端方向数据中的转义序列的功能
- 控制光标位置、字符颜色、字符大小等等
- 选择终端的字符集
- 控制终端上的打印机、刷卡机、磁条器、密码键盘

## 举例
```
Esc[2J       由主机发送到终端的四字节序列：1B 5B 32 4A    功能：清除屏幕
Esc[8A       四字节序列，光标上移8行
Esc[16;8H    七字节序列，光标移到16行8列
Esc[1;31m    七字节序列，红色字符
Esc[1;37m     
```

# C语言示例
## C语言输出红色字体
redCharacter.c
```c redCharacter.c
#include <stdio.h>
int main()
{
    /*
    终端转义序列
        转义字符
            Esc：ASCII码1B（十进制27，八进制033）
         主机发往终端方向数据中的转义序列的功能
            控制光标位置、字符颜色、字符大小等等
            选择终端的字符集
            控制终端上的打印机、刷卡机、磁条器、密码键盘
         举例
            Esc[2J  由主机发送到终端的四字节序列：1B 5B 32 4A    功能：清除屏幕
            Esc[8A       四字节序列，光标上移8行
            Esc[16;8H  七字节序列，光标移到16行8列
            Esc[1;31m  七字节序列，红色字符
             Esc[1;37m  
    */
    // 下面的\033表示这个八进制的033,也就是Esc字符
    printf("\033[1;31mHelloWorld!\033[1;37m\n");
    return 0;
}
```
编译运行结果
```
[root@localhost C_Test]# gcc redCharacter.c -o redCharacter.out
[root@localhost C_Test]# ./redCharacter.out 
HelloWorld!
[root@localhost C_Test]# 
```
可以看到这里的“HelloWorld!”是红色的，如下图所示：

![图1](https://raw.githubusercontent.com/lanlan2017/images/master/Programming/Linux/CLanguage/TerminalEscapeSequence/1.png)

## 设置前景色背景色
```c terminalColor.c
#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[])
{

    while (1)
    {
        printf("************************* \n");
        printf("\033[0;30;41m color!!! \033[0m Hello \n");
        printf("\033[1;30;41m color!!! \033[0m Hello \n");
        printf("\033[4;30;41m color!!! \033[0m Hello \n");
        printf("\033[5;30;41m color!!! \033[0m Hello \n");
        printf("\033[7;30;41m color!!! \033[0m Hello \n");
        printf("\033[8;30;41m color!!! \033[0m Hello \n");

        printf("************************* \n");
        printf("\033[0;30;41m color!!! \033[0m Hello \n");
        printf("\033[0;31;41m color!!! \033[0m Hello \n");
        printf("\033[0;32;41m color!!! \033[0m Hello \n");
        printf("\033[0;33;41m color!!! \033[0m Hello \n");
        printf("\033[0;34;41m color!!! \033[0m Hello \n");
        printf("\033[0;35;41m color!!! \033[0m Hello \n");
        printf("\033[0;36;41m color!!! \033[0m Hello \n");
        printf("\033[0;37;41m color!!! \033[0m Hello \n");

        printf("************************* \n");
        printf("\033[0;30;40m color!!! \033[0m Hello \n");
        printf("\033[0;30;41m color!!! \033[0m Hello \n");
        printf("\033[0;30;42m color!!! \033[0m Hello \n");
        printf("\033[0;30;43m color!!! \033[0m Hello \n");
        printf("\033[0;30;44m color!!! \033[0m Hello \n");
        printf("\033[0;30;45m color!!! \033[0m Hello \n");
        printf("\033[0;30;46m color!!! \033[0m Hello \n");
        printf("\033[0;30;47m color!!! \033[0m Hello \n");

        sleep(100);
    }
    return 0;
}
```
编译运行：
```
[root@localhost C_Test]# gcc terminalColor.c -o terminalColor.out
[root@localhost C_Test]# ./terminalColor.out 
************************* 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
************************* 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
************************* 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
 color!!!  Hello 
```
显示效果：
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Programming/Linux/CLanguage/TerminalEscapeSequence/2.png)

# 参考资料
[https://blog.csdn.net/u014470361/article/details/81512330](https://blog.csdn.net/u014470361/article/details/81512330)
<!-- Programming/Linux/CLanguage/TerminalEscapeSequence/ -->
<!-- Programming/Linux/CLanguage/TerminalEscapeSequence/ -->
<!-- Programming/Linux/CLanguage/TerminalEscapeSequence/ -->
<!-- Programming/Linux/CLanguage/TerminalEscapeSequence/ -->
