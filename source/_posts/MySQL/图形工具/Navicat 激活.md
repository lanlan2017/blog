---
title: Navicat 激活
categories: 
  - MySQL
  - 图形工具
date: 2019-11-23 15:47:40
updated: 2019-11-24 00:13:47
abbrlink: 30dba46d
---
<div id='my_toc'>

- [Navicat激活](/blog/30dba46d/#Navicat激活)
    - [复制navicat安装路径](/blog/30dba46d/#复制navicat安装路径)
    - [执行命令](/blog/30dba46d/#执行命令)
        - [运行效果](/blog/30dba46d/#运行效果)
    - [再执行命令](/blog/30dba46d/#再执行命令)
        - [然后选择程序和版本](/blog/30dba46d/#然后选择程序和版本)
- [参考资料](/blog/30dba46d/#参考资料)

</div>
<!--more-->
<script>if (navigator.platform.toLowerCase() == 'win32'){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
# Navicat激活 #

## 复制navicat安装路径 ##
## 执行命令 ##
```cmd
navicat-patcher.exe "安装路径"
```
我的是
```cmd
navicat-patcher.exe "F:\Program Files\PremiumSoft\Navicat Premium 12"
```
### 运行效果 ###
```cmd
G:\Desktop\破解>navicat-patcher.exe "E:\dev2\PremiumSoft\Navicat Premium 12"
***************************************************
*       Navicat Patcher by @DoubleLabyrinth       *
*                  Version: 4.1                   *
***************************************************

Press Enter to continue or Ctrl + C to abort.

[+] Try to open Navicat.exe ... Ok!
[+] Try to open libcc.dll ... Ok!

[+] PatchSolution0 ...... Ready to apply
    [*] Patch offset = +0x029bd6d8
[-] PatchSolution1 ...... Omitted
[-] PatchSolution2 ...... Omitted
[-] PatchSolution3 ...... Omitted
[-] PatchSolution4 ...... Omitted


[*] Generating new RSA private key, it may take a long time...
[*] Your RSA public key:
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx9gWjlZE4Fmf6ucUenqk
pMlcvkCKRTYvtWD24esJFbr/plC++nHbxsW62ZhWTvwW1Qd/HwrwcYfpmloSbAuM
UQKqUDYH2Mln/6QefussY1y5wB/70k+gczjjKyx7F6VIzlOp5YjNVjhdyvAdodc6
OekJcYJ8yrQk6B5+id+ZtR5zTvpi31r2wlU7VaUBFa1zgFYkBui6b8++n4LUOEjA
ye3Qr4DG/XB5pSd2ov/Rr4AQwC3pKb3cIjFtuG4ydUAGlCmf85a4kbOPX1S6FqMV
WRFYsSiRPx0e6JC8ADS8x5VdVQS+8HpIoPVfsM3lzKJkxTgWkQ0M18qANqNIhduA
owIDAQAB
-----END PUBLIC KEY-----

*******************************************************
*                   PatchSolution0                    *
*******************************************************
[*] Previous:
+0x00000000029bd6d0                          2d 2d 2d 2d 2d 42 45 47          -----BEG
+0x00000000029bd6e0  49 4e 20 50 55 42 4c 49 43 20 4b 45 59 2d 2d 2d  IN PUBLIC KEY---
+0x00000000029bd6f0  2d 2d 0d 0a 4d 49 49 42 49 6a 41 4e 42 67 6b 71  --..MIIBIjANBgkq
+0x00000000029bd700  68 6b 69 47 39 77 30 42 41 51 45 46 41 41 4f 43  hkiG9w0BAQEFAAOC
+0x00000000029bd710  41 51 38 41 4d 49 49 42 43 67 4b 43 41 51 45 41  AQ8AMIIBCgKCAQEA
+0x00000000029bd720  77 31 64 71 46 33 53 6b 43 61 41 41 6d 4d 7a 73  w1dqF3SkCaAAmMzs
+0x00000000029bd730  38 38 39 49 0d 0a 71 64 57 39 4d 32 64 49 64 68  889I..qdW9M2dIdh
+0x00000000029bd740  33 6a 47 39 79 50 63 6d 4c 6e 6d 4a 69 47 70 42  3jG9yPcmLnmJiGpB
+0x00000000029bd750  46 34 45 39 56 48 53 4d 47 65 38 6f 50 41 79 32  F4E9VHSMGe8oPAy2
+0x00000000029bd760  6b 4a 44 6d 64 4e 74 34 42 63 45 79 67 76 73 73  kJDmdNt4BcEygvss
+0x00000000029bd770  45 66 67 69 6e 76 0d 0a 61 35 74 35 6a 6d 33 35  Efginv..a5t5jm35
+0x00000000029bd780  32 55 41 6f 44 6f 73 55 4a 6b 54 58 47 51 68 70  2UAoDosUJkTXGQhp
+0x00000000029bd790  41 57 4d 46 34 66 42 6d 42 70 4f 33 45 65 64 47  AWMF4fBmBpO3EedG
+0x00000000029bd7a0  36 32 72 4f 73 71 4d 42 67 6d 53 64 41 79 78 43  62rOsqMBgmSdAyxC
+0x00000000029bd7b0  53 50 42 52 4a 49 4f 46 0d 0a 52 30 51 67 5a 46  SPBRJIOF..R0QgZF
+0x00000000029bd7c0  62 52 6e 55 30 66 72 6a 33 34 66 69 56 6d 67 59  bRnU0frj34fiVmgY
+0x00000000029bd7d0  69 4c 75 5a 53 41 6d 49 62 73 38 5a 78 69 48 50  iLuZSAmIbs8ZxiHP
+0x00000000029bd7e0  64 70 31 6f 44 34 74 55 70 76 73 46 63 69 34 51  dp1oD4tUpvsFci4Q
+0x00000000029bd7f0  4a 74 59 4e 6a 4e 6e 47 55 32 0d 0a 57 50 48 36  JtYNjNnGU2..WPH6
+0x00000000029bd800  72 76 43 68 47 6c 31 49 52 4b 72 78 4d 74 71 4c  rvChGl1IRKrxMtqL
+0x00000000029bd810  69 65 6c 73 76 61 6a 55 6a 79 72 67 4f 43 36 4e  ielsvajUjyrgOC6N
+0x00000000029bd820  6d 79 6d 59 4d 76 5a 4e 45 52 33 68 74 46 45 74  mymYMvZNER3htFEt
+0x00000000029bd830  4c 31 65 51 62 43 79 54 66 44 6d 74 0d 0a 59 79  L1eQbCyTfDmt..Yy
+0x00000000029bd840  51 31 57 74 34 4f 74 31 32 6c 78 66 30 77 56 49  Q1Wt4Ot12lxf0wVI
+0x00000000029bd850  52 35 6d 63 47 4e 37 58 43 58 4a 52 48 4f 46 48  R5mcGN7XCXJRHOFH
+0x00000000029bd860  53 66 31 67 7a 58 57 61 62 52 53 76 6d 74 31 6e  Sf1gzXWabRSvmt1n
+0x00000000029bd870  72 6c 37 73 57 36 63 6a 78 6c 6a 75 75 51 0d 0a  rl7sW6cjxljuuQ..
+0x00000000029bd880  61 77 49 44 41 51 41 42 0d 0a 2d 2d 2d 2d 2d 45  awIDAQAB..-----E
+0x00000000029bd890  4e 44 20 50 55 42 4c 49 43 20 4b 45 59 2d 2d 2d  ND PUBLIC KEY---
+0x00000000029bd8a0  2d 2d 0d 0a                                      --..
[*] After:
+0x00000000029bd6d0                          2d 2d 2d 2d 2d 42 45 47          -----BEG
+0x00000000029bd6e0  49 4e 20 50 55 42 4c 49 43 20 4b 45 59 2d 2d 2d  IN PUBLIC KEY---
+0x00000000029bd6f0  2d 2d 0d 0a 4d 49 49 42 49 6a 41 4e 42 67 6b 71  --..MIIBIjANBgkq
+0x00000000029bd700  68 6b 69 47 39 77 30 42 41 51 45 46 41 41 4f 43  hkiG9w0BAQEFAAOC
+0x00000000029bd710  41 51 38 41 4d 49 49 42 43 67 4b 43 41 51 45 41  AQ8AMIIBCgKCAQEA
+0x00000000029bd720  78 39 67 57 6a 6c 5a 45 34 46 6d 66 36 75 63 55  x9gWjlZE4Fmf6ucU
+0x00000000029bd730  65 6e 71 6b 0d 0a 70 4d 6c 63 76 6b 43 4b 52 54  enqk..pMlcvkCKRT
+0x00000000029bd740  59 76 74 57 44 32 34 65 73 4a 46 62 72 2f 70 6c  YvtWD24esJFbr/pl
+0x00000000029bd750  43 2b 2b 6e 48 62 78 73 57 36 32 5a 68 57 54 76  C++nHbxsW62ZhWTv
+0x00000000029bd760  77 57 31 51 64 2f 48 77 72 77 63 59 66 70 6d 6c  wW1Qd/HwrwcYfpml
+0x00000000029bd770  6f 53 62 41 75 4d 0d 0a 55 51 4b 71 55 44 59 48  oSbAuM..UQKqUDYH
+0x00000000029bd780  32 4d 6c 6e 2f 36 51 65 66 75 73 73 59 31 79 35  2Mln/6QefussY1y5
+0x00000000029bd790  77 42 2f 37 30 6b 2b 67 63 7a 6a 6a 4b 79 78 37  wB/70k+gczjjKyx7
+0x00000000029bd7a0  46 36 56 49 7a 6c 4f 70 35 59 6a 4e 56 6a 68 64  F6VIzlOp5YjNVjhd
+0x00000000029bd7b0  79 76 41 64 6f 64 63 36 0d 0a 4f 65 6b 4a 63 59  yvAdodc6..OekJcY
+0x00000000029bd7c0  4a 38 79 72 51 6b 36 42 35 2b 69 64 2b 5a 74 52  J8yrQk6B5+id+ZtR
+0x00000000029bd7d0  35 7a 54 76 70 69 33 31 72 32 77 6c 55 37 56 61  5zTvpi31r2wlU7Va
+0x00000000029bd7e0  55 42 46 61 31 7a 67 46 59 6b 42 75 69 36 62 38  UBFa1zgFYkBui6b8
+0x00000000029bd7f0  2b 2b 6e 34 4c 55 4f 45 6a 41 0d 0a 79 65 33 51  ++n4LUOEjA..ye3Q
+0x00000000029bd800  72 34 44 47 2f 58 42 35 70 53 64 32 6f 76 2f 52  r4DG/XB5pSd2ov/R
+0x00000000029bd810  72 34 41 51 77 43 33 70 4b 62 33 63 49 6a 46 74  r4AQwC3pKb3cIjFt
+0x00000000029bd820  75 47 34 79 64 55 41 47 6c 43 6d 66 38 35 61 34  uG4ydUAGlCmf85a4
+0x00000000029bd830  6b 62 4f 50 58 31 53 36 46 71 4d 56 0d 0a 57 52  kbOPX1S6FqMV..WR
+0x00000000029bd840  46 59 73 53 69 52 50 78 30 65 36 4a 43 38 41 44  FYsSiRPx0e6JC8AD
+0x00000000029bd850  53 38 78 35 56 64 56 51 53 2b 38 48 70 49 6f 50  S8x5VdVQS+8HpIoP
+0x00000000029bd860  56 66 73 4d 33 6c 7a 4b 4a 6b 78 54 67 57 6b 51  VfsM3lzKJkxTgWkQ
+0x00000000029bd870  30 4d 31 38 71 41 4e 71 4e 49 68 64 75 41 0d 0a  0M18qANqNIhduA..
+0x00000000029bd880  6f 77 49 44 41 51 41 42 0d 0a 2d 2d 2d 2d 2d 45  owIDAQAB..-----E
+0x00000000029bd890  4e 44 20 50 55 42 4c 49 43 20 4b 45 59 2d 2d 2d  ND PUBLIC KEY---
+0x00000000029bd8a0  2d 2d 0d 0a                                      --..

[*] New RSA-2048 private key has been saved to
G:\Desktop\??\RegPrivateKey.pem

*******************************************************
*           PATCH HAS BEEN DONE SUCCESSFULLY!         *
*                  HAVE FUN AND ENJOY~                *
*******************************************************
```
这会再当前目录下生成`RegPrivateKey.pem`这个文件.
## 再执行命令 ##
```cmd
navicat-keygen.exe -text .\RegPrivateKey.pem
```
### 然后选择程序和版本 ###
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
复制序列号 
复制生成的这个`序列号`,接下断开网络,打开`navicat`,点`帮助`,`注册`,然后输入`序列号`,选择`手动激活`,这样会得`一大串字符串`:
```
bz6Pp8T7/4kXP8UZ2uJ9XUKvy6xP8G3mhe1ZSOOAznS7sVRzjGNiTvyiUuNFtPq5++KQXBgtpT62pKEU8SzKwtPfpwfpE2Gck5GW8IkY7v025AIvAE0kgk6c
4th+L2GvMRtOX4D9kqzGyh0Pz8ywrwOGlotN72MNWkpWNbhI8+rM8qvTNYkMkM4XBl4b1marLMIsKFDWZSb0tZ5yoWTiqBa3qWyM/ewHeY3TW4hxXLHqK3+H
md1ATOn4RKMgNiNk2fN2YyQ5beHB06U13TT+HKUoTIZC56+rGXaQOHfo+tshBuc929/KqgzsiGY9dkupJ2PIgdUwh8pw0oxEXCNyug==
```
复制这一大串字符串.
然后,回到程序中,继续输入`用户名`和`组织`,接着`粘贴`,按下`两次回车`,这样就生成了`注册码`:
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
复制生成的这串字符串:
```
mWO8nXhK31HFTR4PJpea/2v0oeHNmBwSfmSjbb42ZhuqQRuj4Zqq+FjnXYAIp60OgI/L9JFUjrEb6u7AXFarVDJzVLYiGPIacD0uUVG+azHE86FKh4VyekxO
RKtHivokjqq6v+owtonQrOalF60FN/Xe8+8DBTObaIEIT3FGvIsIvoSDEv4KnxywQASDTL0c0L23rukCtbSngJ47CoAtYOejBWgFsbH+ATAPPyJZqxkRp8C7
F2uob7A8rMPkQU7bR+Jc7KIzok1JqvSraH3eBo+ZgNUyFQm0afSYBeJ7jEkD9u/Ns+qHc4X197y4L7XHi3gybdBPc+hvU91WmzHSKA==
```
粘贴到`Navicat`上就可以。
# 参考资料 #
[https://github.com/DoubleLabyrinth/navicat-keygen/blob/windows/doc/how-to-use.windows.zh-CN.md](https://github.com/DoubleLabyrinth/navicat-keygen/blob/windows/doc/how-to-use.windows.zh-CN.md)
