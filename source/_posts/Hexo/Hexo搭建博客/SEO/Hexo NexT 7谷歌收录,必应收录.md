# 安装生成站点地图的插件
```shell
npm install hexo-generator-sitemap --save
```
# 谷歌收录
## 验证网站所有权
先[翻墙](https://lanlan2017.github.io/blog/a1ad1d5d/),然后打开`Google Webmaster Tools`:[https://www.google.com/webmasters/tools](https://www.google.com/webmasters/tools),
登陆,然后选择获取`content`,
## 配置主题配置文件
打开主题配置文件
搜素:
```shell
google_site_verification
```
然后粘贴获取的:`content`即可:
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Google/6.png)
## 重新部署
```shell
hexo clean&&hexo g&&hexo d
```
## 提交站点地图
重新部署后,会在`网站根目录`下生成一个`sitemap.xml`文件,先在浏览器看看是否能正确访问到这个文件.
```shell
https://lanlan2017.github.io/sitemap.xml
```
在谷歌站长工具控制台中提交sitemap.xml的地址即可.
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Google/1.png)
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Google/2.png)
然后在已提交的站点地图,点击站点地图,可以看到索引的数量:
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Google/4.png)
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Google/5.png)

# 必应收录
必应收录和谷歌收录类似,必应收录不需要翻墙即可设置
# 百度收录
## 安装插件
```shell
npm install hexo-generator-baidu-sitemap --save
```
## 获取content

## 配置主题配置文件
打开主题配置文件,搜索:
```shell
baidu_site_verification
```
然后粘贴获取都的`content`即可
## 重新部署
```shell
hexo clean&&hexo g&&hexo d
```
然后会在站点根目录下生成站点地图文件:`baidusitemap.xml`:
```shell
https://lanlan2017.github.io/baidusitemap.xml
```
## 提交sitemap
在百度站长工具中,点击左侧的`数据引入`,`链接提交`,
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Google/8.png)
然后`下拉`,选择`自动提交`,然后选择`sitemap`,粘贴`baidusitemap.xml`的地址,`提交`即可
![这里有一张图片](https://raw.githubusercontent.com/lanlan2017/images/master/Hexo/seo/Google/9.png)

<!--
Hexo/seo/Google/
-->
# 参考资料
[https://theme-next.org/docs/theme-settings/seo](https://theme-next.org/docs/theme-settings/seo)