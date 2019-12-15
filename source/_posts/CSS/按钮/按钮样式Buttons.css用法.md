---
title: 按钮样式Buttons.css用法
categories: 
  - CSS
  - 按钮
date: 2019-11-13 20:57:05
updated: 2019-12-09 19:55:22
abbrlink: a0156a29
---
# 首先引入样式和js #
使用下拉列表需要使用JS
```html
<link href="https://cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>
```

<link href="https://cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>

# 使用样式 #
在html标签上添加特定的class即可应用样式.
## 形状 ##
```html
<div class="showcase-examples l-center">
<button class="button">默认</button>
<button class="button button-rounded">圆角正方</button>
<button class="button button-pill">圆角</button>
<button class="button button-square">正方</button>
<button class="button button-box">盒子</button>
<button class="button button-circle">圆</button>
</div>
```

<div class="showcase-examples l-center">
<button class="button">默认</button>
<button class="button button-rounded">圆角正方</button>
<button class="button button-pill">圆角</button>
<button class="button button-square">正方</button>
<button class="button button-box">盒子</button>
<button class="button button-circle">圆</button>
</div>

## 颜色
```html
<div class="showcase-examples l-center">
    <button class="button">Go</button>
    <button class="button button-primary">Go</button>
    <button class="button button-action">Go</button>
    <button class="button button-highlight">Go</button>
    <button class="button button-caution">Go</button>
    <button class="button button-royal">Go</button>
</div>
```

<div class="showcase-examples l-center">
    <button class="button">Go</button>
    <button class="button button-primary">Go</button>
    <button class="button button-action">Go</button>
    <button class="button button-highlight">Go</button>
    <button class="button button-caution">Go</button>
    <button class="button button-royal">Go</button>
</div>

## 大小
```html
<div class="showcase-examples l-center">
    <button class="button button-primary button-rounded button-tiny">Go</button>
    <button class="button button-primary button-rounded button-small">Go</button>
    <button class="button button-primary button-rounded">Go</button>
    <button class="button button-primary button-rounded button-large">Go</button>
    <button class="button button-primary button-rounded button-jumbo">Go</button>
    <button class="button button-primary button-rounded button-giant">Go</button>
</div>
```

<div class="showcase-examples l-center">
    <button class="button button-primary button-rounded button-tiny">Go</button>
    <button class="button button-primary button-rounded button-small">Go</button>
    <button class="button button-primary button-rounded">Go</button>
    <button class="button button-primary button-rounded button-large">Go</button>
    <button class="button button-primary button-rounded button-jumbo">Go</button>
    <button class="button button-primary button-rounded button-giant">Go</button>
</div>

## 透明按钮
```html
<div class="showcase-examples l-center" style="background: #ffff00;">
    <button class="button button-plain button-border">透明按钮</button>
    <button class="button button-plain button-border button-circle"><i class="fa fa-reply"></i></button>
    <button class="button button-plain button-border button-box"><i class="fa fa-star"></i></button>
    <button class="button button-plain button-border button-square"><i class="fa fa-trash-o"></i></button>
    <button class="button button-plain button-borderless"><i class="fa fa-tag"></i></button>
</div>
```

<div class="showcase-examples l-center" style="background: #ffff00;">
    <button class="button button-plain button-border">透明按钮</button>
    <button class="button button-plain button-border button-circle"><i class="fa fa-reply"></i></button>
    <button class="button button-plain button-border button-box"><i class="fa fa-star"></i></button>
    <button class="button button-plain button-border button-square"><i class="fa fa-trash-o"></i></button>
    <button class="button button-plain button-borderless"><i class="fa fa-tag"></i></button>
</div>

## 3D按钮
```html
<div class="showcase-examples l-center">
    <button class="button button-3d button-box button-jumbo"><i class="fa fa-thumbs-up"></i></button>
    <button class="button button-3d button-primary button-rounded">Check out the new site!</button>
    <button class="button button-3d button-action button-pill">Visit Us!</button>
    <button class="button button-3d button-action button-circle button-jumbo"><i class="fa fa-thumbs-up"></i></button>
    <button class="button button-3d button-caution"><i class="fa fa-camera"></i>Go</button>
    <button class="button button-3d button-royal">Say Hi!</button>
</div>
```

