---
title: Linux cheat命令
categories:
  - 编程
  - Linux
  - 通用
  - 帮助文档
abbrlink: f8ced58d
date: 2021-05-08 23:14:49
updated: 2021-05-08 23:14:49
---
# cheat介绍
[https://github.com/cheat/cheat](https://github.com/cheat/cheat)
# cheat安装
# cheat使用
## cheat tar
```
[root@localhost sed]# cheat tar
# To extract an uncompressed archive:
tar -xvf /path/to/foo.tar

# To create an uncompressed archive:
tar -cvf /path/to/foo.tar /path/to/foo/

# To extract a .gz archive:
tar -xzvf /path/to/foo.tgz

# To create a .gz archive:
tar -czvf /path/to/foo.tgz /path/to/foo/

# To list the content of an .gz archive:
tar -ztvf /path/to/foo.tgz

# To extract a .bz2 archive:
tar -xjvf /path/to/foo.tgz

# To create a .bz2 archive:
tar -cjvf /path/to/foo.tgz /path/to/foo/

# To extract a .tar in specified Directory:
tar -xvf /path/to/foo.tar -C /path/to/destination/

# To list the content of an .bz2 archive:
tar -jtvf /path/to/foo.tgz

# To create a .gz archive and exclude all jpg,gif,... from the tgz
tar czvf /path/to/foo.tgz --exclude=\*.{jpg,gif,png,wmv,flv,tar.gz,zip} /path/to/foo/

# To use parallel (multi-threaded) implementation of compression algorithms:
tar -z ... -> tar -Ipigz ...
tar -j ... -> tar -Ipbzip2 ...
tar -J ... -> tar -Ipixz ...
[root@localhost sed]# 
```
# 参考资料
[https://zhuanlan.zhihu.com/p/32637435](https://zhuanlan.zhihu.com/p/32637435)
[https://linux.cn/article-9193-1.html](https://linux.cn/article-9193-1.html)
[https://linux.cn/article-3760-1.html](https://linux.cn/article-3760-1.html)
