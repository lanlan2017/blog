---
title: HTML 表单
categories:
  - 编程
  - HTML
  - 表单
abbrlink: b74fe8bf
date: 2018-11-28 14:45:08
updated: 2019-12-17 05:18:52
---
<div id='my_toc'><a href="/blog/b74fe8bf/#HTML表单是什么" class="header_1">HTML表单是什么</a>&nbsp;<br><a href="/blog/b74fe8bf/#form元素" class="header_1">form元素</a>&nbsp;<br><a href="/blog/b74fe8bf/#文本输入域" class="header_1">文本输入域</a>&nbsp;<br><a href="/blog/b74fe8bf/#单行文本域" class="header_2">单行文本域</a>&nbsp;<br><a href="/blog/b74fe8bf/#E-mail-地址域" class="header_3">E-mail 地址域</a>&nbsp;<br><a href="/blog/b74fe8bf/#密码域" class="header_3">密码域</a>&nbsp;<br><a href="/blog/b74fe8bf/#搜索域" class="header_3">搜索域</a>&nbsp;<br><a href="/blog/b74fe8bf/#电话号码域" class="header_3">电话号码域</a>&nbsp;<br><a href="/blog/b74fe8bf/#URL-域" class="header_3">URL 域</a>&nbsp;<br><a href="/blog/b74fe8bf/#多行文本域" class="header_2">多行文本域</a>&nbsp;<br><a href="/blog/b74fe8bf/#下拉内容" class="header_1">下拉内容</a>&nbsp;<br><a href="/blog/b74fe8bf/#选择框" class="header_2">选择框</a>&nbsp;<br><a href="/blog/b74fe8bf/#多选选择框" class="header_2">多选选择框</a>&nbsp;<br><a href="/blog/b74fe8bf/#自动补全输入框" class="header_2">自动补全输入框</a>&nbsp;<br><a href="/blog/b74fe8bf/#可选中项" class="header_1">可选中项</a>&nbsp;<br><a href="/blog/b74fe8bf/#复选框" class="header_2">复选框</a>&nbsp;<br><a href="/blog/b74fe8bf/#单选按钮" class="header_2">单选按钮</a>&nbsp;<br><a href="/blog/b74fe8bf/#按钮" class="header_1">按钮</a>&nbsp;<br><a href="/blog/b74fe8bf/#submit" class="header_2">submit</a>&nbsp;<br><a href="/blog/b74fe8bf/#reset" class="header_2">reset</a>&nbsp;<br><a href="/blog/b74fe8bf/#button" class="header_2">button</a>&nbsp;<br><a href="/blog/b74fe8bf/#高级表单部件" class="header_1">高级表单部件</a>&nbsp;<br><a href="/blog/b74fe8bf/#数字" class="header_2">数字</a>&nbsp;<br><a href="/blog/b74fe8bf/#例子" class="header_3">例子</a>&nbsp;<br><a href="/blog/b74fe8bf/#滑块" class="header_2">滑块</a>&nbsp;<br><a href="/blog/b74fe8bf/#例子" class="header_3">例子</a>&nbsp;<br><a href="/blog/b74fe8bf/#日期时间选择器" class="header_2">日期时间选择器</a>&nbsp;<br><a href="/blog/b74fe8bf/#本地时间" class="header_3">本地时间</a>&nbsp;<br><a href="/blog/b74fe8bf/#月" class="header_3">月</a>&nbsp;<br><a href="/blog/b74fe8bf/#时间" class="header_3">时间</a>&nbsp;<br><a href="/blog/b74fe8bf/#星期" class="header_3">星期</a>&nbsp;<br><a href="/blog/b74fe8bf/#拾色器" class="header_2">拾色器</a>&nbsp;<br><a href="/blog/b74fe8bf/#其他小部件" class="header_1">其他小部件</a>&nbsp;<br><a href="/blog/b74fe8bf/#文件选择器" class="header_2">文件选择器</a>&nbsp;<br><a href="/blog/b74fe8bf/#例子" class="header_3">例子</a>&nbsp;<br><a href="/blog/b74fe8bf/#隐藏内容" class="header_2">隐藏内容</a>&nbsp;<br><a href="/blog/b74fe8bf/#图像按钮" class="header_2">图像按钮</a>&nbsp;<br><a href="/blog/b74fe8bf/#仪表和进度条" class="header_2">仪表和进度条</a>&nbsp;<br><a href="/blog/b74fe8bf/#进度条" class="header_3">进度条</a>&nbsp;<br><a href="/blog/b74fe8bf/#仪表" class="header_3">仪表</a>&nbsp;<br><a href="/blog/b74fe8bf/#参考链接" class="header_1">参考链接</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
# HTML表单是什么 #
> HTML表单是用户和web站点或应用程序之间交互的主要内容之一。它们允许用户将数据发送到web站点。大多数情况下，数据被发送到web服务器，但是web页面也可以自己拦截它并使用它。
# form元素 #
所有HTML表单都以一个`<form>`元素开始：
```html
<form action="/my-handling-form-page" method="post">
</form>
```
这个元素正式定义了一个表单。就像`<div>`元素或`<p>`元素，`它是一个容器元素`，但它也支持一些特定的属性来配置表单的行为方式。它的所有属性都是可选的，但`至少要设置action属性和method属性`，这被认为是最佳实践。
- `action` 属性定义了在提交表单时,应该把所收集的数据送给谁(/那个模块)(URL)去处理。.
- `method` 属性定义了发送数据的HTTP方法(它可以是“get”或“post”).

