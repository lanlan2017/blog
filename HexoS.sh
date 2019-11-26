#! /bin/bash
# 杀死占用端口的所有进程
# kill -s 9 $(lsof -i:4007 -t)
cd /home/blue/桌面/Blog/blog9/
hexo s -p 4007
