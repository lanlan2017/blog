---
title: Navicat for MySQL数据库的导入与导出
categories:
  - 编程
  - MySQL
  - 图形工具
abbrlink: 885d02c0
date: 2018-12-08 00:19:02
updated: 2019-12-17 05:18:52
---
<div id='my_toc'><a href="/blog/885d02c0/#导出数据库中的所有表" class="header_2">导出数据库中的所有表</a>&nbsp;<br><a href="/blog/885d02c0/#记下原来数据库的属性" class="header_3">记下原来数据库的属性</a>&nbsp;<br><a href="/blog/885d02c0/#导出原数据库中的全部" class="header_3">导出原数据库中的全部</a>&nbsp;<br><a href="/blog/885d02c0/#导入数据库" class="header_2">导入数据库</a>&nbsp;<br><a href="/blog/885d02c0/#参看文件中的信息" class="header_3">参看文件中的信息</a>&nbsp;<br><a href="/blog/885d02c0/#关键信息" class="header_4">关键信息</a>&nbsp;<br><a href="/blog/885d02c0/#新建同名数据库" class="header_3">新建同名数据库</a>&nbsp;<br><a href="/blog/885d02c0/#导入" class="header_3">导入</a>&nbsp;<br><a href="/blog/885d02c0/#Java程序说明" class="header_2">Java程序说明</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 导出数据库中的所有表 ##
### 记下原来数据库的属性 ###
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/mysql/tools/NavicatForMysql/shuxing.png)
### 导出原数据库中的全部 ###
点击要导出的数据库--`右键`--`转储SQL文件`
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/mysql/tools/NavicatForMysql/export.png)
保存到本地中
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/mysql/tools/NavicatForMysql/save.png)
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/mysql/tools/NavicatForMysql/yes.png)
## 导入数据库 ##

### 参看文件中的信息 ###
打开刚才导出的`userinfo.sql`文件:
```sql
/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : usersinfo

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2018-12-02 15:50:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `学号` varchar(20) NOT NULL DEFAULT '',
  `姓名` varchar(20) DEFAULT NULL,
  `性别` varchar(20) DEFAULT NULL,
  `专业` varchar(40) DEFAULT NULL,
  `年级` varchar(20) DEFAULT NULL,
  `出生` varchar(255) DEFAULT NULL,
  `课程` varchar(255) DEFAULT NULL,
  `成绩` double DEFAULT NULL,
  PRIMARY KEY (`学号`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('H1000', '小王', '男', '软件工程', '大二', '1996', '高等数学', '100');
INSERT INTO `student` VALUES ('H1002', '小王', '男', '软件工程', '大三', '1996', '高等数学', '100');

-- ----------------------------
-- Procedure structure for `myproc`
-- ----------------------------
DROP PROCEDURE IF EXISTS `myproc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `myproc`(in p1 int,inout p2 int,out p3 int)
begin
select p1,p2,p3;
set p1=10;
set p2=20;
set p3=30;
end
;;
DELIMITER ;

```
#### 关键信息 ####
```
Source Database       : usersinfo
File Encoding         : 65001
```
第一个信息表示原来数据库的名称在创建数据库的时候用到，
第二个表示usersinfo.sql文件的编码，在新数据库导入的时候用到：
### 新建同名数据库 ###
创建一个与原先数据库同名的数据库，同时设置数据库的属性为原先数据库的属性
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/mysql/tools/NavicatForMysql/newSameDatebase.png)
### 导入 ###
点击新建的数据库,右键，`运行SQL文件`
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/mysql/tools/NavicatForMysql/runsql.png)
找到该文件，还有要注意编码要与文件中的编码`65001`一样。
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/mysql/tools/NavicatForMysql/runSqlSetting.png)
导入成功后，新建的数据库中就有信息了，可以打开查看，如下所示：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/mysql/tools/NavicatForMysql/inputYes.png)

## Java程序说明 ##
这样就可以点击main.bat运行程序了，运行效果如下：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/mysql/daixie/connetyes.png)
可以看到数据库已经连接成功。点击菜单选项即可完成相关操作。
建议对照Nacicat中的student表格来操作Java程序：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/mysql/daixie/caozuo.png)
还有就是，程序写入数据库的时候，Navicat中的数据不会更新，为了查看效果，请项关闭usersifo数据库，然后在打开，就可以看到Java程序更新的数据：
![](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/mysql/daixie/guanbidakai.png)
