---
title: LaTex 常用语法
categories: 
  - 其他
  - latex
  - LaTex语法
date: 2018-08-30 18:46:38
updated: 2019-10-30 13:53:55
mathjax: true
abbrlink: 83c2e83a
---
- [公式显示位置](/blog/html/83c2e83a/#公式显示位置)
    - [行内公式](/blog/html/83c2e83a/#行内公式)
    - [行间公式](/blog/html/83c2e83a/#行间公式)
- [数学符号](/blog/html/83c2e83a/#数学符号)
    - [上下标](/blog/html/83c2e83a/#上下标)
    - [导数符号](/blog/html/83c2e83a/#导数符号)
        - [偏导 条件偏导](/blog/html/83c2e83a/#偏导-条件偏导)
    - [分式](/blog/html/83c2e83a/#分式)
    - [根式](/blog/html/83c2e83a/#根式)
    - [无穷大符号](/blog/html/83c2e83a/#无穷大符号)
    - [省略号](/blog/html/83c2e83a/#省略号)
    - [关系符](/blog/html/83c2e83a/#关系符)
    - [巨算子](/blog/html/83c2e83a/#巨算子)
    - [极限符号](/blog/html/83c2e83a/#极限符号)
        - [行间公式极限](/blog/html/83c2e83a/#行间公式极限)
        - [行间极限](/blog/html/83c2e83a/#行间极限)
- [集合相关符号](/blog/html/83c2e83a/#集合相关符号)
    - [元素与集合的关系](/blog/html/83c2e83a/#元素与集合的关系)
        - [属于](/blog/html/83c2e83a/#属于)
        - [不属于](/blog/html/83c2e83a/#不属于)
    - [集合与集合相关的关系](/blog/html/83c2e83a/#集合与集合相关的关系)
        - [空集](/blog/html/83c2e83a/#空集)
        - [子集](/blog/html/83c2e83a/#子集)
        - [真子集](/blog/html/83c2e83a/#真子集)
        - [交集](/blog/html/83c2e83a/#交集)
        - [并集](/blog/html/83c2e83a/#并集)
- [数学重音和上下括号](/blog/html/83c2e83a/#数学重音和上下括号)
- [箭头](/blog/html/83c2e83a/#箭头)
- [括号和定界符](/blog/html/83c2e83a/#括号和定界符)
- [多行公式](/blog/html/83c2e83a/#多行公式)
    - [长公式折行](/blog/html/83c2e83a/#长公式折行)
    - [多行公式](/blog/html/83c2e83a/#多行公式)
        - [公用编号的多行公式](/blog/html/83c2e83a/#公用编号的多行公式)
    - [公式中的间距](/blog/html/83c2e83a/#公式中的间距)
- [数组和矩阵](/blog/html/83c2e83a/#数组和矩阵)
- [分段函数](/blog/html/83c2e83a/#分段函数)
- [数学符号的字体控制](/blog/html/83c2e83a/#数学符号的字体控制)
    - [数学字母字体](/blog/html/83c2e83a/#数学字母字体)
    - [数学符号的尺寸](/blog/html/83c2e83a/#数学符号的尺寸)
- [符号表](/blog/html/83c2e83a/#符号表)
    - [文本/数学模式通用符号](/blog/html/83c2e83a/#文本-数学模式通用符号)
    - [二元关系符](/blog/html/83c2e83a/#二元关系符)
    - [二元运算符](/blog/html/83c2e83a/#二元运算符)
    - [希腊字母](/blog/html/83c2e83a/#希腊字母)
        - [希腊字母顺序表](/blog/html/83c2e83a/#希腊字母顺序表)
    - [巨算符](/blog/html/83c2e83a/#巨算符)
    - [箭头](/blog/html/83c2e83a/#箭头)
    - [作为重音的箭头符号](/blog/html/83c2e83a/#作为重音的箭头符号)
    - [定界符](/blog/html/83c2e83a/#定界符)
    - [公式中的间距](/blog/html/83c2e83a/#公式中的间距)
- [参考链接](/blog/html/83c2e83a/#参考链接)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 公式显示位置 #
## 行内公式 ##
在公式两边各自加上一个美元符号即使行内公式
```
这是文本$a^2+b^2=c^2$这是文本
```
显示效果：
这是文本$a^2+b^2=c^2$这是文本
## 行间公式 ##
在公式两边各自加上两个美元符号即使行将公式：
```
这是文本$$a^2+b^2=c^2$$这是文本
```
显示效果:
这是文本$$a^2+b^2=c^2$$这是文本

# 数学符号 #
## 上下标 ##
在LaTex中用`^`和`_`表明上下标。注意如果上下标只对其后面的一个字符起作用，如果上下标的内容超过一个字符，则需要用花括号`{}`包裹，否则上下标只对后面的一个符号起作用
```
$p^3_{ij} \qquad \sum_{K=1}^3 k a^x+y \qquad  \neq a^{x+y}$
```
显示效果：
$p^3_{ij} \qquad \sum_{K=1}^3 k a^x+y \qquad  \neq a^{x+y}$
## 导数符号 ##
导数符号`'`是一个特殊的上标，可以适当连用表示多阶导数，也可以在其后连用上标：
```
$f(x)=x^2 \quad f'(x)=2x \quad f''^{2}=4$
```
显示效果:
$f(x)=x^2 \quad f'(x)=2x \quad f''^{2}=4$
### 偏导 条件偏导 ###
偏导符号$\partial$
```
$\left.\frac{\partial f(x,y)}{\partial x}\right|_{x=0}$
```
$\left.\frac{\partial f(x,y)}{\partial x}\right|_{x=0}$
## 分式 ##

如果是简单的根式，可以写成斜分式的形式,如`3/8`:,在latex中分式一般使用`\frac{分子}{分母}`来书写。不过这种分式的大小在行间公式是正常显示大小，而在行内被极度压缩了。amsmath提供了方便的命令`\dfrac{分子}{分母}`和`\tfrac{分子}{分母}`,令用户能够在行内使用正常大小的行内公式。
显示效果:
```
斜分式: $3/8 \qquad $,压缩分式：$\frac{3}{8}\qquad$ ,显示正常大小：$\dfrac{3}{8}$
```
斜分式: $3/8 \qquad $,压缩分式：$\frac{3}{8}\qquad$ ,显示正常大小：$\dfrac{3}{8}$
## 根式 ##
一般的根式使用`\sqrt{…}`表示，表示n此方根式写成`\sqrt[n]{…}`:
```
$\sqrt{x} \Leftrightarrow x^{1/2}
\quad \sqrt[3]{2}
\quad \sqrt{x^{2}+\sqrt{y}}$
$
```
显示效果:
$\sqrt{x} \Leftrightarrow x^{1/2}
\quad \sqrt[3]{2}
\quad \sqrt{x^{2}+\sqrt{y}}
$
特殊的分式形式，如二项式结构，由amsmath宏包的\binom命令生成：
```
Pascal's rule is
$$
\binom{n}{k}=\binom{n-1}{k}+\binom{n-1}{k-1}
$$
```
Pascal's rule is
$$
\binom{n}{k}=\binom{n-1}{k}+\binom{n-1}{k-1}
$$


## 无穷大符号 ##
```
$\infty$
```
$\infty$

这个是个缩写，原单词:<input type="button" onclick="paly_audioID20181123132026();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/infinity">\infinity</a>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=infinity&spd=3&source=web" id="audioID20181123132026"></audio>
<script>
    function paly_audioID20181123132026() {
        var audioID20181123132026 = document.getElementById("audioID20181123132026");
        if (audioID20181123132026 != null) {
            audioID20181123132026.play();
        }
    }
</script>

## 省略号 ##
省略号有$\dots$(\dots)和$cdots$(`\cdots`)两种形式。他们有各自合适的用途：
```
$a_1,a_2,\dots,a_n$
$a_1,a_2,\cdots,a_n$
```
显示效果如下：
$a_1,a_2,\dots,a_n$
$a_1,a_2,\cdots,a_n$

\ldost和\dots是完全等效的，它们既能用在公式中，也用在文本里作为省略号。
除此之外，在矩阵中可能会用到竖排的$\vdots$(\vdots)和斜排的$\ddots$(\ddots)

## 关系符 ##

LaTex常见的关系符号除了可以直接输入的=,>,<，其他符号用命令输入，常用的有不等于: $\ne$ (\ne),大于等于号: $\ge$ (\ge)和小于等于号:$\le$  (\le),约等于号: $\approx$ (\approx),等价 $\equiv$ (\equiv),正比: $\propto$ (\propto),相似: $\sim$ (\sim)等等。
LaTex还提供了自定义二元关系符的命令`\stackrel`,用于将一个符号叠加在原有的二元关系符之上：
```
$$
f_n(x) \stackrel{*}{\approx} 1
$$
```
$$
f_n(x) \stackrel{*}{\approx} 1
$$

## 巨算子 ##

积分号$\int$(\int),求和号$\sum$(\sum)等符号称为**[巨算子](http://texdoc.net/texmf-dist/doc/latex/lshort-chinese/lshort-zh-cn.pdf#54)**。巨算子在行内公式和行间公式的大小形状有区别
```
在行内显示:$\sum_{i=1}^n \quad
\int_0^{\frac{\pi}{2}} \quad
\oint_0^{\frac{\pi}{2}} \quad
\prod_\epsilon $
在行间显示：
$$\sum_{i=1}^n \quad
\int_0^{\frac{\pi}{2}} \quad
\oint_0^{\frac{\pi}{2}} \quad
\prod_\epsilon $$
```
在行内显示:$\sum_{i=1}^n \quad
\int_0^{\frac{\pi}{2}} \quad
\oint_0^{\frac{\pi}{2}} \quad
\prod_\epsilon $
在行间显示：

$$\sum_{i=1}^n \quad
\int_0^{\frac{\pi}{2}} \quad
\oint_0^{\frac{\pi}{2}} \quad
\prod_\epsilon $$

巨算符的上下标用作其上下限。行间公式中，积分号默认将上下限放在右上角和右下角，求和号默认在上下方；行内公式一律默认在右上角和右下角。**可以在巨算符后使用\limits手动令上下限显示在上下方**，\nolimits则相反,即不显示在上下方，也就是显示在右上角，右下角。
```
In text:
$\sum\limits_{i=1}^n \quad
\int\limits_0^{\frac{\pi}{2}} \quad
\prod\limits_\epsilon $ 
In display:
$$\sum\nolimits_{i=1}^n \quad
\int\limits_0^{\frac{\pi}{2}} \quad
\prod\nolimits_\epsilon $$
```
In text:
$\sum\limits_{i=1}^n \quad
\int\limits_0^{\frac{\pi}{2}} \quad
\prod\limits_\epsilon $ 
In display:
$$\sum\nolimits_{i=1}^n \quad
\int\limits_0^{\frac{\pi}{2}} \quad
\prod\nolimits_\epsilon $$

## 极限符号 ##
### 行间公式极限 ###
行间公式下标默认放在符号的下方，所以直接再极限符号`\lim`下方写上符号极限范围即可：
```latex
$${\lim_{x \to +\infty}}$$
```
$${\lim_{x \to +\infty}}$$
```latex
$${\lim_{x \to -\infty}}$$
```
$${\lim_{x \to -\infty}}$$
```latex
$${\lim_{x \to 0}}$$
```
$${\lim_{x \to 0}}$$
```latex
$${\lim_{x \to 0^+}}$$
```
$${\lim_{x \to 0^+}}$$
```latex
$${ \lim_{x \to 0} \frac{3x^2 +7x^3}{x^2 +5x^4} = 3}$$
```
$${ \lim_{x \to 0} \frac{3x^2 +7x^3}{x^2 +5x^4} = 3}$$
### 行间极限 ###
行间的下标默认放在右下角，可以使用`\limits_{下标}`把下标放到符号下方即可。实例如下所示：
```latex
${\lim \limits_{x \to -\infty}}$
```
行间极限符号:${\lim \limits_{x \to -\infty}}$
# 集合相关符号 #
## 元素与集合的关系 ##
### 属于 ###
```latex
\in
```
$\in$
### 不属于 ###
```latex
\notin
```
$\notin$
## 集合与集合相关的关系 ##
### 空集 ###
```
\emptyset
```
$\emptyset$
### 子集 ###
```latex
\subset
```
$\subset$
### 真子集 ###
```latex
\subseteq
```
$\subseteq$
### 交集 ###
交集符号有大小之分，只要区别在两者的显示大小上面
大交集符号`\bigcap`,显示效果:$\bigcap$
小交集符号`\cap`,显示效果:$\cap$
### 并集 ###
这里有大并集符号`\bigcup`和通常并集`\cup`符号之分
大并集符号:$\bigcup$。小并集符号:$\cup$
# 数学重音和上下括号 #
数学符号可以像文字一样**加重音**，比如对时间求导的符号$\dot{r}$(\dot{r})、$ddot{r}$(ddot{r})、表示向量的箭头$vec{r}$(vec{r})、表示欧式空间单位向量的$\hat{\mathbf{e}}$(\hat{\mathbf{e}})等，详见表[4.9](http://texdoc.net/texmf-dist/doc/latex/lshort-chinese/lshort-zh-cn.pdf#e1)。使用时要注意重音符号的作用区域，**一般应当对某个符号而不是不符号加下表使用重音：**
```
$\bar{x_0} \quad \bar{x}_0$\\[5pt]
$\vec{x_0} \quad \vec{x}_0$\\[5pt]
$\hat{\mathbf{e}_x} \quad
\hat{\mathbf{e}}_x$
```
$\bar{x_0} \quad \bar{x}_0$
$\vec{x_0} \quad \vec{x}_0$
$\hat{\mathbf{e}_x} \quad
\hat{\mathbf{e}}_x$

LATEX也能为多个字符加重音，包括直接画线的\overline和\underline命令（可叠加使用）、宽重音符号\widehat、表示向量的箭头\overrightarrow等。后两者详见表4.9和4.11等。
```
$0.\overline{3} =
\underline{\underline{1/3}}$
$\hat{XY} \qquad \widehat{XY}$
$\vec{AB} \qquad
\overrightarrow{AB}$
```
$0.\overline{3} =
\underline{\underline{1/3}}$
$\hat{XY} \qquad \widehat{XY}$
$\vec{AB} \qquad
\overrightarrow{AB}$

\overbrace和\underbrace命令用来生成上/下括号，各自可带一个上/下标公式。

```
$\underbrace{\overbrace{a+b+c}^6
\cdot \overbrace{d+e+f}^7}
_\text{meaning of life} = 42$
```
$\underbrace{\overbrace{a+b+c}^6
\cdot \overbrace{d+e+f}^7}
_\text{meaning of life} = 42$


# 箭头 #

除了作为上下标之外，箭头还用于表示过程。amsmath的`\xleftarrow`和`\xrightarrow`命令可以为箭头增加上下标：
```
$$ a\xleftarrow{x+y+z} b $$
$$c\xrightarrow[x<y]{a\*b\*c}d $$
```
$$ a\xleftarrow{x+y+z} b$$
$$c\xrightarrow[x<y]{a\*b\*c}d $$

注意，这里`$$c\xrightarrow[x<y]{a\*b\*c}d $$`乘号前面加转义符是让Markdown引擎不解析这两个星号，因为两个连续的星号，markdown会解析成斜体字。

# 括号和定界符 #

LATEX提供了多种括号和定界符表示公式块的边界。除小括号( )、中括号[ ]之外，其余都是LATEX命令，包括大括号\{ \}。表4.12和4.13给出了更多的括号/定界符命令。
```
${a,b,c} \neq \{a,b,c\}$
```
${a,b,c} \neq \{a,b,c\}$

使用\left和\right命令可令括号（定界符）的大小可变，在行间公式中常用。LATEX会自动根据括号内的公式大小决定定界符大小。\left和\right必须成对使用。需要使用单个定界符时，另一个定界符写成\left.或\right.。
```
\[1 + \left(\frac{1}{1-x^{2}}
\right)^3 \qquad
\left.\frac{\partial f}{\partial t}
\right|_{t=0}\]
```
$$1 + \left(\frac{1}{1-x^{2}}
\right)^3 \qquad
\left.\frac{\partial f}{\partial t}
\right|_{t=0}$$

# 多行公式 #
## 长公式折行 ##
通常来讲应当避免写出超过一行而需要折行的长公式。如果一定要折行的话，优先在等号之前折行，其次在加号、减号之前，再次在乘号、除号之前。其它位置应当避免折行。
amsmath宏包的multline环境提供了书写折行长公式的方便环境。它允许用`\\\\`(markdown中显示:\\\\)折行，**将公式编号放在最后一行**。多行公式的**首行左对齐**，**末行右对齐**，**其余行居中**。
因为markdown中`\`是转义符，所以`\\`才表示一个\\,所以这里要写四个`\`(`\\\\`)
```
$\begin{multline}
a + b + c + d + e + f+ g + h + i \\
= j + k + l + m + n\\
= o + p + q + r + s\\
= t + u + v + x + z
\end{multline}$
```
$\begin{multline}a + b + c + d + e + f+ g + h + i \\
= j + k + l + m + n\\
= o + p + q + r + s\\= t + u + v + x + z\end{multline}$

与表格不同的是，公式的最后一行不写`\\`，如果写了，反倒会产生一个多余的空行。类似equation\*，multline\*环境排版不带编号的折行长公式。

## 多行公式 ##
更多的情况是，我们需要罗列一系列公式，并令其按照等号对齐。读者可能阅读过其它手册或者资料，知道LATEX提供了eqnarray环境。它按照等号左边——等号——等号右边呈三列对齐，但等号周围的空隙过大，加上公式编号等一些bug，目前已不推荐使用

**目前最常用的是align环境，它将公式用&隔为两部分并对齐。分隔符通常放在等号左边：**
```
\begin{align}
a & = b + c \\
& = d + e
\end{align}
```
$\begin{align}
a & = b + c \\
& = d + e
\end{align}$

`align`环境会给每行公式都编号。我们仍然可以用`\notag`去掉某行的编号。在以下的例子，为了对齐加号，我们将分隔符放在等号右边，这时需要给等号后添加一对括号{}以产生正常的间距：
```
$\begin{align}
a ={} & b + c \\
={} & d + e + f + g + h + i
+ j + k + l \notag \\
& + m + n + o \\
={} & p + q + r + s
\end{align}$
```
$\begin{align}
a ={} & b + c \\
={} & d + e + f + g + h + i+ j + k + l \notag \\
& + m + n + o \\
={} & p + q + r + s
\end{align}$

align还能够对齐多组公式，除等号前的&之外，公式之间也用&分隔：
```
$\begin{align}
a &=1  &  b &=2   & c &=3   \\
d &=-1 &  e &=-2  & f &=-5
\end{align}$
```
$\begin{align}
a &=1  &  b &=2   & c &=3   \\
d &=-1 &  e &=-2  & f &=-5
\end{align}$

如果我们不需要按等号对齐，只需罗列数个公式，gather将是一个很好用的环境：
```
$\begin{gather}
a = b + c \\
d = e + f + g \\
h + i = j + k \notag \\
l + m = n
\end{gather}$
```
$\begin{gather}
a = b + c \\
d = e + f + g \\
h + i = j + k \notag \\
l + m = n
\end{gather}$

align和gather有对应的不带编号的版本align\*和gather\*。

### 公用编号的多行公式 ###
另一个常见的需求是将多个公式组在一起公用一个编号，编号位于公式的居中位置。为此，amsmath宏包提供了诸如aligned、gathered等环境，与equation环境套用。以-ed结尾的环境用法与前一节不以-ed结尾的环境用法一一对应。我们仅以aligned举例：
```
$\begin{equation}
\begin{aligned}
a &= b + c \\
d &= e + f + g \\
h + i &= j + k \\
l + m &= n
\end{aligned}
\end{equation}$
```
$\begin{equation}
\begin{aligned}
a &= b + c \\
d &= e + f + g \\
h + i &= j + k \\
l + m &= n
\end{aligned}
\end{equation}$

split环境和aligned环境用法类似，也用于和equation环境套用，区别是split只能将每行的一个公式分两栏，aligned允许每行多个公式多栏。
## 公式中的间距 ##

前文提到过，绝大部分时候，数学公式中各元素的间距是根据符号类型自动生成的，需要我们手动调整的情况极少。我们已经认识了两个生成间距的命令`\quad`和`\qquad`。在公式中我们还可能用到的间距包括`\,`、`\:`、`\;`以及负间距`\!`，其中`\quad`、`\qquad`和`\,`在文本和数学环境中可用，后三个命令只用于数学环境。文本中的`\␣`也能使用在数学公式中。
此处应该有图片，但是我的图片好像用不了了

一个常见的用途是修正积分的被积函数$f(x)$和微元$dx$之间的距离。注意微元里的$d$用的是直立体：
```
$$
\int_a^b f(x)\mathrm{d}x
\qquad
\int_a^b f(x)\,\mathrm{d}x
$$
```
$$
\int_a^b f(x)\mathrm{d}x
\qquad
\int_a^b f(x)\,\mathrm{d}x
$$

另一个用途是生成多重积分号。如果我们直接连写两个\int，之间的间距将会过宽，此时可以使用负间距\\!修正之。不过amsmath提供了更方便的多重积分号，如**二重积分`\iint`**、**三重积分`\iiint`**等。
```
$$\newcommand\diff{\,\mathrm{d}}
\begin{gather\*}
\int\int f(x)g(y)
\diff x \diff y \\
\int\\!\\!\\!\int
f(x)g(y) \diff x \diff y \\
\iint f(x)g(y) \diff x \diff y \\
\iint\quad \iiint\quad \idotsint
\end{gather\*}$$
```
这上面还是有问题的，我在hexo mathjax的marked.js（在./node_modules/marked/lib/中）修改了：
```
//escape: /^\\([\\`*{}\[\]()#$+\-.!_>])/, 
//它取消了该渲染引擎对\,{,}的转义
  escape: /^\\([`*\[\]()#$+\-.!_>])/,
```
取消了`\\`的转义，但是这了`\i`还是现实错误，我不知道该怎么弄，所以，上面的代码中使用`\\i`代替`\i`。修改源码需谨慎。
$$\newcommand\diff{\,\mathrm{d}}
\begin{gather\*}
\int\int f(x)g(y)
\diff x \diff y \\
\int\\!\\!\\!\int
f(x)g(y) \diff x \diff y \\
\iint f(x)g(y) \diff x \diff y \\
\iint\quad \iiint\quad \idotsint
\end{gather\*}$$

# 数组和矩阵 #
为了排版二维数组，LATEX提供了array环境，用法与tabular环境极为类似，也需要定义列格式，并用\\换行。数组可作为一个公式块，在外套用\left、\right等定界符:
```
$$ \mathbf{X} = \left(
\begin{array}{cccc}
x_{11} & x_{12} & \ldots & x_{1n}\\
x_{21} & x_{22} & \ldots & x_{2n}\\
\vdots & \vdots & \ddots & \vdots\\
x_{n1} & x_{n2} & \ldots & x_{nn}\\
\end{array}
\right) $$
```
还是因为是在markdown文档中`\`需要转义，所以两个斜杠:`\\`,在markdown文档中需要使用四个斜杠:`\\\\`来表示
$$ \mathbf{X} = \left(
\begin{array}{cccc}
x_{11} & x_{12} & \ldots & x_{1n}\\
x_{21} & x_{22} & \ldots & x_{2n}\\
\vdots & \vdots & \ddots & \vdots\\
x_{n1} & x_{n2} & \ldots & x_{nn}\\
\end{array}
\right) $$

值得注意的是，上一节末尾介绍的aligned等环境也可以用定界符包裹。我们还可以利用空的定界符排版出这样的效果：
```
\[ |x| = \left\{
\begin{array}{rl}
-x & \text{if } x < 0,\\
0 & \text{if } x = 0,\\
x & \text{if } x > 0.
\end{array} \right. \]
```
\[ |x| = \left\{
\begin{array}{rl}
-x & \text{if } x < 0,\\
0 & \text{if } x = 0,\\
x & \text{if } x > 0.
\end{array} \right. \]

我不知道这里为什么显示不正常，可以能不支持把，下面的例子同样也可额完成，衣柜对于分段函数可以写下面的这种形式。
# 分段函数 #
不过上述例子可以用amsmath提供的cases环境更轻松地完成：
```
$$ |x| =
\begin{cases}
-x & \text{if } x < 0,\\
0 & \text{if } x = 0,\\
x & \text{if } x > 0.
\end{cases} $$
```
$$ |x| =
\begin{cases}
-x & \text{if } x < 0,\\
0 & \text{if } x = 0,\\
x & \text{if } x > 0.
\end{cases} $$

我们当然也可以用array环境排版各种矩阵。amsmath宏包还直接提供了多种排版矩阵的环境，包括不带定界符的matrix，以及带各种定界符的矩阵pmatrix（(）、bmatrix（[）、Bmatrix（{）、vmatrix（）、Vmatrix（）。使用这些环境时，无需给定列格式5：

```
\[
\begin{matrix}
1 & 2 \\ 3 & 4
\end{matrix} \qquad
\begin{bmatrix}
x_{11} & x_{12} & \ldots & x_{1n}\\
x_{21} & x_{22} & \ldots & x_{2n}\\
\vdots & \vdots & \ddots & \vdots\\
x_{n1} & x_{n2} & \ldots & x_{nn}\\
\end{bmatrix}
\]
```
$$
\begin{matrix}
1 & 2 \\\\ 3 & 4
\end{matrix} \qquad
\begin{bmatrix}
x_{11} & x_{12} & \ldots & x_{1n}\\
x_{21} & x_{22} & \ldots & x_{2n}\\
\vdots & \vdots & \ddots & \vdots\\
x_{n1} & x_{n2} & \ldots & x_{nn}\\
\end{bmatrix}
$$

在矩阵中的元素里排版分式时，一来要用到\dfrac等命令，二来行与行之间有可能紧贴着，这时要用到3.6.6小节的方法来调节间距：
```
$$
\mathbf{H}=
\begin{bmatrix}
\dfrac{\partial^2 f}{\partial x^2} &
\dfrac{\partial^2 f}
{\partial x \partial y} \\[8pt]
\dfrac{\partial^2 f}
{\partial x \partial y} &
\dfrac{\partial^2 f}{\partial y^2}
\end{bmatrix}
$$
```
$$
\mathbf{H}=
\begin{bmatrix}
\dfrac{\partial^2 f}{\partial x^2} &
\dfrac{\partial^2 f}
{\partial x \partial y} \\  \[8pt]
\dfrac{\partial^2 f}
{\partial x \partial y} &
\dfrac{\partial^2 f}{\partial y^2}
\end{bmatrix}
$$


# 数学符号的字体控制 #
## 数学字母字体 ##
LATEX允许一部分数学符号切换字体，主要是拉丁字母、数字等等。表4.2给出了切换字体的命令。某一些命令需要字体宏包的支持。
```
$\mathcal{R} \quad \mathfrak{R}
\quad \mathbb{R}$
$$\mathcal{L}
= -\frac{1}{4}F_{\mu\nu}F^{\mu\nu}$$
$\mathfrak{su}(2)$ and
$\mathfrak{so}(3)$ Lie algebr
```
$\mathcal{R} \quad \mathfrak{R}
\quad \mathbb{R}$
$$\mathcal{L}
= -\frac{1}{4}F_{\mu\nu}F^{\mu\nu}$$
$\mathfrak{su}(2)$ and
$\mathfrak{so}(3)$ Lie algebr
## 数学符号的尺寸 ##
数学符号按照符号排版的位置规定尺寸，从大到小包括行间公式尺寸、行内公式尺寸、上下标尺寸、次级上下标尺寸。除了字号有别之外，行间和行内公式尺寸下的巨算符也使用不一样的大小。LATEX为每个数学尺寸指定了一个切换的命令，见4.3。
例如行间公式的分式内，分子分母使用行内公式尺寸，巨算符采用行内尺寸的形式。对比一下分子分母使用\displaystyle命令与否的区别：
这里有一个表格

```
$$
P = \frac
{\sum_{i=1}^n (x_i- x)(y_i- y)}
{\displaystyle \left[
\sum_{i=1}^n (x_i-x)^2
\sum_{i=1}^n (y_i-y)^2
\right]^{1/2} }
$$
```
$$
P = \frac
{\sum_{i=1}^n (x_i- x)(y_i- y)}
{\displaystyle \left[
\sum_{i=1}^n (x_i-x)^2
\sum_{i=1}^n (y_i-y)^2
\right]^{1/2} }
$$

# 符号表 #
后面把这些符号表粘贴进来就行了，后面的那些不需要再看了，保留官方文档的连接，现在只要留个印象。

## 文本/数学模式通用符号 ##

|文本/数学模式通用符号|命令|
|:-|:-|
|$\{$|\{|
|$\}$|\}|
|$\$$|\$|
|$\%$|\%|
|$\dag$|\dag|
|$\S$|\S|
|$\copyright$|\copyright|
|$\dots$|\dots|
|$\ddag$|\ddag|
|$\P$|\P|
|$\pounds$|\pounds|


## 二元关系符 ##

有的二元关系符都可以加\not前缀得到相反意义的关系符，例如\not=就得到不等号（同\ne）。

|效果|命令|效果|命令|效果|命令|
|-:|:-|-:|:-|-:|:-|
|$<$|<|$>$|>|$=$|=|
|$\leq$|\leq or \le|$\ge$|\geq or \ge|$\equiv$|\equiv|
|$\ll$|\ll|$\gg$|\gg|$\doteq$|\doteq|
|$\prec$|\prec|$\succ$|\succ|$\sim$|\sim|
|$\preceq$|\preceq|$\succeq$|\succeq|$\simeq$|\simeq|
|$\subset$|\subset|$\supset$|\supset|$\approx$|\approx|
|$\subseteq$|\subseteq|$\supseteq$|\supseteq|$\cong$|\cong|
|$\sqsubset$|\sqsubset|$\sqsupset$|\sqsupset|$\Join$|\Join|
|$\sqsubseteq$|\sqsubseteq|$\sqsupseteq$|\sqsupseteq|$\bowtie$|\bowtie|
|$\in$|\in|$\ni$|\ni or \owns|$\propto$|\propto|
|$\vdash$|\vdash|$\dashv$|\dashv|$\models$|\models|
|$\mid$|\mid|$\parallel$|\parallel|$\perp$|\perp|
|$\smile$|\smile|$\frown$|\frown|$\asymp$|\asymp|
|$:$|:|$\notin$|\notin|$\ne$|\neq or \ne|
## 二元运算符 ##
LaTex中的算符大多数是二元算符，除了直接用键盘可以输入的+，-，*，/外，其他符号用命令输入，常用的符号有乘号：$\times$(\times),除号: $\div$ (\div),点乘: $\cdot$ (\cdot),加减号 $\pm$ (\pm) 或者 $\mp$ (\mp)等等。更多符号命令可参考表4.7以及表4.17 
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/latex/tables/eryuanyunsuan.png)
## 希腊字母 ##

latex希腊字母符号代码就是`斜杠+其英文名称`，如`$\alpha$`:$\alpha$,`$\beta$`:$\beta$...等。
大写的latex希腊字母就是`斜杠+首字母大写的英文名称`，如`$\Gamma$`:$\Gamma$,`$\Delta$`:$\Delta$...。
\Alpha，\Beta等希腊字母符号不存在，因为它们和拉丁字母A,B等一模一样；小写字母里也不存在\omicron，可以直接用字母`o`代替，省的打那么长的代码。

|效果|命令|效果|命令|效果|命令|效果|命令|
|-:|:-|-:|:-|-:|:-|-:|:-|
|$\alpha$|<input type="button" onclick="paly_audioID20181123121312();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/alpha">\alpha</a>|$\theta$|<input type="button" onclick="paly_audioID20181123122135();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/theta">\theta</a>|$o$|o|$\upsilon$|<input type="button" onclick="paly_audioID20181123122254();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/upsilon">\upsilon</a>|
|$\beta$|<input type="button" onclick="paly_audioID20181123122456();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/beta">\beta</a>|$\vartheta$|<input type="button" onclick="paly_audioID20181123122555();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/vartheta">\vartheta</a>|$\pi$|<input type="button" onclick="paly_audioID20181123122823();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/pi">\pi</a>|$\phi$|<input type="button" onclick="paly_audioID20181123123338();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/phi">\phi</a>|
|$\gamma$|<input type="button" onclick="paly_audioID20181123123438();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/gamma">\gamma</a>|$\iota$|<input type="button" onclick="paly_audioID20181123123517();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/iota">\iota</a>|$\varpi$|\varpi|$\varphi$|\varphi|
|$\delta$|<input type="button" onclick="paly_audioID20181123124010();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/delta">\delta</a>|$\kappa$|<input type="button" onclick="paly_audioID20181123124102();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/kappa">\kappa</a>|$\rho$|<input type="button" onclick="paly_audioID20181123124140();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/rho">\rho</a>|$\chi$|<input type="button" onclick="paly_audioID20181123124313();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/chi">\chi</a>|
|$\epsilon$|<input type="button" onclick="paly_audioID20181123124355();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/epsilon">epsilon</a>|$\lambda$|<input type="button" onclick="paly_audioID20181123124424();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/lambda">\lambda</a>|$\varrho$|\varrho|$\psi$|<input type="button" onclick="paly_audioID20181123124455();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/psi">\psi</a>|
|$\varepsilon$|\varepsilon|$\mu$|<input type="button" onclick="paly_audioID20181123124600();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/mu">\mu</a>|$\sigma$|<input type="button" onclick="paly_audioID20181123124628();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/sigma">\sigma</a>|$\omega$|<input type="button" onclick="paly_audioID20181123124656();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/omega">\omega</a>第24位|
|$\zeta$|<input type="button" onclick="paly_audioID20181123124728();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/zeta">\zeta</a>|$\nu$|<input type="button" onclick="paly_audioID20181123124755();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/nu">\nu</a>|$\varsigma$|\varsigma|||
|$\eta$|<input type="button" onclick="paly_audioID20181123124856();" value="播放" /><a href="http://dict.youdao.com/search?q=eta&keyfrom=new-fanyi.smartResult">\eta</a>|$\xi$|<input type="button" onclick="paly_audioID20181123130726();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/xi">\xi</a>|$\tau$|<input type="button" onclick="paly_audioID20181123130836();" value="播放" /><a href="https://fanyi.baidu.com/?#en/zh/tau">\tau</a>||| 
|$\Gamma$|\Gamma|$\Lambda$|\Lambda|$\Sigma$|\Sigma|$\Psi$|\Psi|
|$\Delta$|\Delta|$\Xi$|\Xi|$\Upsilon$|\Upsilon|$\Omega$|\Omega|
|$\Theta$|\Theta|$\Pi$|\Pi|$\Phi$|\Phi|||
|$\varGamma$|\varGamma|$\varLambda$|\varLambda|$\varSigma$|\varSigma|$\varPsi$|\varPsi|
|$\varDelta$|\varDelta|$\varXi$|\varXi|$\varUpsilon$|\varUpsilon|$\varOmega$|\varOmega|
|$\varTheta$|\varTheta|$\varPi$|\varPi|$\varPhi$|\varPhi|

<audio src="http://fanyi.baidu.com/gettts?lan=en&text=tau&spd=3&source=web" id="audioID20181123130836"></audio>
<script>
    function paly_audioID20181123130836() {
        var audioID20181123130836 = document.getElementById("audioID20181123130836");
        if (audioID20181123130836 != null) {
            audioID20181123130836.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=xi&spd=3&source=web" id="audioID20181123130726"></audio>
<script>
    function paly_audioID20181123130726() {
        var audioID20181123130726 = document.getElementById("audioID20181123130726");
        if (audioID20181123130726 != null) {
            audioID20181123130726.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=eta&spd=3&source=web" id="audioID20181123124856"></audio>
<script>
    function paly_audioID20181123124856() {
        var audioID20181123124856 = document.getElementById("audioID20181123124856");
        if (audioID20181123124856 != null) {
            audioID20181123124856.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=nu&spd=3&source=web" id="audioID20181123124755"></audio>
<script>
    function paly_audioID20181123124755() {
        var audioID20181123124755 = document.getElementById("audioID20181123124755");
        if (audioID20181123124755 != null) {
            audioID20181123124755.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=zeta&spd=3&source=web" id="audioID20181123124728"></audio>
<script>
    function paly_audioID20181123124728() {
        var audioID20181123124728 = document.getElementById("audioID20181123124728");
        if (audioID20181123124728 != null) {
            audioID20181123124728.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=omega&spd=3&source=web" id="audioID20181123124656"></audio>
<script>
    function paly_audioID20181123124656() {
        var audioID20181123124656 = document.getElementById("audioID20181123124656");
        if (audioID20181123124656 != null) {
            audioID20181123124656.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=sigma&spd=3&source=web" id="audioID20181123124628"></audio>
<script>
    function paly_audioID20181123124628() {
        var audioID20181123124628 = document.getElementById("audioID20181123124628");
        if (audioID20181123124628 != null) {
            audioID20181123124628.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=mu&spd=3&source=web" id="audioID20181123124600"></audio>
<script>
    function paly_audioID20181123124600() {
        var audioID20181123124600 = document.getElementById("audioID20181123124600");
        if (audioID20181123124600 != null) {
            audioID20181123124600.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=psi&spd=3&source=web" id="audioID20181123124455"></audio>
<script>
    function paly_audioID20181123124455() {
        var audioID20181123124455 = document.getElementById("audioID20181123124455");
        if (audioID20181123124455 != null) {
            audioID20181123124455.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=lambda&spd=3&source=web" id="audioID20181123124424"></audio>
<script>
    function paly_audioID20181123124424() {
        var audioID20181123124424 = document.getElementById("audioID20181123124424");
        if (audioID20181123124424 != null) {
            audioID20181123124424.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=epsilon&spd=3&source=web" id="audioID20181123124355"></audio>
<script>
    function paly_audioID20181123124355() {
        var audioID20181123124355 = document.getElementById("audioID20181123124355");
        if (audioID20181123124355 != null) {
            audioID20181123124355.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=chi&spd=3&source=web" id="audioID20181123124313"></audio>
<script>
    function paly_audioID20181123124313() {
        var audioID20181123124313 = document.getElementById("audioID20181123124313");
        if (audioID20181123124313 != null) {
            audioID20181123124313.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=rho&spd=3&source=web" id="audioID20181123124140"></audio>
<script>
    function paly_audioID20181123124140() {
        var audioID20181123124140 = document.getElementById("audioID20181123124140");
        if (audioID20181123124140 != null) {
            audioID20181123124140.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=kappa&spd=3&source=web" id="audioID20181123124102"></audio>
<script>
    function paly_audioID20181123124102() {
        var audioID20181123124102 = document.getElementById("audioID20181123124102");
        if (audioID20181123124102 != null) {
            audioID20181123124102.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=delta&spd=3&source=web" id="audioID20181123124010"></audio>
<script>
    function paly_audioID20181123124010() {
        var audioID20181123124010 = document.getElementById("audioID20181123124010");
        if (audioID20181123124010 != null) {
            audioID20181123124010.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=iota&spd=3&source=web" id="audioID20181123123517"></audio>
<script>
    function paly_audioID20181123123517() {
        var audioID20181123123517 = document.getElementById("audioID20181123123517");
        if (audioID20181123123517 != null) {
            audioID20181123123517.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=gamma&spd=3&source=web" id="audioID20181123123438"></audio>
<script>
    function paly_audioID20181123123438() {
        var audioID20181123123438 = document.getElementById("audioID20181123123438");
        if (audioID20181123123438 != null) {
            audioID20181123123438.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=phi&spd=3&source=web" id="audioID20181123123338"></audio>
<script>
    function paly_audioID20181123123338() {
        var audioID20181123123338 = document.getElementById("audioID20181123123338");
        if (audioID20181123123338 != null) {
            audioID20181123123338.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=pi&spd=3&source=web" id="audioID20181123122823"></audio>
<script>
    function paly_audioID20181123122823() {
        var audioID20181123122823 = document.getElementById("audioID20181123122823");
        if (audioID20181123122823 != null) {
            audioID20181123122823.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=vartheta&spd=3&source=web" id="audioID20181123122555"></audio>
<script>
    function paly_audioID20181123122555() {
        var audioID20181123122555 = document.getElementById("audioID20181123122555");
        if (audioID20181123122555 != null) {
            audioID20181123122555.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=beta&spd=3&source=web" id="audioID20181123122456"></audio>
<script>
    function paly_audioID20181123122456() {
        var audioID20181123122456 = document.getElementById("audioID20181123122456");
        if (audioID20181123122456 != null) {
            audioID20181123122456.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=upsilon&spd=3&source=web" id="audioID20181123122254"></audio>
<script>
    function paly_audioID20181123122254() {
        var audioID20181123122254 = document.getElementById("audioID20181123122254");
        if (audioID20181123122254 != null) {
            audioID20181123122254.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=theta&spd=3&source=web" id="audioID20181123122135"></audio>
<script>
    function paly_audioID20181123122135() {
        var audioID20181123122135 = document.getElementById("audioID20181123122135");
        if (audioID20181123122135 != null) {
            audioID20181123122135.play();
        }
    }
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=alpha&spd=3&source=web" id="audioID20181123121312"></audio>
<script>
    function paly_audioID20181123121312() {
        var audioID20181123121312 = document.getElementById("audioID20181123121312");
        if (audioID20181123121312 != null) {
            audioID20181123121312.play();
        }
    }
</script>

### 希腊字母顺序表 ###
|序号|大写|小写|英文|读音|
|:--|:--|:--|:--|:--|
|1|$A$|$\alpha$|<a href="https://fanyi.baidu.com/?#en/zh/alpha">alpha</a>|<img src="/images/play.png" onclick="paly_audioID5JswJVVW();" class="shake-little" style="border: 0px;" title="点击播放">|
|2|$B$|$\beta$|<a href="https://fanyi.baidu.com/?#en/zh/beta">beta</a>|<img src="/images/play.png" onclick="paly_audioID5JswJW1a();" class="shake-little" style="border: 0px;" title="点击播放">|
|3|$\Gamma$|$\gamma$|<a href="https://fanyi.baidu.com/?#en/zh/gamma">gamma</a>|<img src="/images/play.png" onclick="paly_audioID5JswJW2P();" class="shake-little" style="border: 0px;" title="点击播放">|
|4|$\Delta$|$\delta$|<a href="https://fanyi.baidu.com/?#en/zh/delta">delta</a>|<img src="/images/play.png" onclick="paly_audioID5JswJW5S();" class="shake-little" style="border: 0px;" title="点击播放">|
|5|$E$|$\epsilon$|<a href="https://fanyi.baidu.com/?#en/zh/epsilon">epsilon</a>|<img src="/images/play.png" onclick="paly_audioID5JswJW7B();" class="shake-little" style="border: 0px;" title="点击播放">|
|6|$Z$|$\zeta$|<a href="https://fanyi.baidu.com/?#en/zh/zeta">zeta</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWbG();" class="shake-little" style="border: 0px;" title="点击播放">|
|7|$H$|$\eta$|<a href="https://fanyi.baidu.com/?#en/zh/eta">eta</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWdm();" class="shake-little" style="border: 0px;" title="点击播放">|
|8|$\Theta$|$\theta$|<a href="https://fanyi.baidu.com/?#en/zh/theta">theta</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWho();" class="shake-little" style="border: 0px;" title="点击播放">|
|9|$I$|$\iota$|<a href="https://fanyi.baidu.com/?#en/zh/iota">iota</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWiz();" class="shake-little" style="border: 0px;" title="点击播放">|
|10|$K$|$\kappa$|<a href="https://fanyi.baidu.com/?#en/zh/kappa">kappa</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWk9();" class="shake-little" style="border: 0px;" title="点击播放">|
|11|$\Lambda$|$\lambda$|<a href="https://fanyi.baidu.com/?#en/zh/lambda">lambda</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWnJ();" class="shake-little" style="border: 0px;" title="点击播放">|
|12|$M$|$\mu$|<a href="https://fanyi.baidu.com/?#en/zh/mu">mu</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWqk();" class="shake-little" style="border: 0px;" title="点击播放">|
|13|$N$|$\nu$|<a href="https://fanyi.baidu.com/?#en/zh/nu">nu</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWtG();" class="shake-little" style="border: 0px;" title="点击播放">|
|14|$\Xi$|$\xi$|<a href="https://fanyi.baidu.com/?#en/zh/xi">xi</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWvh();" class="shake-little" style="border: 0px;" title="点击播放">|
|15|$O$|$\omicron$|<a href="https://fanyi.baidu.com/?#en/zh/omicron">omicron</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWx7();" class="shake-little" style="border: 0px;" title="点击播放">|
|16|$\Pi$|$\pi$|<a href="https://fanyi.baidu.com/?#en/zh/pi">pi</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWyD();" class="shake-little" style="border: 0px;" title="点击播放">|
|17|$P$|$\rho$|<a href="https://fanyi.baidu.com/?#en/zh/rho">rho</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWAc();" class="shake-little" style="border: 0px;" title="点击播放">|
|18|$\Sigma$|$\sigma$|<a href="https://fanyi.baidu.com/?#en/zh/sigma">sigma</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWIq();" class="shake-little" style="border: 0px;" title="点击播放">|
|19|$T$|$\tau$|<a href="https://fanyi.baidu.com/?#en/zh/tau">tau</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWL9();" class="shake-little" style="border: 0px;" title="点击播放">|
|20|$\Upsilon$|$\upsilon$|<a href="https://fanyi.baidu.com/?#en/zh/upsilon">upsilon</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWMK();" class="shake-little" style="border: 0px;" title="点击播放">|
|21|$\Phi$|$\phi$|<a href="https://fanyi.baidu.com/?#en/zh/phi">phi</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWNB();" class="shake-little" style="border: 0px;" title="点击播放">|
|22|$X$|$\chi$|<a href="https://fanyi.baidu.com/?#en/zh/chi">chi</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWP5();" class="shake-little" style="border: 0px;" title="点击播放">|
|23|$\Psi$|$\psi$|<a href="https://fanyi.baidu.com/?#en/zh/psi">psi</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWQE();" class="shake-little" style="border: 0px;" title="点击播放">|
|24|$\Omega$|$\omega$|<a href="https://fanyi.baidu.com/?#en/zh/omega">omega</a>|<img src="/images/play.png" onclick="paly_audioID5JswJWS3();" class="shake-little" style="border: 0px;" title="点击播放">|




<audio src="http://fanyi.baidu.com/gettts?lan=en&text=omega&spd=5&source=web" id="audioID5JswJWS3"></audio>
<script>
    function paly_audioID5JswJWS3() {var id = document.getElementById("audioID5JswJWS3");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=psi&spd=5&source=web" id="audioID5JswJWQE"></audio>
<script>
    function paly_audioID5JswJWQE() {var id = document.getElementById("audioID5JswJWQE");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=chi&spd=5&source=web" id="audioID5JswJWP5"></audio>
<script>
    function paly_audioID5JswJWP5() {var id = document.getElementById("audioID5JswJWP5");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=phi&spd=5&source=web" id="audioID5JswJWNB"></audio>
<script>
    function paly_audioID5JswJWNB() {var id = document.getElementById("audioID5JswJWNB");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=upsilon&spd=5&source=web" id="audioID5JswJWMK"></audio>
<script>
    function paly_audioID5JswJWMK() {var id = document.getElementById("audioID5JswJWMK");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=tau&spd=5&source=web" id="audioID5JswJWL9"></audio>
<script>
    function paly_audioID5JswJWL9() {var id = document.getElementById("audioID5JswJWL9");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=sigma&spd=5&source=web" id="audioID5JswJWIq"></audio>
<script>
    function paly_audioID5JswJWIq() {var id = document.getElementById("audioID5JswJWIq");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=rho&spd=5&source=web" id="audioID5JswJWAc"></audio>
<script>
    function paly_audioID5JswJWAc() {var id = document.getElementById("audioID5JswJWAc");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=pi&spd=5&source=web" id="audioID5JswJWyD"></audio>
<script>
    function paly_audioID5JswJWyD() {var id = document.getElementById("audioID5JswJWyD");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=omicron&spd=5&source=web" id="audioID5JswJWx7"></audio>
<script>
    function paly_audioID5JswJWx7() {var id = document.getElementById("audioID5JswJWx7");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=xi&spd=5&source=web" id="audioID5JswJWvh"></audio>
<script>
    function paly_audioID5JswJWvh() {var id = document.getElementById("audioID5JswJWvh");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=nu&spd=5&source=web" id="audioID5JswJWtG"></audio>
<script>
    function paly_audioID5JswJWtG() {var id = document.getElementById("audioID5JswJWtG");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=mu&spd=5&source=web" id="audioID5JswJWqk"></audio>
<script>
    function paly_audioID5JswJWqk() {var id = document.getElementById("audioID5JswJWqk");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=lambda&spd=5&source=web" id="audioID5JswJWnJ"></audio>
<script>
    function paly_audioID5JswJWnJ() {var id = document.getElementById("audioID5JswJWnJ");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=kappa&spd=5&source=web" id="audioID5JswJWk9"></audio>
<script>
    function paly_audioID5JswJWk9() {var id = document.getElementById("audioID5JswJWk9");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=iota&spd=5&source=web" id="audioID5JswJWiz"></audio>
<script>
    function paly_audioID5JswJWiz() {var id = document.getElementById("audioID5JswJWiz");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=theta&spd=5&source=web" id="audioID5JswJWho"></audio>
<script>
    function paly_audioID5JswJWho() {var id = document.getElementById("audioID5JswJWho");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=eta&spd=5&source=web" id="audioID5JswJWdm"></audio>
<script>
    function paly_audioID5JswJWdm() {var id = document.getElementById("audioID5JswJWdm");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=zeta&spd=5&source=web" id="audioID5JswJWbG"></audio>
<script>
    function paly_audioID5JswJWbG() {var id = document.getElementById("audioID5JswJWbG");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=epsilon&spd=5&source=web" id="audioID5JswJW7B"></audio>
<script>
    function paly_audioID5JswJW7B() {var id = document.getElementById("audioID5JswJW7B");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=delta&spd=5&source=web" id="audioID5JswJW5S"></audio>
<script>
    function paly_audioID5JswJW5S() {var id = document.getElementById("audioID5JswJW5S");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=gamma&spd=5&source=web" id="audioID5JswJW2P"></audio>
<script>
    function paly_audioID5JswJW2P() {var id = document.getElementById("audioID5JswJW2P");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=beta&spd=5&source=web" id="audioID5JswJW1a"></audio>
<script>
    function paly_audioID5JswJW1a() {var id = document.getElementById("audioID5JswJW1a");if (id != null) {id.play();}}
</script>
<audio src="http://fanyi.baidu.com/gettts?lan=en&text=alpha&spd=5&source=web" id="audioID5JswJVVW"></audio>
<script>
    function paly_audioID5JswJVVW() {var id = document.getElementById("audioID5JswJVVW");if (id != null) {id.play();}}
</script>

#### 参考资料 ####
[https://baike.baidu.com/item/%E5%B8%8C%E8%85%8A%E5%AD%97%E6%AF%8D/4428067?fr=aladdin#2_1](https://baike.baidu.com/item/%E5%B8%8C%E8%85%8A%E5%AD%97%E6%AF%8D/4428067?fr=aladdin#2_1)

## 巨算符 ##
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/latex/tables/jusuanfu.png)
## 箭头 ##
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/latex/tables/jiantou.png)
## 作为重音的箭头符号 ##
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/latex/tables/dingbujiantou.png)
## 定界符 ##
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/latex/tables/dingjief.png)
## 公式中的间距 ##
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/latex/latex/math/JianJu.png)
# 参考链接 #
参考文献: [http://texdoc.net/texmf-dist/doc/latex/lshort-chinese/lshort-zh-cn.pdf](http://texdoc.net/texmf-dist/doc/latex/lshort-chinese/lshort-zh-cn.pdf)
参考链接: [https://blog.csdn.net/thither_shore/article/details/52260742](https://blog.csdn.net/thither_shore/article/details/52260742)

>原文链接: [LaTex 常用语法](https://lanlan2017.github.io/blog/83c2e83a/)
