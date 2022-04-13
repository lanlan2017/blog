---
title: 如何使用FrontAwesome图标
categories: 
  - Hexo
  - next主题
  - 个性化
abbrlink: 4181f9ed
date: 2019-03-11 21:02:57
updated: 2022-04-04 17:00:30
---
# 选择图标
到[http://www.fontawesome.com.cn/faicons/](http://www.fontawesome.com.cn/faicons/)这个地方搜索一个你喜欢的图标.
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexoSettings/FrontAwesome/find.png)
然后点击对应图标,这样会打开一个网页.然后代码块中的`复制源码`按钮即可得到可使用的代码.
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/hexoSettings/FrontAwesome/copy.png)
复制的话用到`flash`,如果用不了flash,自己拼接也行.只要知道这个图标等名字即可.使用格式为`<i class="fa fa-图标名称" aria-hidden="true"></i>`.

# NexT主题中使用
NexT(hexo)主题中,是可以直接使用这些图标的
# 实例
## 向上箭头图标

例如我想使用arrow-up这个图标,只要这样写即可:
```html
<i class="fa fa-arrow-up" aria-hidden="true"></i>
```
显示效果:<i class="fa fa-arrow-up" aria-hidden="true"></i>
## github图标

**例如github的图标:**
```html
<i class="fa fa-github" aria-hidden="true"></i>
```
显示效果:<i class="fa fa-github" aria-hidden="true"></i>

# 设置图标颜色

只要把这个图标(`<i>`标签),放在一个`<font>`标签中,然后设置font标签的颜色即可,例如把火狐图标的颜色设置为红色:
```html
<font color="red"><i class="fa fa-firefox" aria-hidden="true"></i></font>
```
显示效果:<font color="red"><i class="fa fa-firefox" aria-hidden="true"></i></font>
当然也可以直接在i标签上设置样式：
```html
<i class="fa fa-firefox" aria-hidden="true" style="color:#1fa67a;"></i>
```
显示效果:<i class="fa fa-firefox" aria-hidden="true" style="color:#1fa67a;"></i>

# 参考资料
1开始使用:[http://www.fontawesome.com.cn/get-started/](http://www.fontawesome.com.cn/get-started/)
2使用案例:[http://www.fontawesome.com.cn/examples/](http://www.fontawesome.com.cn/examples/)
3可访问性:[http://www.fontawesome.com.cn/accessibility/](http://www.fontawesome.com.cn/accessibility/)