# 文本输入域 #
文本输入域 `<input>` 是最基本的表单小部件
## 单行文本域 ##
> 使用`<input>`元素创建一个单行文本域，该元素的type属性值被设置为text （同样的，如果你不提供type属性，text 是默认值）。如果你指定的type属性的值在浏览器中是未知的（比如你指定 type="date"，但是浏览器不支持原生日期选择器），属性值text就是是备用值。

如下所示:
```html
<input type="text">  <input>
```
<input type="text">  <input>

### E-mail 地址域 ###
该类型的域通过设置type属性值为`email`来实现。
```html
<input type="email" id="email" name="email" multiple>
```
当使用 type时， 用户`需要在域中输入有效的电子邮件地址`；任何其他内容都会导致浏览器在提交表单时显示错误。注意，这是客户端错误验证，由浏览器执行：
<input type="email" id="email" name="email" multiple>

multiple可以让用户将多个电子邮件地址输入，相同的输入(以`逗号`分隔)。在一些设备上(特别是在移动设备上)，可能会出现一个不同的虚拟键盘，更适合输入电子邮件地址
### 密码域 ###
通过type 属性的password值设置该类型域：
```html
<input type="password" id="pwd" name="pwd" value="default">
```
如下所示:
<input type="password" id="pwd" name="pwd" value="default">