<div class="showcase-examples l-center">
    <button class="button button-3d button-box button-jumbo"><i class="fa fa-thumbs-up"></i></button>
    <button class="button button-3d button-primary button-rounded">Check out the new site!</button>
    <button class="button button-3d button-action button-pill">Visit Us!</button>
    <button class="button button-3d button-action button-circle button-jumbo"><i class="fa fa-thumbs-up"></i></button>
    <button class="button button-3d button-caution"><i class="fa fa-camera"></i>Go</button>
    <button class="button button-3d button-royal">Say Hi!</button>
</div>

## 突起按钮
```html
<div class="showcase-examples l-center">
    <button class="button button-raised button-primary button-pill">Visit Us!</button>
    <button class="button button-raised button-action button-circle button-jumbo"><i class="fa fa-thumbs-up"></i></button>
    <button class="button button-raised button-caution"><i class="fa fa-camera"></i> Go</button>
    <button class="button button-raised button-royal">Say Hi!</button>
    <button class="button button-raised button-pill button-inverse">Say Hi!</button>
</div>
```

<div class="showcase-examples l-center">
    <button class="button button-raised button-primary button-pill">Visit Us!</button>
    <button class="button button-raised button-action button-circle button-jumbo"><i class="fa fa-thumbs-up"></i></button>
    <button class="button button-raised button-caution"><i class="fa fa-camera"></i> Go</button>
    <button class="button button-raised button-royal">Say Hi!</button>
    <button class="button button-raised button-pill button-inverse">Say Hi!</button>
</div>

## 长阴影
```html
<div class="showcase-examples l-center l-longshadows">
    <button class="button button-primary button-box button-giant button-longshadow-right"><i class="fa fa-twitter"></i></button>
    <button class="button button-caution button-box button-raised button-giant button-longshadow"><i class="fa fa-google-plus"></i></button>
    <button class="button button-action button-box button-giant button-longshadow-left"><i class="fa fa-share-alt"></i></button>
    <button class="button button-highlight button-box button-giant button-longshadow-right button-longshadow-expand"><i class="fa fa-rss"></i></button>
    <button class="button button-primary button-circle button-giant button-longshadow"><i class="fa fa-gear"></i></button>
</div>
```

<div class="showcase-examples l-center l-longshadows">
    <button class="button button-primary button-box button-giant button-longshadow-right"><i class="fa fa-twitter"></i></button>
    <button class="button button-caution button-box button-raised button-giant button-longshadow"><i class="fa fa-google-plus"></i></button>
    <button class="button button-action button-box button-giant button-longshadow-left"><i class="fa fa-share-alt"></i></button>
    <button class="button button-highlight button-box button-giant button-longshadow-right button-longshadow-expand"><i class="fa fa-rss"></i></button>
    <button class="button button-primary button-circle button-giant button-longshadow"><i class="fa fa-gear"></i></button>
</div>

## 光晕效果
```html
<div class="showcase-examples l-over l-center">
    <button class="button button-glow button-rounded button-raised button-primary">Go</button>
    <button class="button button-glow button-border button-rounded button-primary">Go</button>
    <button class="button button-glow button-circle button-action button-jumbo"><i class="fa fa-thumbs-up"></i></button>
    <button class="button button-glow button-rounded button-highlight">Go</button>
    <button class="button button-glow button-rounded button-caution">Go</button>
    <button class="button button-glow button-rounded button-royal">Go</button>
</div>
```

<div class="showcase-examples l-over l-center">
    <button class="button button-glow button-rounded button-raised button-primary">Go</button>
    <button class="button button-glow button-border button-rounded button-primary">Go</button>
    <button class="button button-glow button-circle button-action button-jumbo"><i class="fa fa-thumbs-up"></i></button>
    <button class="button button-glow button-rounded button-highlight">Go</button>
    <button class="button button-glow button-rounded button-caution">Go</button>
    <button class="button button-glow button-rounded button-royal">Go</button>
</div>

