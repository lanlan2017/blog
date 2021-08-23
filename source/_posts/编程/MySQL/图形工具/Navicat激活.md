---
title: Navicat激活
categories: 
  - 编程
  - MySQL
  - 图形工具
date: 2019-11-23 15:47:40
updated: 2021-03-20 10:19:52
abbrlink: 30dba46d
---
# 下载需要的破解程序

# 生成秘钥文件
先运行`navicat-patcher.exe`这个程序
## navicat-patcher.exe帮助文档
```
PS D:\Desktop\PuoJie> .\navicat-patcher.exe
***************************************************
*       Navicat Patcher by @DoubleLabyrinth       *
*                  Version: 4.1                   *
***************************************************

Usage:
    navicat-patcher.exe [-dry-run] <Navicat Installation Path> [RSA-2048 PEM File Path]

    [-dry-run]                   Run patcher without applying any patches.
                                 This parameter is optional.

    <Navicat Installation Path>  The folder path where Navicat is installed.
                                 This parameter must be specified.

    [RSA-2048 PEM File Path]     The path to an RSA-2048 private key file.
                                 This parameter is optional.
                                 If not specified, an RSA-2048 private key file
                                 named "RegPrivateKey.pem" will be generated.

Example:
    navicat-patcher.exe "C:\Program Files\PremiumSoft\Navicat Premium 12"
PS D:\Desktop\PuoJie>
```
所以要执行如下命令：
```
navicat-patcher.exe "Navicat安装路径"
```
我的命令如下：
```
navicat-patcher.exe "F:\Program Files\PremiumSoft\Navicat Premium 12"
```

## 命令运行过程

<pre>
D:\Desktop\PuoJie&gt;navicat-patcher.exe "F:\Program Files\PremiumSoft\Navicat Premium 12"
***************************************************
*       Navicat Patcher by @DoubleLabyrinth       *
*                  Version: 4.1                   *
***************************************************

Press Enter to continue or Ctrl + C to abort.

[+] Try to open Navicat.exe ... Ok!
[+] Try to open libcc.dll ... Ok!

[+] PatchSolution0 ...... Ready to apply
    [*] Patch offset = +0x029bd6d8
[+] PatchSolution1 ...... Ready to apply
    [*] [0] Patch offset = +0x0220aa60
    [*] [1] Patch offset = +0x0074c749
...... 这里省略了一大串的输出
    [*] [109] Instruction RVA = 0x016637f8, Patch Offset = +0x01662bfc
    [*] [110] Instruction RVA = 0x016637fe, Patch Offset = +0x01662c01
[-] PatchSolution4 ...... Omitted

[*] PatchSolution0 is suppressed in order to keep digital signature valid.

[?] Previous backup F:\Program Files\PremiumSoft\Navicat Premium 12\libcc.dll.backup detected. Delete? (y/n)
</pre>

然后输入`y`

<pre>
[*] Generating new RSA private key, it may take a long time...
[*] Your RSA public key:
...... 这里省略了一大串的输出
[*] +01662bfc: 51 41 ---&gt; 51 41
[*] +01662c01: 42 ---&gt; 42

[*] New RSA-2048 private key has been saved to
<mark>D:\Desktop\PuoJie\RegPrivateKey.pe</mark>m

*******************************************************
*           PATCH HAS BEEN DONE SUCCESSFULLY!         *
*                  HAVE FUN AND ENJOY~                *
*******************************************************
</pre>

可以看到命令在当前目录(`D:\Desktop\PuoJie`)下生成`RegPrivateKey.pem`这个文件.（`D:\Desktop\PuoJie\RegPrivateKey.pem`）
# 使用上面生成的秘钥文件破解
## navicat-keygen.exe帮助文档
```
PS D:\Desktop\PuoJie> .\navicat-keygen.exe
***************************************************
*       Navicat Keygen by @DoubleLabyrinth        *
*                   Version: 4.0                  *
***************************************************

Usage:
    navicat-keygen.exe <-bin|-text> [-adv] <RSA-2048 Private Key File>

    <-bin|-text>       Specify "-bin" to generate "license_file" used by Navicat 11.
                       Specify "-text" to generate base64-encoded activation code.
                       This parameter must be specified.

    [-adv]             Enable advance mode.
                       This parameter is optional.

    <RSA-2048 Private Key File>    A path to an RSA-2048 private key file.
                                   This parameter must be specified.

Example:
    navicat-keygen.exe -text .\RegPrivateKey.pem
PS D:\Desktop\PuoJie>
```
所以我的命令如下：
```cmd
navicat-keygen.exe -text .\RegPrivateKey.pem
```
## 选择要破解的程序和版本
我用的是`Premium 12.1` `中文版`,所以
- 先输入1,
- 然后输入1

