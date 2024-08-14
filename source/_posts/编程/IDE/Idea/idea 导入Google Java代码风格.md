---
title: idea 导入Google Java代码风格
categories:
  - 编程
  - IDE
  - Idea
abbrlink: 1da62673
date: 2024-08-05 14:57:00
updated: 2024-08-05 14:57:00
---
## 下载Google Java代码风格xml文件

克隆仓库 <https://github.com/google/styleguide> 到本地。

```cmd
git clone https://github.com/google/styleguide.git
```

## idea导入代码模板xml文件

依次打开 Setting，Editor，Code Style，Java。

然后点击，右侧Scheme下拉选择框后面的齿轮按钮。

然后选择 Import Scheme，然后选择 Intellij IDEA code style XML。

在弹出的文件对话框中，找到之前克隆到本地的codestyle项目根目录下的intellij-java-google-style.xml文件，导入。

在弹出的对话框中给导入的这个模板输入一个名称。

## 使用导入的xml模板

选择刚才导入的模板，应用即可。