## 带下拉菜单的按钮
当按钮被点击时会出现一个下拉菜单
```html
<div class="showcase-examples l-center">
    <span class="button-dropdown" data-buttons="dropdown">
        <button class="button button-rounded">
            Select Me <i class="fa fa-caret-down"></i>
        </button>
        <ul class="button-dropdown-list">
            <li><a href="#带下拉菜单的按钮">Option Link 1</a></li>
            <li><a href="#带下拉菜单的按钮">Option Link 2</a></li>
            <li class="button-dropdown-divider">
                <a href="#带下拉菜单的按钮">Option Link 3</a>
            </li>
        </ul>
    </span>
    <span class="button-dropdown button-dropdown-primary" data-buttons="dropdown">
        <button class="button button-primary button-large">
            <i class="fa fa-bars"></i> Select Me
        </button>
        <ul class="button-dropdown-list is-below">
            <li><a href="#带下拉菜单的按钮"><i class="fa fa-heart-o"></i> Option Link 1</a></li>
            <li><a href="#带下拉菜单的按钮">Option Link 2</a></li>
            <li class="button-dropdown-divider">
                <a href="#带下拉菜单的按钮">Option Link 3</a>
            </li>
        </ul>
    </span>
    <span class="button-dropdown button-dropdown-action" data-buttons="dropdown">
        <button class="button button-action">
            Select Me <i class="fa fa-caret-up"></i>
        </button>
        <ul class="button-dropdown-list is-above">
            <li><a href="#带下拉菜单的按钮">Option Link 1</a></li>
            <li><a href="#带下拉菜单的按钮">Option Link 2</a></li>
            <li class="button-dropdown-divider">
                <a href="#带下拉菜单的按钮">Option Link 3</a>
            </li>
        </ul>
    </span>
    <span class="button-dropdown button-dropdown-plain" data-buttons="dropdown">
        <button class="button button-caution button-pill">
            Select Me <i class="fa fa-caret-down"></i>
        </button>
        <ul class="button-dropdown-list">
            <li><a href="#带下拉菜单的按钮">Option Link 1</a></li>
            <li class="button-dropdown-divider">
                <a href="#带下拉菜单的按钮">Option Link 2</a>
            </li>
            <li>
                <a href="#带下拉菜单的按钮">Option Link 3</a>
            </li>
        </ul>
    </span>
    <span class="button-dropdown button-dropdown-inverse" data-buttons="dropdown">
        <a href="#带下拉菜单的按钮" class="button button-inverse">
            <i class="fa fa-envelope"></i> Select Me <i class="fa fa-caret-down"></i>
        </a>
        <ul class="button-dropdown-list is-below">
            <li><a href="#带下拉菜单的按钮">Option Link 1</a></li>
            <li class="button-dropdown-divider">
                <a href="#带下拉菜单的按钮">Option Link 2</a>
            </li>
            <li>
                <a href="#带下拉菜单的按钮">Option Link 3</a>
            </li>
        </ul>
    </span>
</div>
```

### 效果

<div class="showcase-examples l-center">
    <span class="button-dropdown" data-buttons="dropdown">
        <button class="button button-rounded">
            Select Me <i class="fa fa-caret-down"></i>
        </button>
        <ul class="button-dropdown-list">
            <li><a href="#带下拉菜单的按钮">Option Link 1</a></li>
            <li><a href="#带下拉菜单的按钮">Option Link 2</a></li>
            <li class="button-dropdown-divider">
                <a href="#带下拉菜单的按钮">Option Link 3</a>
            </li>
        </ul>
    </span>
    <span class="button-dropdown button-dropdown-primary" data-buttons="dropdown">
        <button class="button button-primary button-large">
            <i class="fa fa-bars"></i> Select Me
        </button>
        <ul class="button-dropdown-list is-below">
            <li><a href="#带下拉菜单的按钮"><i class="fa fa-heart-o"></i> Option Link 1</a></li>
            <li><a href="#带下拉菜单的按钮">Option Link 2</a></li>
            <li class="button-dropdown-divider">
                <a href="#带下拉菜单的按钮">Option Link 3</a>
            </li>
        </ul>
    </span>
    <span class="button-dropdown button-dropdown-action" data-buttons="dropdown">
        <button class="button button-action">
            Select Me <i class="fa fa-caret-up"></i>
        </button>
        <ul class="button-dropdown-list is-above">
            <li><a href="#带下拉菜单的按钮">Option Link 1</a></li>
            <li><a href="#带下拉菜单的按钮">Option Link 2</a></li>
            <li class="button-dropdown-divider">
                <a href="#带下拉菜单的按钮">Option Link 3</a>
            </li>
        </ul>
    </span>
    <span class="button-dropdown button-dropdown-plain" data-buttons="dropdown">
        <button class="button button-caution button-pill">
            Select Me <i class="fa fa-caret-down"></i>
        </button>
        <ul class="button-dropdown-list">
            <li><a href="#带下拉菜单的按钮">Option Link 1</a></li>
            <li class="button-dropdown-divider">
                <a href="#带下拉菜单的按钮">Option Link 2</a>
            </li>
            <li>
                <a href="#带下拉菜单的按钮">Option Link 3</a>
            </li>
        </ul>
    </span>
    <span class="button-dropdown button-dropdown-inverse" data-buttons="dropdown">
        <a href="#带下拉菜单的按钮" class="button button-inverse">
            <i class="fa fa-envelope"></i> Select Me <i class="fa fa-caret-down"></i>
        </a>
        <ul class="button-dropdown-list is-below">
            <li><a href="#带下拉菜单的按钮">Option Link 1</a></li>
            <li class="button-dropdown-divider">
                <a href="#带下拉菜单的按钮">Option Link 2</a>
            </li>
            <li>
                <a href="#带下拉菜单的按钮">Option Link 3</a>
            </li>
        </ul>
    </span>