这样就得到了一个`序列号`
```cmd
G:\Desktop\PuoJie>navicat-keygen.exe -text .\RegPrivateKey.pem
***************************************************
*       Navicat Keygen by @DoubleLabyrinth        *
*                   Version: 4.0                  *
***************************************************

[*] Select Navicat product:
 0. DataModeler
 1. Premium
 2. MySQL
 3. PostgreSQL
 4. Oracle
 5. SQLServer
 6. SQLite
 7. MariaDB
 8. MongoDB
 9. ReportViewer

(Input index)> 1

[*] Select product language:
 0. English
 1. Simplified Chinese
 2. Traditional Chinese
 3. Japanese
 4. Polish
 5. Spanish
 6. French
 7. German
 8. Korean
 9. Russian
 10. Portuguese

(Input index)> 1

[*] Input major version number:
(range: 0 ~ 15, default: 12)> 12

[*] Serial number:
NAVN-6XZI-FK3F-NU44
```
## 复制序列号 断开网络 打开Navicat 手动激活
复制生成的这个`序列号`,接下**断开网络**,打开`navicat`,点`帮助`,`注册`,然后输入`序列号`,选择`手动激活`,这样会得`一大串字符串`（这里我命名为邀请码）:
```
bz6Pp8T7/4kXP8UZ2uJ9XUKvy6xP8G3mhe1ZSOOAznS7sVRzjGNiTvyiUuNFtPq5++KQXBgtpT62pKEU8SzKwtPfpwfpE2Gck5GW8IkY7v025AIvAE0kgk6c
4th+L2GvMRtOX4D9kqzGyh0Pz8ywrwOGlotN72MNWkpWNbhI8+rM8qvTNYkMkM4XBl4b1marLMIsKFDWZSb0tZ5yoWTiqBa3qWyM/ewHeY3TW4hxXLHqK3+H
md1ATOn4RKMgNiNk2fN2YyQ5beHB06U13TT+HKUoTIZC56+rGXaQOHfo+tshBuc929/KqgzsiGY9dkupJ2PIgdUwh8pw0oxEXCNyug==
```
## 复制邀请码 生成注册码
复制这一大串字符串.
然后,回到cmd中,继续输入`用户名`和`组织`,接着`粘贴`刚才复制的,按下`两次回车`,这样就生成了`注册码`:
```cmd
[*] Your name: lan
[*] Your organization: lan
[*] Input request code in Base64: (Input empty line to end)
bz6Pp8T7/4kXP8UZ2uJ9XUKvy6xP8G3mhe1ZSOOAznS7sVRzjGNiTvyiUuNFtPq5++KQXBgtpT62pKEU8SzKwtPfpwfpE2Gck5GW8IkY7v025AIvAE0kgk6c
4th+L2GvMRtOX4D9kqzGyh0Pz8ywrwOGlotN72MNWkpWNbhI8+rM8qvTNYkMkM4XBl4b1marLMIsKFDWZSb0tZ5yoWTiqBa3qWyM/ewHeY3TW4hxXLHqK3+H
md1ATOn4RKMgNiNk2fN2YyQ5beHB06U13TT+HKUoTIZC56+rGXaQOHfo+tshBuc929/KqgzsiGY9dkupJ2PIgdUwh8pw0oxEXCNyug==
[*] Request Info:
{"K":"NAVN6XZIFK3FNU44", "DI":"+th07Jntcvd3RIb9CnhQ", "P":"WIN"}
[*] Response Info:
{"K":"NAVN6XZIFK3FNU44","DI":"+th07Jntcvd3RIb9CnhQ","N":"lan","O":"lan","T":1574497681}
[*] Activation Code:
mWO8nXhK31HFTR4PJpea/2v0oeHNmBwSfmSjbb42ZhuqQRuj4Zqq+FjnXYAIp60OgI/L9JFUjrEb6u7AXFarVDJzVLYiGPIacD0uUVG+azHE86FKh4VyekxO
RKtHivokjqq6v+owtonQrOalF60FN/Xe8+8DBTObaIEIT3FGvIsIvoSDEv4KnxywQASDTL0c0L23rukCtbSngJ47CoAtYOejBWgFsbH+ATAPPyJZqxkRp8C7
F2uob7A8rMPkQU7bR+Jc7KIzok1JqvSraH3eBo+ZgNUyFQm0afSYBeJ7jEkD9u/Ns+qHc4X197y4L7XHi3gybdBPc+hvU91WmzHSKA==
```
## 复制注册码 回到Navicat，粘贴注册码
复制生成的这串字符串:
```
mWO8nXhK31HFTR4PJpea/2v0oeHNmBwSfmSjbb42ZhuqQRuj4Zqq+FjnXYAIp60OgI/L9JFUjrEb6u7AXFarVDJzVLYiGPIacD0uUVG+azHE86FKh4VyekxO
RKtHivokjqq6v+owtonQrOalF60FN/Xe8+8DBTObaIEIT3FGvIsIvoSDEv4KnxywQASDTL0c0L23rukCtbSngJ47CoAtYOejBWgFsbH+ATAPPyJZqxkRp8C7
F2uob7A8rMPkQU7bR+Jc7KIzok1JqvSraH3eBo+ZgNUyFQm0afSYBeJ7jEkD9u/Ns+qHc4X197y4L7XHi3gybdBPc+hvU91WmzHSKA==
```
粘贴到`Navicat`上的注册码输入框，就可以。
# 参考资料
[https://github.com/DoubleLabyrinth/navicat-keygen/blob/windows/doc/how-to-use.windows.zh-CN.md](https://github.com/DoubleLabyrinth/navicat-keygen/blob/windows/doc/how-to-use.windows.zh-CN.md)
