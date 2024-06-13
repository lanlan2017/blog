---
title: Scrcpy.exe命令详解
categories:
  - Windows
  - 软件
  - 远程控制
abbrlink: e280fb30
date: 2022-05-05 15:06:08
updated: 2022-05-05 15:06:08
---
# Scrcpy.exe命令详解
- 指定连接到192.168.10.4:5555的手机
- 启动镜像时关闭手机屏幕
- 进制手机休眠
- 镜像最大高度为768
- 镜像标题设置为xxx
- 镜像永远置顶

```
scrcpy.exe -s 192.168.10.4:5555 --turn-screen-off --stay-awake -m 768 --window-title xxx --always-on-top
```
<!-- more -->
## 帮助文档
### scrcpy --help
```
D:\Desktop\test\CMD\phone>scrcpy --help
Usage: scrcpy [options]

Options:

    --always-on-top
        Make scrcpy window always on top (above other windows).

    -b, --bit-rate value
        Encode the video at the given bit-rate, expressed in bits/s.
        Unit suffixes are supported: 'K' (x1000) and 'M' (x1000000).
        Default is 8000000.

    --codec-options key[:type]=value[,...]
        Set a list of comma-separated key:type=value options for the
        device encoder.
        The possible values for 'type' are 'int' (default), 'long',
        'float' and 'string'.
        The list of possible codec options is available in the
        Android documentation:
        <https://d.android.com/reference/android/media/MediaFormat>

    --crop width:height:x:y
        Crop the device screen on the server.
        The values are expressed in the device natural orientation
        (typically, portrait for a phone, landscape for a tablet).
        Any --max-size value is computed on the cropped size.

    --disable-screensaver
        Disable screensaver while scrcpy is running.

    --display id
        Specify the display id to mirror.

        The list of possible display ids can be listed by:
            adb shell dumpsys display
        (search "mDisplayId=" in the output)

        Default is 0.

    --encoder name
        Use a specific MediaCodec encoder (must be a H.264 encoder).

    --force-adb-forward
        Do not attempt to use "adb reverse" to connect to the
        the device.

    --forward-all-clicks
        By default, right-click triggers BACK (or POWER on) and
        middle-click triggers HOME. This option disables these
        shortcuts and forward the clicks to the device instead.

    -f, --fullscreen
        Start in fullscreen.

    -h, --help
        Print this help.

    --legacy-paste
        Inject computer clipboard text as a sequence of key events
        on Ctrl+v (like MOD+Shift+v).
        This is a workaround for some devices not behaving as
        expected when setting the device clipboard programmatically.

    --lock-video-orientation [value]
        Lock video orientation to value.
        Possible values are "unlocked", "initial" (locked to the
        initial orientation), 0, 1, 2 and 3.
        Natural device orientation is 0, and each increment adds a
        90 degrees rotation counterclockwise.
        Default is "unlocked".
        Passing the option without argument is equivalent to passing
        "initial".

    --max-fps value
        Limit the frame rate of screen capture (officially supported
        since Android 10, but may work on earlier versions).

    -m, --max-size value
        Limit both the width and height of the video to value. The
        other dimension is computed so that the device aspect-ratio
        is preserved.
        Default is 0 (unlimited).

    -n, --no-control
        Disable device control (mirror the device in read-only).

    -N, --no-display
        Do not display device (only when screen recording is
        enabled).

    --no-key-repeat
        Do not forward repeated key events when a key is held down.

    --no-mipmaps
        If the renderer is OpenGL 3.0+ or OpenGL ES 2.0+, then
        mipmaps are automatically generated to improve downscaling
        quality. This option disables the generation of mipmaps.

    -p, --port port[:port]
        Set the TCP port (range) used by the client to listen.
        Default is 27183:27199.

    --prefer-text
        Inject alpha characters and space as text events instead of
        key events.
        This avoids issues when combining multiple keys to enter a
        special character, but breaks the expected behavior of alpha
        keys in games (typically WASD).

    --push-target path
        Set the target directory for pushing files to the device by
        drag & drop. It is passed as-is to "adb push".
        Default is "/sdcard/Download/".

    -r, --record file.mp4
        Record screen to file.
        The format is determined by the --record-format option if
        set, or by the file extension (.mp4 or .mkv).

    --record-format format
        Force recording format (either mp4 or mkv).

    --render-driver name
        Request SDL to use the given render driver (this is just a
        hint).
        Supported names are currently "direct3d", "opengl",
        "opengles2", "opengles", "metal" and "software".
        <https://wiki.libsdl.org/SDL_HINT_RENDER_DRIVER>

    --rotation value
        Set the initial display rotation.
        Possibles values are 0, 1, 2 and 3. Each increment adds a 90
        degrees rotation counterclockwise.

    -s, --serial serial
        The device serial number. Mandatory only if several devices
        are connected to adb.

    --shortcut-mod key[+...]][,...]
        Specify the modifiers to use for scrcpy shortcuts.
        Possible keys are "lctrl", "rctrl", "lalt", "ralt",
        "lsuper" and "rsuper".

        A shortcut can consist in several keys, separated by '+'.
        Several shortcuts can be specified, separated by ','.

        For example, to use either LCtrl+LAlt or LSuper for scrcpy
        shortcuts, pass "lctrl+lalt,lsuper".

        Default is "lalt,lsuper" (left-Alt or left-Super).

    -S, --turn-screen-off
        Turn the device screen off immediately.

    -t, --show-touches
        Enable "show touches" on start, restore the initial value
        on exit.
        It only shows physical touches (not clicks from scrcpy).

    -V, --verbosity value
        Set the log level (verbose, debug, info, warn or error).
        Default is info.

    -v, --version
        Print the version of scrcpy.

    -w, --stay-awake
        Keep the device on while scrcpy is running, when the device
        is plugged in.

    --window-borderless
        Disable window decorations (display borderless window).

    --window-title text
        Set a custom window title.

    --window-x value
        Set the initial window horizontal position.
        Default is "auto".

    --window-y value
        Set the initial window vertical position.
        Default is "auto".

    --window-width value
        Set the initial window width.
        Default is 0 (automatic).

    --window-height value
        Set the initial window height.
        Default is 0 (automatic).

Shortcuts:

    In the following list, MOD is the shortcut modifier. By default,
    it's (left) Alt or (left) Super, but it can be configured by
    --shortcut-mod (see above).

    MOD+f
        Switch fullscreen mode

    MOD+Left
        Rotate display left

    MOD+Right
        Rotate display right

    MOD+g
        Resize window to 1:1 (pixel-perfect)

    MOD+w
    Double-click on black borders
        Resize window to remove black borders

    MOD+h
    Middle-click
        Click on HOME

    MOD+b
    MOD+Backspace
    Right-click (when screen is on)
        Click on BACK

    MOD+s
        Click on APP_SWITCH

    MOD+m
        Click on MENU

    MOD+Up
        Click on VOLUME_UP

    MOD+Down
        Click on VOLUME_DOWN

    MOD+p
        Click on POWER (turn screen on/off)

    Right-click (when screen is off)
        Power on

    MOD+o
        Turn device screen off (keep mirroring)

    MOD+Shift+o
        Turn device screen on

    MOD+r
        Rotate device screen

    MOD+n
        Expand notification panel

    MOD+Shift+n
        Collapse notification panel

    MOD+c
        Copy to clipboard (inject COPY keycode, Android >= 7 only)

    MOD+x
        Cut to clipboard (inject CUT keycode, Android >= 7 only)

    MOD+v
        Copy computer clipboard to device, then paste (inject PASTE
        keycode, Android >= 7 only)

    MOD+Shift+v
        Inject computer clipboard text as a sequence of key events

    MOD+i
        Enable/disable FPS counter (print frames/second in logs)

    Ctrl+click-and-move
        Pinch-to-zoom from the center of the screen

    Drag & drop APK file
        Install APK from computer


D:\Desktop\test\CMD\phone>
```
### tldr scrcpy
```
D:\Desktop\test\CMD\phone>tldr scrcpy

  scrcpy

  Display and control your Android device on a desktop.
  More information: https://github.com/Genymobile/scrcpy.

  - Display a mirror of a connected device:
    scrcpy

  - Display a mirror of a specific device based on its ID or IP address (find it under the adb devices command):
    scrcpy --serial 0123456789abcdef|192.168.0.1:5555

  - Start display in fullscreen mode:
    scrcpy --fullscreen

  - Rotate the display screen. Each incremental value adds a 90 degree counterclockwise rotation:
    scrcpy --rotation 0|1|2|3

  - Show touches on physical device:
    scrcpy --show-touches

  - Record display screen:
    scrcpy --record path/to/file.mp4

  - Set target directory for pushing files to device by drag and drop (non-APK):
    scrcpy --push-target path/to/directory
```
## 减少尺寸
将Android设备镜像成低分辨率是很有用的，可以提高性能
将宽度和高度限制为某个值 (例如1024)
```
scrcpy --max-size 1024
```

