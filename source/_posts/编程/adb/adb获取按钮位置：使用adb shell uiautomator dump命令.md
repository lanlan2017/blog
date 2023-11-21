---
title: adb获取按钮位置：使用adb shell uiautomator dump命令
categories:
  - 编程
  - adb
abbrlink: 48696dcf
date: 2023-09-26 17:22:58
updated: 2023-09-26 17:24:17
---
# 前言
## 需求
**使用adb命令点击屏幕上的某个按钮**

## adb在屏幕的指定坐标上点击
如果我们知道按钮的坐标`[x,y]`的话，使用`adb shell input tap x y`命令可Android设备屏幕上的x,y坐标上点击。

## 如何获取要点击的按钮的坐标
答案就是使用`adb shell uiautomator dump`先分析当前activity的UI，然后在命令生成的xml文件中找到要点击的按钮的坐标x,y。

有了坐标之后，再使用adb shell input tap x y进行点击即可。

# 示例

## adb shell uiautomator dump
```
adb shell uiautomator dump
```
命令会在Android设备上生成一个xml文件：
```
G:\dev2\idea_workspace\MyJavaTools\runable>adb shell uiautomator dump
UI hierchary dumped to: /sdcard/window_dump.xml

G:\dev2\idea_workspace\MyJavaTools\runable>
```
## 从Android上复制xml文件到电脑上
使用adb pull命令从Android中复制文件到电脑上：
```
adb pull /sdcard/window_dump.xml D:\Desktop\test\获取activity按钮位置
```
复制成功效果：
```
G:\dev2\idea_workspace\MyJavaTools\runable>adb pull /sdcard/window_dump.xml D:\Desktop\test\获取activity按钮位置
/sdcard/window_dump.xml: 1 file pulled...pped. 2.2 MB/s (22056 bytes in 0.010s)

G:\dev2\idea_workspace\MyJavaTools\runable>
```
## 分析xml文件
在电脑上用vscode打开这个xml文件。按Ctrl+F，打开查找，在搜索框中输入要点击的按钮的文字。一般这个时候就能找到这个按钮对应的标签。

### 获取按钮的bounds属性

查找文字为"反馈"的按钮：
```xml
<node index="0" text="" resource-id="com.byted.pangle:id/tt_top_area" class="android.widget.LinearLayout" package="com.xk.qreader" content-desc="" checkable="false" checked="false" clickable="false" enabled="true" focusable="false" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[0,0][1080,144]">
                                            <node index="0" text="" resource-id="" class="android.widget.FrameLayout" package="com.xk.qreader" content-desc="" checkable="false" checked="false" clickable="false" enabled="true" focusable="false" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[0,0][936,144]">
                                                <node index="0" text="反馈" resource-id="com.byted.pangle:id/tt_top_dislike" class="android.widget.TextView" package="com.xk.qreader" content-desc="" checkable="false" checked="false" clickable="true" enabled="true" focusable="true" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[720,60][888,144]" /></node>
                                            <node NAF="true" index="1" text="" resource-id="com.byted.pangle:id/tt_reward_full_count_down" class="android.widget.LinearLayout" package="com.xk.qreader" content-desc="" checkable="false" checked="false" clickable="true" enabled="true" focusable="true" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[936,60][1032,144]">
                                                <node NAF="true" index="0" text="" resource-id="com.byted.pangle:id/tt_reward_full_count_down_after" class="android.widget.LinearLayout" package="com.xk.qreader" content-desc="" checkable="false" checked="false" clickable="true" enabled="true" focusable="true" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[966,84][1002,120]">
                                                    <node index="0" text="" resource-id="com.byted.pangle:id/tt_reward_full_count_down_after_close" class="android.widget.ImageView" package="com.xk.qreader" content-desc="" checkable="false" checked="false" clickable="false" enabled="true" focusable="false" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[966,84][1002,120]" /></node>
                                            </node>
                                        </node>
```
这条标签的内容如下：
```xml
<node index="0" text="反馈" resource-id="com.byted.pangle:id/tt_top_dislike" class="android.widget.TextView" package="com.xk.qreader" content-desc="" checkable="false" checked="false" clickable="true" enabled="true" focusable="true" focused="false" scrollable="false" long-clickable="false" password="false" selected="false" bounds="[720,60][888,144]" /></node>
```
标签中的信息很多，我们需要的信息在这条标签的末尾bounds属性：`bounds="[720,60][888,144]"`

这表示"反馈"按钮占据的矩形的左上角的坐标为：`[720,60]`，右下角的坐标为`[888,144]`;

### 计算中点的坐标
有了两个坐标点之后，我们计算出中点的坐标。得到`x=888.0, y=144.0`；
### adb命令点击按钮的中点坐标

得到按钮的中点坐标之后，就可以使用adb命令进行点击了：
```
adb shell input tap 804.0 102.0
```

# 参考资料
https://blog.csdn.net/growing_tree/article/details/110606365

## 文心一言 回答

问：

adb如何获取顶部activity中的按钮的位置

> 答：
> 要在Android Debug Bridge (ADB)中获取顶部Activity中的按钮位置，你需要使用ADB的命令行工具并结合Android设备的屏幕坐标系统。以下是获取顶部Activity中按钮位置的一般步骤：
> 1. 确保你的Android设备已连接到计算机，并已启用开发者选项和USB调试模式。在设备上打开开发者选项，然后启用USB调试模式。
> 2. 打开终端或命令提示符，导航到ADB的安装目录。
> 3. 运行以下命令来查看当前连接的Android设备列表：
> ```
> adb devices
> ```
> 确保你的设备显示在列表中。
> 4. 获取顶部Activity的焦点。你可以使用以下命令将焦点切换到顶部Activity：
> ```cmd
> adb shell dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp'
> ```
> 这将显示当前具有焦点的Activity的相关信息。
> 5. 找到你想要获取位置的按钮的视图ID。你可以使用以下命令来获取当前Activity的布局层次结构：
> ```cmd
> adb shell uiautomator dump
> ```
> 这将生成一个XML文件，其中包含当前Activity的布局层次结构信息。你可以在计算机上找到这个XML文件，通常位于`/sdcard/window_dump.xml`。
> 6. 在XML文件中找到你想要获取位置的按钮的视图ID。你可以使用文本编辑器或XML解析器来打开XML文件，并查找包含按钮的视图ID。通常，视图ID的格式为`@id/button_id`。
> 7. 使用以下命令来获取按钮的位置：
> ```php
> adb shell uiautomator dump | grep -E 'viewId=.*button_id'
> ```
> 将`button_id`替换为你在步骤6中找到的按钮视图ID。这将显示包含按钮位置的相关信息。
> 8. 从输出结果中提取按钮的位置信息。你可以查找包含`bounds`或`location`的行，这些行将提供按钮的位置坐标。通常，你会看到类似以下的输出：
> ```php
> viewId=com.example.app:id/button_id bounds=[0, 0][100, 50]
> ```
> 这表示按钮的左上角坐标为(0, 0)，右下角坐标为(100, 50)。你可以根据需要提取这些坐标值。
> 请注意，这些步骤假设你已经连接到Android设备并具有适当的权限来执行ADB命令。此外，由于Android设备和应用程序的布局可能有所不同，因此你可能需要根据实际情况进行适当的调整。