它不会为输入的文本添加任何特殊的约束，但是它会模糊输入到字段中的值(例如，用点或小行星)，这样它就不能被其他人读取。
请记住，`这只是一个用户界面特性`;**除非你安全地提交你的表单，否则它会`以明文发送`**，这不利于安全——恶意的一方可能会截获你的数据，窃取你的密码、信用卡信息，或者你提交的其他任何东西。保护用户不受此影响的最佳方式是在安全连接上托管任何涉及表单的页面(例如:https://……地址)，使得数据在发送之前就已加密。
现代浏览器认识到在不安全的连接上发送表单数据所带来的安全影响，并且已经实现了警告，以阻止用户使用不安全的表单。
### 搜索域 ###
通过使用 type属性的 search 值设置该类型域：
```html
<input type="search" id="search" name="search">
```
<input type="search" id="search" name="search">
`文本域和搜索域之间的主要区别是浏览器的样式`——通常，搜索字段以圆角和/或给定一个“x”来清除输入的值。然而，还有另外一个值得注意的特性:它们的值可以自动保存到同一站点上的多个页面上自动完成。
### 电话号码域 ###
通过 type属性的 tel 值设置该类型域：
```html
<input type="tel" id="tel" name="tel" value="123456789">
```
<input type="tel" id="tel" name="tel" value="123456789">

由于世界范围内各种各样的电话号码格式，**这种类型的字段不会对用户输入的值执行任何限制**(包括字母，等等)。这主要是语义上的差异，尽管在一些设备上(特别是在移动设备上)，可能会出现一个不同的虚拟键盘，更适合输入电话号码。
### URL 域 ###
通过type属性的url 值设置该类型域：
```html
<input type="url" id="url" name="url">
```
<input type="url" id="url" name="url">
它为字段添加了特殊的验证约束，`如果输入无效的url，浏览器就会报告错误`。
**注意**：URL格式良好，但并不一定意味着它引用了一个实际存在的位置。
## 多行文本域 ##
多行文本域专指使用 `<textarea>`元素，而不是使用`<input> `元素。
```html
<textarea cols="30" rows="2">默认内容</textarea>
```
<textarea cols="30" rows="2">默认内容</textarea>
textarea和常规的单行文本字段之间的主要区别是，允许用户输入包含硬换行符(即`按回车`)的文本。
在大多数浏览器中，文本区域在右下角有一个拖放操作，允许用户调整它的大小。这种调整能力可以通过使用CSS设置文本区域的resize性质为 none 来关闭。
`<textarea>` 还接受了一些额外的属性，以控制它在几行代码中呈现的效果 (除此以外还有其他几个)：
**`<textarea>` 元素属性**

|属性名|默认值|描述|
|-|-|-|
|cols|20|文本控件的可见宽度，平均字符宽度。|
|rows||    控制的可见文本行数。|
|wrap|soft|表示控件是如何包装文本的。可能的值：hard 或 soft|
这里有两个关键点需要注意：
- 如果您想为`<input>`元素定义一个默认值，那么您`必须使用value属性`;
- 对于`<textarea>`元素，默认的文本放在起始标记`<textarea>`和的结束标记`</textarea>`之间。
- ** `<textarea>`元素只接受文本内容**；这意味着`将任何HTML内容放入<textarea>中都呈现为纯文本内容`。

# 下拉内容 #
下拉窗口小部件是一种简单的方法，可以让用户选择众多选项中的一个，而不需要占用用户界面的太多空间。**HTML有两种类型的下拉内容**:
- select box
- autocomplete box。

在这两种情况下，交互都是相同的——一旦控件被激活，浏览器就会显示用户可以选择的值列表
## 选择框 ##
一个选择框是用`<select>`元素创建的，其中有一个或多个`<option>`元素作为子元素，每个元素都指定了其中一个可能的值。
```html
<select id="simple" name="simple">
  <option>Banana</option>
  <option>Cherry</option>
  <option>Lemon</option>
</select>
```
如下所示:
<hr><select id="simple" name="simple"><option>Banana</option><option>Cherry</option><option>Lemon</option></select><hr>

如果需要，可以使用selected属性在所需的`<option>`元素上设置选择框的默认值，然后在页面加载时选择该选项。`<option>`元素也可以嵌套在`<optgroup>`元素中，以创建视觉相关的组值：

```html
<select id="groups" name="groups">
  <optgroup label="fruits">
    <option>Banana</option>
    <option selected>Cherry</option>
    <option>Lemon</option>
  </optgroup>
  <optgroup label="vegetables">
    <option>Carrot</option>
    <option>Eggplant</option>
    <option>Potato</option>
  </optgroup>
</select>
```
<hr><select id="groups" name="groups"><optgroup label="fruits"><option>Banana</option><option selected>Cherry</option><option>Lemon</option></optgroup><optgroup label="vegetables"><option>Carrot</option><option>Eggplant</option><option>Potato</option></optgroup>
</select><hr>

**如果一个`<option>`元素设置了value属性，那么当提交表单时该属性的值就会被发送**。如果忽略了value属性，则使用`<option>`元素的内容作为选择框的值。
在`<optgroup>`元素中，label属性显示在值之前，**但即使它看起来有点像一个选项，它也不是可选的**。
## 多选选择框 ##
默认情况下，选择框只允许用户选择一个值。通过将`multiple`属性添加到`<select>`元素，您可以允许用户`通过操作系统提供的默认机制来选择`几个值。 (如， `同时按下 Cmd/Ctrl 并点击多个值`).

注意：在多个选项选择框的情况下，选择框不再显示值为下拉内容——相反，它们都显示在一个列表中。
```html
<select multiple id="multi" name="multi">
  <option>Banana</option>
  <option>Cherry</option>
  <option>Lemon</option>
</select>
```
<hr><select multiple id="multi" name="multi"><option>Banana</option><option>Cherry</option><option>Lemon</option></select><hr>

注意：所有支持 `<select> `元素的浏览器也都支持 multiple 。
## 自动补全输入框 ##
您可以使用`<datalist>`元素来为表单小部件提供建议的、自动完成的值，并使用一些`<option>`子元素来指定要显示的值。
然后使用list属性将数据列表绑定到一个文本域(通常是一个` <input>` 元素)。
一旦数据列表与表单小部件相关联，它的选项用于自动完成用户输入的文本;通常，这是作为一个下拉框向用户展示的，在输入框中输入可能匹配的内容。
```html
<label for="myFruit">What's your favorite fruit?</label>
<input type="text" name="myFruit" id="myFruit" list="mySuggestion">
<datalist id="mySuggestion">
  <option>Apple</option>
  <option>Banana</option>
  <option>Blackberry</option>
  <option>Blueberry</option>
  <option>Lemon</option>
  <option>Lychee</option>
  <option>Peach</option>
  <option>Pear</option>
</datalist>
```
<hr><label for="myFruit">What's your favorite fruit?</label><input type="text" name="myFruit" id="myFruit" list="mySuggestion"><datalist id="mySuggestion"><option>Apple</option><option>Banana</option><option>Blackberry</option><option>Blueberry</option><option>Lemon</option><option>Lychee</option><option>Peach</option><option>Pear</option></datalist><hr>

注意： 根据HTML规范，`list 属性和<datalist>元素元素可以用于任何需要用户输入的小部件`。但是，除了文本(例如颜色或日期)，它应该如何工作还不清楚，不同的浏览器在不同的情况下会有不同的表现。正因为如此，`除了文本字段以外，要小心使用这个特性`。
# 可选中项 #
可选中项是状态可以通过单击它们来更改小部件。有两种可选中项：`复选框`和`单选按钮`。两者都使用checked属性，以指示该部件的默认状态: "选中"或"未选中"。
值得注意的是，这些小部件与其他表单小部件不一样。**对于大多数表单部件，一旦表单提交，所有具有name属性的小部件都会被发送，即使没有任何值被填**。**对于可选中项，只有在勾选时才发送它们的值。如果他们没有被勾选，就不会发送任何东西，甚至连他们的名字也没有**。
为了获得最大的可用性和可访问性，建议您在`<fieldset>`中包围每个相关项目的列表，并使用`<legend>`提供对列表的全面描述。每个单独的`<label>/<input>`元素都应该包含在它自己的列表项中(或者类似的)。正如在示例中显示的。

您还需要为这些类型的输入提供value属性，如果您想让它们具有意义——如果没有提供任何值，则复选框和单选按钮被赋予一个 on值。
## 复选框 ##
使用type属性值为checkbox的 `<input>`元素来创建一个复选框。
```html
<input type="checkbox" checked id="carrots" name="carrots" value="carrots">
```
<hr><input type="checkbox" checked id="carrots" name="carrots" value="carrots"><hr>

包含checked属性使复选框在页面加载时自动被选中。
## 单选按钮 ##

使用type属性值为radio的 `<input>`元素来创建一个单选按钮。
```html
<input type="radio" checked id="soup" name="meal">
```
<hr><input type="radio" checked id="soup" name="meal"><hr>

**几个单选按钮可以连接在一起**。如果它们的**name属性值相同，那么它们将被认为属于同一组的按钮**。`同一组中只有一个按钮可以同时被选`；这意味着当其中一个被选中时，所有其他的都将自动未选中。如果没有选中任何一个，那么整个单选按钮池就被认为处于未知状态，并且没有以表单的形式发送任何值。
```html
<fieldset>
  <legend>What is your favorite meal?</legend>
  <ul>
    <li>
      <label for="soup">Soup</label>
      <input type="radio" checked id="soup" name="meal" value="soup">
    </li>
    <li>
      <label for="curry">Curry</label>
      <input type="radio" id="curry" name="meal" value="curry">
    </li>
    <li>
      <label for="pizza">Pizza</label>
      <input type="radio" id="pizza" name="meal" value="pizza">
    </li>
  </ul>
</fieldset>
```
<hr><fieldset><legend>What is your favorite meal?</legend><ul><li><label for="soup">Soup</label><input type="radio" checked id="soup" name="meal" value="soup"></li><li><label for="curry">Curry</label><input type="radio" id="curry" name="meal" value="curry"></li><li><label for="pizza">Pizza</label><input type="radio" id="pizza" name="meal" value="pizza"></li></ul></fieldset><hr>

# 按钮 #
在HTML表单中，有三种按钮：
- Submit：将表单数据发送到服务器。
- Reset：将所有表单小部件重新设置为它们的默认值。
- Button：没有自动生效的按钮，但是可以使用JavaScript代码进行定制。如果您省略了type属性，那么这就是默认值。 

使用` <button>`元素或者`<input>`元素来创建一个按钮。type属性的值指定显示什么类型的按钮。
## submit ##
```html
<button type="submit">
    This a <br><strong>submit button</strong>
</button>
<input type="submit" value="This is a submit button">
```
<hr><button type="submit">This a <br><strong>submit button</strong>
</button>
<input type="submit" value="This is a submit button"><hr>

## reset ##
```html
<button type="reset">
    This a <br><strong>reset button</strong>
</button>
<input type="reset" value="This is a reset button">
```
<hr><button type="reset">This a <br><strong>reset button</strong></button><input type="reset" value="This is a reset button"><hr>

## button ##
```html
<button type="button">
    This an <br><strong>anonymous button</strong>
</button>
<input type="button" value="This is an anonymous button">
```
<hr><button type="button">This an <br><strong>anonymous button</strong></button><input type="button" value="This is an anonymous button"><hr>

不管您使用的是`<button>`元素还是`<input>`元素，**按钮的行为都是一样的**。然而，有一些显著的不同之处：
- 从示例中可以看到，**`<button>`元素允许您在它们的标签中使用HTML内容**，这些内容被插入到打开和关闭`<button>` 标签中。另一方面，`<input>`元素是空元素;它们的标签被插入到value属性中，因此只接受纯文本内容。
- 使用`<button>`元素，可以有一个不同于按钮标签的值(通过将其设置为value属性)。这在IE 8之前的版本中是不可靠的。

从技术上讲，使用`<button>`元素或`<input>`元素定义的按钮几乎没有区别。唯一值得注意的区别是按钮本身的标签。**在`<input>`元素中，标签只能是字符数据**，**而在`<button>`元素中，标签可以是HTML**，因此可以相应地进行样式化。
# 高级表单部件 #
在本节中，我们将介绍那些让用户输入复杂或不寻常数据的小部件。这包括精确的或近似的数字，日期和时间，或颜色。
## 数字 ##
用于数字的小部件是用`<input>`元素创建的，它的type属性设置为number。这个控件看起来像一个文本域，并且通常提供一些按钮来增加或减少小部件的值。
也可以：
- 通过设置min和max属性来约束该值。
- 通过设置step属性来指定增加和减少按钮更改小部件的值的数量。

### 例子 ###
```html
<input type="number" name="age" id="age" min="1" max="10" step="2">
```
<hr><input type="number" name="age" id="age" min="1" max="10" step="2"><hr>

这将创建一个数字小部件，其值被限制为1到10之间的任何值，而其增加和减少按钮 每次改变的值为2。在10以下的Internet Explorer版本中不支持number 输入。
## 滑块 ##
另一种选择数字的方法是使用滑块。从视觉上讲，**滑块比文本字段更不准确，因此它们被用来选择一个`确切值并不重要的数字`**。
滑块是通过把`<input>`元素的type属性值设置为range来创建的。正确配置滑块是很重要的；为了达到这个目的，我们强烈建议您设置min、max和step属性。
### 例子 ###
```html
<input type="range" name="beans" id="beans" min="0" max="500" step="10">
```
<hr><input type="range" name="beans" id="beans" min="0" max="500" step="10"><hr>

这个例子创建了一个滑块，它可能的值在0到500之间，而它的递增/递减按钮改变值的值是+10和-10。
滑块的一个问题是，它们不提供任何形式的视觉反馈，以了解当前的值是什么。您需要使用JavaScript来添加这一点，但这相对来说比较容易。在本例中，我们添加了一个空的`<span>`元素，其中我们将写入滑块的当前值，并在更改时更新它。
```html
<label for="beans">How many beans can you eat? </label><input type="range" name="beans" id="beans12345678" min="0" max="500" step="10" oninput="change()"> <span id="beancount123456789"></span>
```
可以使用一些简单的JavaScript实现
```javascript
<script>
function change() {
document.getElementById("beancount123456789").textContent = document.getElementById("beans12345678").value;
}
</script>
```
如下所示:
<hr><label for="beans">How many beans can you eat? </label><input type="range" name="beans" id="beans12345678" min="0" max="500" step="10" oninput="change()"> <span id="beancount123456789"></span><hr>
<script>
function change() { document.getElementById("beancount123456789").textContent = document.getElementById("beans12345678").value;}
</script>

这里设置了一个oninput事件处理程序，以便每次移动范围滑块时，都会将span textContent更新为新的输入值。
在10以下的Internet Explorer版本中不支持range 
## 日期时间选择器 ##
对于web开发人员来说，收集日期和时间值一直是一场噩梦。HTML5通过提供一种特殊的控制来处理这种特殊的数据，从而带来了一些增强。
使用`<input>`元素和一个type属性的适当的值来创建日期和时间控制，这取决于您是否希望收集日期、时间或两者。
### 本地时间 ###
这将创建一个小部件来显示和选择一个日期，但是没有任何特定的时区信息。
```html
<input type="datetime-local" name="datetime" id="datetime">
```
<hr><input type="datetime-local" name="datetime" id="datetime"><hr>

### 月 ###
这就创建了一个小部件来显示和挑选一个月。
```html
<input type="month" name="month" id="month">
```
<hr><input type="month" name="month" id="month"><hr>

### 时间 ###
这将创建一个小部件来显示并选择一个时间值。
```html
<input type="time" name="time" id="time">
```
<hr><input type="time" name="time" id="time"><hr>

### 星期 ###
这将创建一个小部件来显示并挑选一个星期号和它的年份。
```html
<input type="week" name="week" id="week">
```
<hr><input type="week" name="week" id="week"><hr>

所有日期和时间控制都可以使用min和max属性来约束。
```html
<label for="myDate">When are you available this summer?</label>
<input type="date" name="myDate" min="2013-06-01" max="2013-08-31" id="myDate">
```
<hr><label for="myDate">When are you available this summer?</label><input type="date" name="myDate" min="2013-06-01" max="2013-08-31" id="myDate"><hr>

警告——日期和时间窗口小部件仍然很不受支持。目前，Chrome、Edge和Opera都支持它们，但IE浏览器没有支持**，Firefox和Safari对这些都没有太大的支持**。
## 拾色器 ##
颜色总是有点难处理。有很多方式来表达它们:RGB值(十进制或十六进制)、HSL值、关键字等等。颜色小部件允许用户在文本和可视的方式中选择颜色。
一个颜色小部件是使用`<input>`元素创建的，它的type属性设置为值`color`。
```html
<input type="color" name="color" id="color">
```
<input type="color" name="color" id="color">

警告——颜色小部件支持它目前不是很好。IE中没有支持，Safari目前也不支持它。其他主要的浏览器都支持它。
# 其他小部件 #
还有一些其他的小部件由于它们非常特殊的行为而不能很容易地分类，但是它们仍然非常有用。
## 文件选择器 ##
HTML表单能够将文件发送到服务器；文件选择器小部件是用户如何选择一个或多个文件来发送的。
要创建一个文件选择器小部件，您可以使用`<input>`元素，它的type属性设置为`file`。`被接受的文件类型可以使用accept属性来约束。此外，如果您想让用户选择多个文件，那么可以通过添加multiple属性来实现`。
### 例子 ###
在本例中，创建一个文件选择器，请求图形图像文件。在本例中，允许用户选择多个文件。
```html
<input type="file" name="file" id="file" accept="image/*" multiple>
```
<hr><input type="file" name="file" id="file" accept="image/*" multiple><hr>

## 隐藏内容 ##
有时候，由于技术原因，有些数据是用表单发送的，但不显示给用户，这有时是很方便的。要做到这一点，您可以在表单中添加一个不可见的元素。要做到这一点，需要使用`<input>`和它的type属性设置为`hidden`值。
如果您创建了这样一个元素，就需要设置它的name和value属性：
```html
<input type="hidden" id="timestamp" name="timestamp" value="1286705410">
```
<hr><input type="hidden" id="timestamp" name="timestamp" value="1286705410"><hr>

## 图像按钮 ##
图像按钮控件是一个与`<img>`元素完全相同的元素，除了当用户点击它时，`它的行为就像一个提交按钮`(见上面)。
图像按钮是使用`<input>`元素创建的，`该元素的type属性设置为image值`。这个元素支持与`<img>`元素相同的属性，加上其他表单按钮支持的所有属性。
```html
<input type="image" alt="Click me!" src="my-img.png" width="80" height="30" />
```
<hr><input type="image" alt="Click me!" src="my-img.png" width="80" height="30" /><hr>

如果使用图像按钮来提交表单，这个小部件不会提交它的值；相反，在图像上单击的X和Y坐标是被提交的(坐标是相对于图像的，这意味着图像的左上角表示坐标0，0)，坐标被发送为两个键/值对：
- X值键是name属性的值，后面是字符串“.x”。
- Y值键是name属性的值，后面是字符串“.y”

例如，当您点击这个小部件的图像时，您将被发送到一个URL，如下所显示的
```
http://foo.com?pos.x=123&pos.y=456
```
## 仪表和进度条 ##
仪表和进度条是数值的可视化表示。
### 进度条 ###
一个进度条表示一个值，它会随着时间的变化而变化到最大的值，这个值由max属性指定。这样的一个bar是使用`<progress>`元素创建的。
```html
<progress max="100" value="75">75/100</progress>
```
<hr><progress max="100" value="75">75/100</progress><hr>

这是为了实现任何需要进度报告的内容，例如下载的总文件的百分比，或者问卷中填写的问题的数量。
`<progress>`元素中的内容是`不支持该元素的浏览器的回退`，以及辅助技术对其发出的声音。
### 仪表 ###
```html
<meter min="0" max="100" value="75" low="33" high="66" optimum="50">75</meter>
```
<meter min="0" max="100" value="75" low="33" high="66" optimum="50">75</meter>

`<meter>`元素中的内容是不支持该元素的浏览器的回退，以及辅助技术对其发出的声音。
对进度条和仪表的支持是相当不错的，**在Internet Explorer中没有支持，但是其他浏览器支持它**。
# 参考链接 #
[MDN-HTML表单指南](https://developer.mozilla.org/zh-CN/docs/Learn/HTML/Forms)
[MDN-原生表单部件](https://developer.mozilla.org/zh-CN/docs/Learn/HTML/Forms/The_native_form_widgets)
[MDN-&lt;input&gt;：输入（表单输入）元素](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Element/Input)
