---
title: VSCode 运行Java
categories: 
  - 编程
  - IDE
  - VSCode
date: 2019-07-06 22:11:24
updated: 2021-03-20 10:32:52
abbrlink: c8a8df16
---
# VSCode 运行Java
## 安装插件
依次点击`查看`,`扩展`,然后在搜索框中输入`Java Extension Pack`,然后安装这个插件,安装完毕后重启VSCode.
## 设置允许参数
打开要运行的`java`文件.然后点击`查看`,`调试`,点击`添加配置`,然后选择环境为`Java`,这个时候会生成一个`launch.json`的文件,如下所示:
```json
{
    // 使用 IntelliSense 了解相关属性。 
    // 悬停以查看现有属性的描述。
    // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "type": "java",
            "name": "Debug (Launch)-CollectionEach",
            "request": "launch",
            "cwd": "${workspaceFolder}",
            "console": "internalConsole",
            "stopOnEntry": false,
            "mainClass": "CollectionEach",
            "args": ""
        },
        {
            "type": "java",
            "name": "Debug (Launch)-ForeachTest",
            "request": "launch",
            "cwd": "${workspaceFolder}",
            "console": "internalConsole",
            "stopOnEntry": false,
            "mainClass": "ForeachTest",
            "args": ""
        },
        {
            "type": "java",
            "name": "Debug (Launch)-IntStreamTest",
            "request": "launch",
            "cwd": "${workspaceFolder}",
            "console": "internalConsole",
            "stopOnEntry": false,
            "mainClass": "IntStreamTest",
            "args": ""
        },
        {
            "type": "java",
            "name": "Debug (Attach)",
            "request": "attach",
            "hostName": "localhost",
            "port": 0
        }
    ]
}
```
其中每一项配置对应一个`java`文件.例如,`CollectionEach.java`对应的配置如下:
```json
{
    "type": "java",
    "name": "Debug (Launch)-CollectionEach",
    "request": "launch",
    "cwd": "${workspaceFolder}",
    "console": "internalConsole",
    "stopOnEntry": false,
    "mainClass": "CollectionEach",
    "args": ""
},
```
- 其中`mainClass`表示`main`方法所在的类名.
- `args`表示命令行参数.
- 其他配置我还不懂,先这样.

## 开始调试
`调试`各项功能,如下图所示:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/vscode/java/debug/1.png)
