---
title: HTML下划线
categories: 
  - HTML
  - 文本标签
abbrlink: 9f0a034b
date: 2019-02-13 00:23:30
updated: 2022-04-04 00:51:45
---
# CSS设置下划线与文字间距距离(CSS文字下划线距离设置)
##  使用CSS单词介绍
- padding-bottom——设置内容与对象下边框的距离
- border-bottom——设置对象下边边框

## 读音
|英文|读音|
|:--|:--|
|<a href="https://fanyi.baidu.com/?#en/zh/padding">padding</a>|<img src="/images/play.png" onclick="paly_audioID20181206120004();" class="shake-little" style="border: 0px;" title="点击播放">|
|<a href="https://fanyi.baidu.com/?#en/zh/border">border</a>|<img src="/images/play.png" onclick="paly_audioID20181206120033();" class="shake-little" style="border: 0px;" title="点击播放">|
|<a href="https://fanyi.baidu.com/?#en/zh/bottom">bottom</a>|<img src="/images/play.png" onclick="paly_audioID20181206120114();" class="shake-little" style="border: 0px;" title="点击播放">|

<audio src="https://fanyi.baidu.com/gettts?lan=en&text=bottom&spd=3&source=web" id="audioID20181206120114"></audio>
<script>
    function paly_audioID20181206120114() {var id = document.getElementById("audioID20181206120114");if (id != null) {id.play();}}
</script>
<audio src="https://fanyi.baidu.com/gettts?lan=en&text=border&spd=3&source=web" id="audioID20181206120033"></audio>
<script>
    function paly_audioID20181206120033() {var id = document.getElementById("audioID20181206120033");if (id != null) {id.play();}}
</script>
<audio src="https://fanyi.baidu.com/gettts?lan=en&text=padding&spd=3&source=web" id="audioID20181206120004"></audio>
<script>
    function paly_audioID20181206120004() {var id = document.getElementById("audioID20181206120004");if (id != null) {id.play();}}
</script>

# 实现过程
这里不是使用text-decoration下划线属性来实现的，而是使用底部边框属性border-bottom实现下划线一样效果，然后利用内底部边距padding-bottom设置下边框与文本的间距

# CSS底部边框实现下划线效果
这里还是使用HTML `<u>` 标签来实现下划线，不过这里使用自己的样式:
- 首先去掉自带的下线样式，
- 然后用下边框实现下划线的效果，
- 使用底部内边距设置下划线与文本的距离

```css
/*定义html 下划线u的下划线样式*/
u {
/* 去掉原来的下划线样式 */
text-decoration: none;
padding-bottom: 2px;
border-bottom: 2px solid #F00
}
```
## 完整代码
```html
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>下划线与文字距离改变 在线演示 Thinkcss</title>
    <style>
        /*定义html 下划线u的下划线样式*/
        u {
            /* 去掉原来的下划线样式 */
            text-decoration: none;
            padding-bottom: 2px;
            border-bottom: 2px solid #F00
        }
    </style>
</head>
<body>
    <u>下划线</u>
</body>
</html>
```
显示效果：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/HTML/wenbenTags/u/mycss.png)
<u>下划线样式</u>

# 参考链接
[http://css5.com.cn/jiqiao/914.shtml](http://css5.com.cn/jiqiao/914.shtml)
