---
title: 如何查看PowerShell版本
categories:
  - Windows
  - CMD
abbrlink: 9945f96b
date: 2022-05-06 21:08:52
updated: 2022-05-06 21:08:52
---
# 如何查看PowerShell版本
## $PSVersionTable
输入如下命令：
```
$PSVersionTable
```
<!-- more -->

```
PS C:\Users\HellloWorld> $PSVersionTable

Name                           Value
----                           -----
PSVersion                      5.1.19041.1
PSEdition                      Desktop
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
BuildVersion                   10.0.19041.1
CLRVersion                     4.0.30319.42000
WSManStackVersion              3.0
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1


PS C:\Users\HellloWorld>
```
打印的第一行PSVersion的value就是版本号，我这里是`5.1.19041.1`。

## 输入$host也可以查看
```
PS C:\Users\18190> $host


Name             : ConsoleHost
Version          : 5.1.19041.1
InstanceId       : 66a0ca53-b1ea-4161-bade-a9aa11e83a8f
UI               : System.Management.Automation.Internal.Host.InternalHostUserInterface
CurrentCulture   : zh-CN
CurrentUICulture : zh-CN
PrivateData      : Microsoft.PowerShell.ConsoleHost+ConsoleColorProxy
DebuggerEnabled  : True
IsRunspacePushed : False
Runspace         : System.Management.Automation.Runspaces.LocalRunspace



PS C:\Users\18190>
```
# 参考资料
https://blog.csdn.net/qq_40015157/article/details/112217153