简写版本：
```
scrcpy -m 1024
```
该命令将手机镜像的高度限制为1024，手机镜像的宽度则 通过镜像高度和手机高度的比例 来计算。，例如 1920×1080的手机，镜像为1024×576。
## 改变码率
默认的比特率是8mbps，改变视频比特率 (例如:2mbps)
```
scrcpy --bit-rate 2M
```
简写：
```
scrcpy -b 2M
```
## 限制帧率
捕获帧速率限制为15：
```
scrcpy --max-fps 15
```
## 录屏
可以在镜像时录屏
```
scrcpy --record file.mp4
```
```
scrcpy -r file.mkv
```
## 多设备
如果adb设备中列出了多个设备，则必须指定序列
```
scrcpy --serial 0123456789abcdef
```
简写：
```
scrcpy -s 0123456789abcdef
```
如果设备通过TCP/IP连接
```
scrcpy --serial 192.168.0.1:5555
```
简写：
```
scrcpy -s 192.168.0.1:5555
```
## 镜像窗体配置
### 镜像窗体标题
默认情况下，窗口标题是设备模型，它是可以改变的
```
scrcpy --window-title 'phone1'
```
### 窗口初始位置和大小
可以指定窗口初始位置和大小
```
scrcpy --window-x 100 --window-y 100 --window-width 800 --window-height 600
```
### 禁用窗口装饰
```
scrcpy --window-borderless
```
### 总是置顶
保持scrcpy窗口总是在顶部
```
scrcpy --always-on-top
```
### 全屏
启动镜像是全屏显示：
```
scrcpy --fullscreen
```
简写：
```
scrcpy -f
```
## 禁止交互
禁用与设备交互，如输入键、鼠标事件、拖放文件)
```
scrcpy --no-control
```
简写：
```
scrcpy -n
```
## 多显示器
如果有多个显示器可用，可以选择要镜像的显示器
```
scrcpy --display 1
```
可以检索显示id列表

