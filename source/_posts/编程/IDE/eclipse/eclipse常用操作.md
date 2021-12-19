---
title: eclipse常用操作
categories: 
  - 编程
  - IDE
  - eclipse
date: 2020-06-23 12:33:59
updated: 2020-06-23 01:01:06
abbrlink: 653d052e
---
# eclipse快速导入包 快速移除无用包
使用`shift+ctrl+o`快捷键
# eclipse提取本地变量 提取本地方法
## eclipse提取本地变量快捷键
`alt+shit+l`快捷键可以快速把一个字符串提取成一个本地变量。具体步骤如下:
选中要提取成变量的字符串,然后按下`alt+shift+L`快捷键.
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/KuaiJieJian/1.png)
然后输入变量名,按下OK即可
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/KuaiJieJian/2.png)
提取效果如下:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/KuaiJieJian/3.png)
## eclipse提取本地方法快捷键
`alt+shift+m`可以快速把几行代码提取成一个方法。步骤和上面类似,选中要提取的那几行代码,然后站下`alt+shift+m`快捷键,然后输入方法名即可。
# eclipse正则表达式替换
## 查找替换框设置
在要替换的文件中按下`ctrl+f`打开查找替换框：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/regex/find_regex.png)
然后勾选`Regular  expressions`即可使用正则表达式进行查找替换,例如我这里要在jsp表达式`<%=.+%>`后面添加上html换行<br>标签：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/Java/IDESetting/eclipse/regex/replace.png)
具体英文意思如下：
## 英文意思
- Find ： 要搜索的内容
- Replace With ： 要地换的内容
- Direction ：方向（向前向后）
    - Forward : 向前搜索
    - Backward :向后搜索
- Scope：范围
    - All ： 文件中所有代码中进行搜索
    - Selected lines ：从选中行中进行搜索
- Options：选项
    - Case Sensitive : 区分大小写
    - Wrap search ： 搜索/替换 `到文件最底部可回到文件开头进行匹配`
    - whole word :  全词 （完全匹配 - 默认）
    - Incremental：增量匹配（输入实时匹配），在Find输入框里`增加输入时`会实时匹配（需要修改搜索/替换时选用）
    - Regular  expressions ：正则表达式 （没有使用过）

## 参考链接
[https://blog.csdn.net/superit401/article/details/80008281](https://blog.csdn.net/superit401/article/details/80008281)
[https://blog.csdn.net/a249198337/article/details/46467253](https://blog.csdn.net/a249198337/article/details/46467253)