</div>

## 按钮组
```html
<span class="showcase-examples l-center">
    <span class="button-group">
        <button type="button" class="button button-primary">Option 1</button>
        <button type="button" class="button button-primary">Option 2</button>
        <button type="button" class="button button-primary">Option 3</button>
        <!-- DROPDOWN MENU -->
        <span class="button-dropdown button-dropdown-primary" data-buttons="dropdown">
            <a href="#" class="button button-primary"> Select Me <i class="fa fa-caret-down"></i></a>
            <ul class="button-dropdown-list is-below">
                <li><a href="#按钮组">Option Link 1</a></li>
                <li><a href="#按钮组">Option Link 2</a></li>
                <li class="button-dropdown-spanider"><a href="#">Option Link 3</a></li>
            </ul>
        </span>
    </span>
    <span class="button-group">
        <button type="button" class="button button-pill button-action">Option 1</button>
        <button type="button" class="button button-pill button-action">Option 2</button>
        <button type="button" class="button button-pill button-action">Option 3</button>
    </span>
    <span class="button-group">
        <button type="button" class="button button-royal button-rounded button-raised">Option 1</button>
        <button type="button" class="button button-royal button-rounded button-raised">Option 2</button>
        <button type="button" class="button button-royal button-rounded button-raised">Option 3</button>
    </span>
</span>
```

### 效果

<span class="showcase-examples l-center">
    <span class="button-group">
        <button type="button" class="button button-primary">Option 1</button>
        <button type="button" class="button button-primary">Option 2</button>
        <button type="button" class="button button-primary">Option 3</button>
        <!-- DROPDOWN MENU -->
        <span class="button-dropdown button-dropdown-primary" data-buttons="dropdown">
            <a href="#" class="button button-primary"> Select Me <i class="fa fa-caret-down"></i></a>
            <ul class="button-dropdown-list is-below">
                <li><a href="#按钮组">Option Link 1</a></li>
                <li><a href="#按钮组">Option Link 2</a></li>
                <li class="button-dropdown-spanider"><a href="#">Option Link 3</a></li>
            </ul>
        </span>
    </span>
    <span class="button-group">
        <button type="button" class="button button-pill button-action">Option 1</button>
        <button type="button" class="button button-pill button-action">Option 2</button>
        <button type="button" class="button button-pill button-action">Option 3</button>
    </span>
    <span class="button-group">
        <button type="button" class="button button-royal button-rounded button-raised">Option 1</button>
        <button type="button" class="button button-royal button-rounded button-raised">Option 2</button>
        <button type="button" class="button button-royal button-rounded button-raised">Option 3</button>
    </span>
</span>

## 堆叠按钮
block 级别的按钮会占据最大宽度
```html
<div class="showcase-examples l-center" style="width: 100%;">
    <button class="button button-block button-rounded button-large">Go</button>
    <button class="button button-block button-rounded button-primary button-large">Go</button>
    <button class="button button-block button-rounded button-action button-large">Go</button>
    <button class="button button-block button-rounded button-highlight button-large">Go</button>
    <button class="button button-block button-rounded button-caution button-large">Go</button>
    <button class="button button-block button-rounded button-royal button-large">Go</button>
</div>
```
### 效果

