---
title: 小本子
date: 2019-10-16 10:49:05
comments: false
---
## 纪念日 ##
2017-3-1
## 生日 ##
农历6月20日
## 要求 ##
- 要甜

## 备忘录 ##
### 10月 ###
- 10月26日 星期六 上午8点50学术交流中心第一会议室，佩戴党徽
- 10月26日 星球六 下午河海大学代替参见论坛
- 10月28日 星期日 图书馆续借
- 10月27日 看易烊千玺的新电影《少年的你》
- 10月31日 去西安党支部交流会.

### 11月 ###
- 11月1日 答辩,需要改一下标题.
- 11月2日 没事.见面
- 11月3日 后天要培训上党课
- 11月4日 要开学校党代会，一整天
- 1月5号上午开会，下午没事，见面
- 1月6号上午开会，中午1点半支委会，1点50党员大会，开完会后参观梅园新村，参观完了以后回学院上党课
- 11月7日 周四整天值班
- [ ] 11月8日
    - [ ] 还正装
    - [x] 去山东
- [ ] 11月11日
    - [x] 晚上8点后,还正装。
- [ ] 11月12日
    - [x] 明天2点支部大会
    - [x] 2点半文化节开幕式
    - [x] 开幕式完了就是积极分子谈话会
    - [x] 谈话完了就是群众座谈会
- [ ] 11月13日
    - [ ] 下午开会
- [ ] 11月14日值班
- 


## 计算 ##
<div id='show' style="text-align:center"></div>
<script>function timeFn() {var dateBegin = Date.parse("2017-3-1");var dateEnd = new Date();var dateDiff = dateEnd.getTime() - dateBegin;var dayDiff = Math.floor(dateDiff / (24 * 3600 * 1000));var leave1 = dateDiff % (24 * 3600 * 1000);var hours = Math.floor(leave1 / (3600 * 1000));var leave2 = leave1 % (3600 * 1000);var minutes = Math.floor(leave2 / (60 * 1000));var leave3 = leave2 % (60 * 1000);var seconds = Math.round(leave3 / 1000);var leave4 = leave3 % (60 * 1000);var timeFn = "酸臭味持续了:" + dayDiff + "天" + hours + "小时" + minutes + "分钟" + seconds + "秒";document.getElementById('show').innerText = timeFn;}setInterval("timeFn();", 1000);</script>
<div style="display: none;">
## 源码 ##
```html
<div id='show' style="text-align:center"></div>
<script>
    // 计算两个时间差 dateBegin 开始时间
    function timeFn() {
        // 预制时间
        var dateBegin = Date.parse("2017-3-1");
        //获取当前时间
        var dateEnd = new Date();
        //时间差的毫秒数
        var dateDiff = dateEnd.getTime() - dateBegin;
        //计算出相差天数
        var dayDiff = Math.floor(dateDiff / (24 * 3600 * 1000));
        //计算天数后剩余的毫秒数
        var leave1 = dateDiff % (24 * 3600 * 1000)
        //计算出小时数
        var hours = Math.floor(leave1 / (3600 * 1000))
        //计算小时数后剩余的毫秒数
        var leave2 = leave1 % (3600 * 1000)
        //计算相差分钟数
        var minutes = Math.floor(leave2 / (60 * 1000))
        //计算分钟数后剩余的毫秒数
        var leave3 = leave2 % (60 * 1000)
        //计算相差秒数
        var seconds = Math.round(leave3 / 1000)
        //计算分钟数后剩余的毫秒数
        var leave4 = leave3 % (60 * 1000)
        // 毫秒数
        var minseconds = Math.round(leave4 / 1000)
        // 拼接字符串.
        var timeFn = "酸臭味持续了:" + dayDiff + "天" + hours + "小时" + minutes + "分钟" + seconds + "秒" + minseconds + "毫秒";
        // 更新dom
        document.getElementById('show').innerText = timeFn;
    }
    setInterval("timeFn();", 1000);
</script>
```
</div>
