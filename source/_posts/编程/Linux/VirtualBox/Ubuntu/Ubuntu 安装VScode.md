---
title: Ubuntu 安装VScode
categories: 
  - 编程
  - Linux
  - VirtualBox
  - Ubuntu
date: 2019-11-25 15:38:46
updated: 2021-03-20 10:16:42
abbrlink: '65863024'
---
# Ubuntu 安装Vscode
## 下载.deb文件
进入[vscode下载地址](https://code.visualstudio.com/Download),点击`.deb`按钮,下载`.deb`文件。
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Linux/Ubuntu/instatll/vscode/1.png)
## 点击.deb文件安装
然后点击`.deb`文件即可安装
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Linux/Ubuntu/instatll/vscode/3.png)

## 命令安装
通过如下命令可以安装程序:
```shell
sudo dpkg -i 
```
例如:
```shell
sudo dpkg -i code_1.40.1-1573664190_amd64.deb 
```
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Linux/Ubuntu/instatll/vscode/4.png)
## 安装成功效果
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Linux/Ubuntu/instatll/vscode/5.png)

## vscode配置
### 安装中问语言包
在插件搜索框中输入:
```
chinese
```
然后选择安装中问语言包即可.
### 在桌面创建VScode快捷方式
#### 手动创建
打开**文件**
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Linux/Ubuntu/instatll/vscode/6.png)
然后进入根目录
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Linux/Ubuntu/instatll/vscode/7.png)
然后进入如下目录:
```shell
/usr/share/applications
```
然后就可以看到VScode的快捷方式了,`复制`,然后`粘贴`到桌面即可.
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Ubuntu/instatll/vscode/8.png)
双击这个快捷方式,然后会弹出一个窗口,点击`信任`即可。
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Ubuntu/instatll/vscode/9.png)
效果如下:
![图片](https://raw.githubusercontent.com/lanlan2017/images/master/Ubuntu/instatll/vscode/10.png)
#### 命令创建
复制快捷方式:
```shell
cd ~/桌面
cp /usr/share/applications/code.desktop ~/桌面
```
添加执行权限:
```shell
ls -al code.desktop
chmod +x code.desktop
ls -al code.desktop
```
运行VScode:
```shell
code
```


