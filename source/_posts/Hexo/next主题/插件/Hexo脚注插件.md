---
title: Hexo脚注插件
categories:
  - Hexo
  - next主题
  - 插件
abbrlink: 65d90bd2
date: 2021-09-14 10:50:36
updated: 2021-09-14 10:50:36
---
# 插件的安装和使用
MMD 的脚注语法得到广泛的传播和认可，大部分的 Markdown 编辑器现在都采用了该语法来渲染脚注。可是 Hexo 的默认渲染器是不支持脚注语法的，所以我写了这个简单的 Reference 插件GitHub stars来实现脚注的渲染。该插件已收录于 Hexo 官方插件页。插件的安装和使用非常的简单，只需要进入博客目录，然后安装：
```bash
npm install hexo-reference --save
```
便可在文章中使用相关语法插入脚注了。
## 示例

<pre>
basic footnote[&#94;1]
here is an inline footnote[&#94;2](inline footnote)
and another one[&#94;3]
and another one[&#94;4]
其他正文...
[&#94;1]: basic footnote content
[&#94;3]: paragraph footnote content
[&#94;4]: footnote content with some [markdown](https://en.wikipedia.org/wiki/Markdown)
</pre>

basic footnote[^1]
here is an inline footnote[^2](inline footnote)
and another one[^3]
and another one[^4]

# 参考资料
https://kchen.cc/2016/11/10/footnotes-in-hexo/
https://github.com/kchen0x/hexo-reference


## 脚注
[^1]: basic footnote content
[^3]: paragraph footnote content
[^4]: footnote content with some [markdown](https://en.wikipedia.org/wiki/Markdown)