## 打开镜像时关闭手机屏幕
```
scrcpy --turn-screen-off
```
简写：
```
scrcpy -S
```
或在任何时候按 Ctrl + o快捷键来关闭手机屏幕。

关闭手机屏幕后，如果想点亮手机屏幕
可以按 Ctrl + Shift + o (或者 POWER, Ctrl + p) 恢复

## 防止手机休眠
```
scrcpy --stay-awake
```
简写：
```
scrcpy -Sw
```
## 旋转设备的屏幕
按 Ctrl + r 在纵向和横向模式之间切换
注意，它只在前台应用程序支持所请求的方向时才旋转

## 同步剪贴板
可以在计算机和设备之间双向同步剪贴板
Ctrl + c 将设备剪贴板复制到计算机剪贴板
Ctrl + Shift + v 将电脑剪贴板复制到设备剪贴板(如果设备运行Android >= 7则粘贴)
Ctrl + v 将计算机剪贴板粘贴为文本事件序列

此外，每当Android剪贴板发生变化时，它都会自动同步到计算机剪贴板

## 文件拖动
### 安装APK
将APK文件(以.apk结尾)拖放到scrcpy窗口即可将apk安装到手机。
### 传输文件到手机
请将一个(非apk)文件拖放到scrcpy窗口，文件会推送到设备上的 /sdcard/。
#### 更改手机接收文件的目录
可以在启动时更改推送的目标目录：
```
scrcpy --push-target /sdcard/foo/bar/
```
## 快捷键


# 参考资料
https://www.jianshu.com/p/0f24ab1b9fbe
https://www.cnblogs.com/schips/p/using_scrcpy_debug_android.html