<div class="showcase-examples l-center" style="width: 100%;">
    <button class="button button-block button-rounded button-large">Go</button>
    <button class="button button-block button-rounded button-primary button-large">Go</button>
    <button class="button button-block button-rounded button-action button-large">Go</button>
    <button class="button button-block button-rounded button-highlight button-large">Go</button>
    <button class="button button-block button-rounded button-caution button-large">Go</button>
    <button class="button button-block button-rounded button-royal button-large">Go</button>
</div>


## 额外的环绕效果
为按钮周围增加额外视觉效果能够突出按钮
```html
<div class="showcase-examples l-center">
    <span class="button-wrap">
        <button class="button button-circle">
        <i class="fa fa-cloud"></i>
        </button>
    </span>
    <span class="button-wrap">
        <button class="button button-circle button-raised button-primary">
        <i class="fa fa-cloud"></i>
        </button>
    </span>
    <span class="button-wrap">
        <a href="#额外的环绕效果" class="button button-pill ">Go</a>
    </span>
    <span class="button-wrap">
        <a href="#额外的环绕效果" class="button button-pill button-raised button-primary">Go</a>
    </span>
</div>
```

### 效果

<div class="showcase-examples l-center">
    <span class="button-wrap">
        <button class="button button-circle">
        <i class="fa fa-cloud"></i>
        </button>
    </span>
    <span class="button-wrap">
        <button class="button button-circle button-raised button-primary">
        <i class="fa fa-cloud"></i>
        </button>
    </span>
    <span class="button-wrap">
        <a href="#额外的环绕效果" class="button button-pill ">Go</a>
    </span>
    <span class="button-wrap">
        <a href="#额外的环绕效果" class="button button-pill button-raised button-primary">Go</a>
    </span>
</div>


## 表单按钮
Buttons 作为表单元素也是非常棒的
```html
<div class="showcase-examples l-center">
    <input type="submit" value="Go" class="button button-pill button-primary">
    <button class="button button-pill button-primary">Go</button>
    <!-- DISABLED BUTTONS -->
    <input disabled="" type="submit" value="Go" class="button button-pill button-primary">
    <button disabled="" class="button  button-pill button-primary">Go</button>
    <button disabled="" class="button button-pill button-flat-primary">Go</button>
    <a href="#" class="button disabled button-pill button-primary ">Go</a>
</div>
```

### 效果

<div class="showcase-examples l-center">
    <input type="submit" value="Go" class="button button-pill button-primary">
    <button class="button button-pill button-primary">Go</button>
    <!-- DISABLED BUTTONS -->
    <input disabled="" type="submit" value="Go" class="button button-pill button-primary">
    <button disabled="" class="button  button-pill button-primary">Go</button>
    <button disabled="" class="button button-pill button-flat-primary">Go</button>
    <a href="#" class="button disabled button-pill button-primary ">Go</a>
</div>

## 各种文字样式
按钮中的文本可以有多种样式
```html
<div class="showcase-examples l-center">
    <a href="#各种文字样式" class="button button-uppercase button-primary">uppercase</a>
    <a href="#各种文字样式" class="button button-lowercase button-primary ">lowercase</a>
    <a href="#各种文字样式" class="button button-capitalize button-primary">capitalize</a>
    <a href="#各种文字样式" class="button button-small-caps button-primary">small caps</a>
</div>
```
### 效果

<div class="showcase-examples l-center">
    <a href="#各种文字样式" class="button button-uppercase button-primary">uppercase</a>
    <a href="#各种文字样式" class="button button-lowercase button-primary ">lowercase</a>
    <a href="#各种文字样式" class="button button-capitalize button-primary">capitalize</a>
    <a href="#各种文字样式" class="button button-small-caps button-primary">small caps</a>
</div>

# 参考资料 #
[https://www.bootcss.com/p/buttons/](https://www.bootcss.com/p/buttons/)
[https://www.bootcdn.cn/Buttons/](https://www.bootcdn.cn/Buttons/)
[https://blog.csdn.net/wangjiaohome/article/details/49761169](https://blog.csdn.net/wangjiaohome/article/details/49761169)
