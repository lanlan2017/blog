---
title: Linux流编辑命令sed
categories:
  - 编程
  - Linux
  - 通用
  - 正则表达式
abbrlink: ce005e75
date: 2021-05-03 15:32:51
updated: 2021-05-03 15:32:51
---
# 流编辑sed和正则表达式替换
sed 会根据脚本命令来处理文本文件中的数据，这些命令要么从命令行中输入，要么存储在一个文本文件中，此命令执行数据的顺序如下：
- 每次仅读取一行内容；
- 根据提供的规则命令匹配并修改数据。注意，sed 默认不会直接修改源文件数据，而是会将数据复制到缓冲区中，修改也仅限于缓冲区中的数据；
- 将执行结果输出。

当一行数据匹配完成后，它会继续读取下一行数据，并重复这个过程，直到将文件中所有数据处理完毕。

sed全名叫stream editor，流编辑器，用程序的方式来编辑文本，相当的hacker啊。sed基本上就是玩正则模式匹配，所以，玩sed的人，正则表达式一般都比较强。

sed 默认读取整个文件并对其中的每一行进行修改。说白了就是一行一行的操作。

sed 是一种在线编辑器，它一次处理一行内容。处理时，把当前处理的行存储在临时缓冲区中，称为“模式空间”（pattern space），接着用sed命令处理缓冲区中的内容，处理完成后，把缓冲区的内容送往屏幕。接着处理下一行，这样不断重复，直到文件末尾。文件内容并没有 改变，除非你使用重定向存储输出。Sed主要用来自动编辑一个或多个文件；简化对文件的反复操作；编写转换程序等。

# sed命令常用选项及含义

|选项|含义|
|:---|:---|
|-e 脚本命令|该选项会将其后跟的脚本命令添加到已有的命令中。|
|-f 脚本命令文件|，该选项会将其后文件中的脚本命令添加到已有的命令中。|
|-n|使用安静silent模式。在一般sed的用法中，所有来自stdin的内容一般都会被列出到屏幕上。但如果加上-n参数后，则只有经过sed特殊处理的那一行(或者动作)才会被列出来|
|-i|直接修改读取的文件内容，而不是由屏幕输出|
|-r|让sed命令支持扩展的正则表达式(默认是基础正则表达式)|


## sed命令常见用法
```
sed '命令' 文件名列表
sed –e '命令1' –e '命令2' –e '命令3' 文件名列表
sed -f 命令文件 文件名列表
```
成功使用 sed 命令的关键在于掌握各式各样的脚本命令及格式，它能帮你定制编辑文件的规则。

## sed -i：直接修改文件内容
sed 的`-i`选项可以直接修改文件内容，这功能非常有帮助！举例来说，如果你有一个 100 万行的文件，你要在第 100 行加某些文字，此时使用 vim 可能会疯掉！因为文件太大了！那怎办？就利用 sed 啊！透过 sed 直接修改/取代的功能，你甚至不需要使用 vim 去修订！
### 删除空行
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b


this is line c
this is line d
# helloworld_1
# helloworld_2
# helloworld_3
[root@localhost sed]# sed '/^$/d' sed_append.txt 
this is line a
this is line b
this is line c
this is line d
# helloworld_1
# helloworld_2
# helloworld_3
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b


this is line c
this is line d
# helloworld_1
# helloworld_2
# helloworld_3
[root@localhost sed]#
```
### 删除空行并且替换原文件
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b


this is line c
this is line d
# helloworld_1
# helloworld_2
# helloworld_3
[root@localhost sed]# sed -i '/^$/d' sed_append.txt 
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
# helloworld_1
# helloworld_2
# helloworld_3
[root@localhost sed]#
```
删除＃号开头的行到最后一行之间的所有行：
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
# helloworld_1
# helloworld_2
# helloworld_3
[root@localhost sed]# sed '/^#/,$d' sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# sed -i '/^#/,$d' sed_append.txt 
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# 
```
# sed脚本命令
## sed脚本命令s：替换行中的部分内容
此命令的基本格式为：
```
[address]s/pattern/replacement/flags
```
其中，
address表示指定要操作的具体行，
pattern 指的是需要替换的内容，
replacement 指的是要替换的新内容。

此命令中常用的 flags 标记如下表所示

### sed的s命令的flags标记及功能

|flags标记|功能|
|:---|:---|
|`n`|1~512 之间的数字，表示指定要替换的字符串出现第几次时才进行替换，例如，一行中有 3 个 A，但用户只想替换第二个 A，这是就用到这个标记；|
|`g`|对数据中所有匹配到的内容进行替换，如果没有 g，则只会在第一次匹配成功时做替换操作。例如，一行数据中有 3 个 A，则只会替换第一个 A；|
|`p`|会打印与替换命令中指定的模式匹配的行。此标记通常与 -n 选项一起使用。|
|`w file`|将缓冲区中的内容写到指定的 file 文件中；|
|`&`|用正则表达式匹配的内容进行替换；|
|`\n`|匹配第 n 个子串，该子串之前在 pattern 中用 \(\) 指定。|
|`\`|转义（转义替换部分包含：&、\ 等）。|

### 在行首添加内容
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
# helloworld_1
# helloworld_2
# helloworld_3
[root@localhost sed]# sed 's/^/#/g' sed_append.txt 
#this is line a
#this is line b
#this is line c
#this is line d
## helloworld_1
## helloworld_2
## helloworld_3
[root@localhost sed]# 
```
### 在行尾添加内容
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
# helloworld_1
# helloworld_2
# helloworld_3
[root@localhost sed]# sed 's/$/。/g' sed_append.txt 
this is line a。
this is line b。
this is line c。
this is line d。
# helloworld_1。
# helloworld_2。
# helloworld_3。
[root@localhost sed]# 
```


### 替换所有行中第n次模式匹配的地方：sed 's/pattern/replacement/n'
```
sed 's/pattern/replacement/n'
```
例如,将所有行中出现的第二个制表符`\t`替换为减号`-`：
```
[root@localhost sed]# cat SedTest.java 
public class SedTest{
	public static void main(String[] args){
		System.out.println("HelloWorld!");
		System.out.println("sed命令示例");
		System.out.println("sed替换示例");
		for(int i=0;i<5;i++){
			System.out.println("sed_sed_sed_sed"+i);
		}
	}
}
[root@localhost sed]# sed 's/\t/----/2' SedTest.java 
public class SedTest{
	public static void main(String[] args){
	----System.out.println("HelloWorld!");
	----System.out.println("sed命令示例");
	----System.out.println("sed替换示例");
	----for(int i=0;i<5;i++){
	----	System.out.println("sed_sed_sed_sed"+i);
	----}
	}
}
[root@localhost sed]# 
```
将所有行中出现的第3个sed字符串替换为全大写的SED字符串：

<pre>
[root@localhost sed]&#35; cat SedTest.java 
public class SedTest{
	public static void main(String[] args){
		System.out.println("HelloWorld!");
		System.out.println("sed命令示例");
		System.out.println("sed替换示例");
		for(int i=0;i&lt;5;i++){
			System.out.println("sed_sed_sed_sed"+i);
		}
	}
}
[root@localhost sed]&#35; sed 's/sed/SED/3' SedTest.java 
public class SedTest{
	public static void main(String[] args){
		System.out.println("HelloWorld!");
		System.out.println("sed命令示例");
		System.out.println("sed替换示例");
		for(int i=0;i&lt;5;i++){
			System.out.println("sed_sed_<mark>SED</mark>_sed"+i);
		}
	}
}
[root@localhost sed]&#35; 
</pre>
### 替换某行中全部模式匹配的地方：sed '行号s/pattern/replacement/g'
把第3行中的所有`\t`全部替换为4个减号：
```
[root@localhost sed]# cat -n SedTest.java 
     1    public class SedTest{
     2        public static void main(String[] args){
     3            System.out.println("HelloWorld!");
     4            System.out.println("sed命令示例");
     5            System.out.println("sed替换示例");
     6            for(int i=0;i<5;i++){
     7                System.out.println("sed_sed_sed_sed"+i);
     8            }
     9        }
    10    }
[root@localhost sed]# sed '3s/\t/----/g' SedTest.java|cat -n
     1    public class SedTest{
     2        public static void main(String[] args){
     3    --------System.out.println("HelloWorld!");
     4            System.out.println("sed命令示例");
     5            System.out.println("sed替换示例");
     6            for(int i=0;i<5;i++){
     7                System.out.println("sed_sed_sed_sed"+i);
     8            }
     9        }
    10    }
[root@localhost sed]# 
```
### 替换第N行到第M行中第x次模式匹配的地方：sed 'N,Ms/pattern/replacement/x'
```
sed 'N,Ms/pattern/replacement/x'
```
这里的行号范围包括N,但不包括M,也就是替换[N,M)区间内的行数。
#### 第2到第3行之间的第2个制表符替换成四个减号
```
[root@localhost sed]# sed '2,3s/\t/----/2' SedTest.java 
public class SedTest{
    public static void main(String[] args){
    ----System.out.println("HelloWorld!");
        System.out.println("sed命令示例");
        System.out.println("sed替换示例");
        for(int i=0;i<5;i++){
            System.out.println("sed_sed_sed_sed"+i);
        }
    }
}
[root@localhost sed]#
```
#### 第2到第4行之间的第2个制表符替换成四个减号
```
[root@localhost sed]# sed '2,4s/\t/----/2' SedTest.java 
public class SedTest{
    public static void main(String[] args){
    ----System.out.println("HelloWorld!");
    ----System.out.println("sed命令示例");
        System.out.println("sed替换示例");
        for(int i=0;i<5;i++){
            System.out.println("sed_sed_sed_sed"+i);
        }
    }
}
[root@localhost sed]#
```
### 替换行中所有模式匹配的地方：sed 's/pattern/replacement/g'
#### 将所有行中的所有制表符全部替换为四个减号
```
[root@localhost sed]# cat SedTest.java 
public class SedTest{
    public static void main(String[] args){
        System.out.println("HelloWorld!");
        System.out.println("sed命令示例");
        System.out.println("sed替换示例");
        for(int i=0;i<5;i++){
            System.out.println("sed_sed_sed_sed"+i);
        }
    }
}
[root@localhost sed]# sed 's/\t/----/g' SedTest.java 
public class SedTest{
----public static void main(String[] args){
--------System.out.println("HelloWorld!");
--------System.out.println("sed命令示例");
--------System.out.println("sed替换示例");
--------for(int i=0;i<5;i++){
------------System.out.println("sed_sed_sed_sed"+i);
--------}
----}
}
[root@localhost sed]# 
```
#### 将所有的全小写的sed字符全部替换为全大写的SED字符串
```
[root@localhost sed]# cat SedTest.java 
public class SedTest{
    public static void main(String[] args){
        System.out.println("HelloWorld!");
        System.out.println("sed命令示例");
        System.out.println("sed替换示例");
        for(int i=0;i<5;i++){
            System.out.println("sed_sed_sed_sed"+i);
        }
    }
}
[root@localhost sed]# sed 's/sed/SED/g' SedTest.java 
public class SedTest{
    public static void main(String[] args){
        System.out.println("HelloWorld!");
        System.out.println("SED命令示例");
        System.out.println("SED替换示例");
        for(int i=0;i<5;i++){
            System.out.println("SED_SED_SED_SED"+i);
        }
    }
}
[root@localhost sed]# 
```
#### 将包括第1行到不包括第3行之间的制表符改成4个减号
```
[root@localhost sed]# cat SedTest.java 
public class SedTest{
    public static void main(String[] args){
        System.out.println("HelloWorld!");
        System.out.println("sed命令示例");
        System.out.println("sed替换示例");
        for(int i=0;i<5;i++){
            System.out.println("sed_sed_sed_sed"+i);
        }
    }
}
[root@localhost sed]# sed '1,3s/\t/----/g' SedTest.java 
public class SedTest{
----public static void main(String[] args){
--------System.out.println("HelloWorld!");
        System.out.println("sed命令示例");
        System.out.println("sed替换示例");
        for(int i=0;i<5;i++){
            System.out.println("sed_sed_sed_sed"+i);
        }
    }
}
[root@localhost sed]# 

```
### 将缓冲区中的内容输出到文件中：sed 's/pattern/replacement/flag w file'：
经过替换的行会保存在缓冲区中，没经过替换的行则不会放入缓冲区中。如果想把这些经过替换之后的行输出到文件中，可以在s脚本的后面追加flags标记`w 文件名`。

例如，将[2,4)区间范围的行的所有\t替换成四个减号，并且输出缓冲区的内容到文件中：
```
[root@localhost sed]# cat SedTest.java 
public class SedTest{
    public static void main(String[] args){
        System.out.println("HelloWorld!");
        System.out.println("sed命令示例");
        System.out.println("sed替换示例");
        for(int i=0;i<5;i++){
            System.out.println("sed_sed_sed_sed"+i);
        }
    }
}
[root@localhost sed]# sed '2,4s/\t/----/g w out.txt' SedTest.java 
public class SedTest{
----public static void main(String[] args){
--------System.out.println("HelloWorld!");
--------System.out.println("sed命令示例");
        System.out.println("sed替换示例");
        for(int i=0;i<5;i++){
            System.out.println("sed_sed_sed_sed"+i);
        }
    }
}
[root@localhost sed]# ls
out.txt  SedTest.java
[root@localhost sed]# cat out.txt 
----public static void main(String[] args){
--------System.out.println("HelloWorld!");
--------System.out.println("sed命令示例");
[root@localhost sed]# 
```
## sed脚本命令d：删除某行
```
sed '[address]d'
```
如果需要删除文本中的特定行，可以用 d 脚本命令，它会删除指定行中的所有内容。但使用该命令时要特别小心，如果你忘记指定具体行的话，文件中的所有内容都会被删除，举个例子：
### sed删除所有的行
```
[root@localhost sed]# cat SedTest.java 
public class SedTest{
    public static void main(String[] args){
        System.out.println("HelloWorld!");
        System.out.println("sed命令示例");
        System.out.println("sed替换示例");
        for(int i=0;i<5;i++){
            System.out.println("sed_sed_sed_sed"+i);
        }
    }
}
[root@localhost sed]# sed 'd' SedTest.java > sed_d_out.txt
[root@localhost sed]# cat sed_d_out.txt 
[root@localhost sed]# 
```
### sed删除指定行
#### 只删除某行
```
sed '行号d'
```
例如，只删除第2行：
```
[root@localhost sed]# cat -n SedTest.java 
     1    public class SedTest{
     2        public static void main(String[] args){
     3            System.out.println("HelloWorld!");
     4            System.out.println("sed命令示例");
     5            System.out.println("sed替换示例");
     6            for(int i=0;i<5;i++){
     7                System.out.println("sed_sed_sed_sed"+i);
     8            }
     9        }
    10    }
[root@localhost sed]# sed '2d' SedTest.java
public class SedTest{
        System.out.println("HelloWorld!");
        System.out.println("sed命令示例");
        System.out.println("sed替换示例");
        for(int i=0;i<5;i++){
            System.out.println("sed_sed_sed_sed"+i);
        }
    }
}
[root@localhost sed]# 
```
#### 删除第N行到第M行
```
sed '[N,M]d'
```
与替换不同的时，删除使用的是全闭区间。
命令`sed '1,2d' SedTest.java`表示删除区间`[1,2]`的所有行,也就是删除第1行，并且删除第2行。
而命令`sed '1,2s/\t/----/g' SetTest.java`,表示把区间`[1,2)`之间的所有行中的\t全部替换成四个减号，也就是只替换第1行，不替换第2行。

```
[root@localhost sed]# cat -n SedTest.java 
     1	public class SedTest{
     2		public static void main(String[] args){
     3			System.out.println("HelloWorld!");
     4			System.out.println("sed命令示例");
     5			System.out.println("sed替换示例");
     6			for(int i=0;i<5;i++){
     7				System.out.println("sed_sed_sed_sed"+i);
     8			}
     9		}
    10	}
[root@localhost sed]# sed '1,2d' SedTest.java
		System.out.println("HelloWorld!");
		System.out.println("sed命令示例");
		System.out.println("sed替换示例");
		for(int i=0;i<5;i++){
			System.out.println("sed_sed_sed_sed"+i);
		}
	}
}
[root@localhost sed]# sed '1,2s/\t/----/g' SedTest.java
public class SedTest{
----public static void main(String[] args){
		System.out.println("HelloWorld!");
		System.out.println("sed命令示例");
		System.out.println("sed替换示例");
		for(int i=0;i<5;i++){
			System.out.println("sed_sed_sed_sed"+i);
		}
	}
}
[root@localhost sed]# 
```
### 删除空行
```
sed '/^$/d' a.txt       #删除所有空行
```
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b


this is line c
this is line d
[root@localhost sed]# sed '/^$/d' sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# 
```
删除`#`开头的行，到最后一行：
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b


this is line c
this is line d
# helloworld_1
# helloworld_2
# helloworld_3
[root@localhost sed]# sed '/^#/,$d' sed_append.txt 
this is line a
this is line b


this is line c
this is line d
[root@localhost sed]# 
```

## sed脚本命令a：在指定行后追加新行
在第N行之后附加新的内容
```
sed '行号a 附加的内容'
```
### 在某行之后追加一行
例如，在第2行只有追加一行字符串`this is the newly inserted line`：
```
[root@localhost sed]# cat -n sed_append.txt 
     1    this is line a
     2    this is line b
     3    this is line c
     4    this is line d
[root@localhost sed]# sed '2a this is the newly inserted line' sed_append.txt |cat -n
     1    this is line a
     2    this is line b
     3    this is the newly inserted line
     4    this is line c
     5    this is line d
[root@localhost sed]# 
```
### 在某行之后追加多行
#### 使用折行符号
使用在**单引号**中使用折行符`\`可以追加多行到指定行的后面：
```
[root@localhost sed]# cat -n sed_append.txt 
     1    this is line a
     2    this is line b
     3    this is line c
     4    this is line d
[root@localhost sed]# sed '2a this is the newly inserted line 1\
this is the newly inserted line 2' sed_append.txt |cat -n
     1    this is line a
     2    this is line b
     3    this is the newly inserted line 1
     4    this is the newly inserted line 2
     5    this is line c
     6    this is line d
[root@localhost sed]# 
```
#### 使用换行符\n
```
[root@localhost sed]# cat -n sed_append.txt 
     1    this is line a
     2    this is line b
     3    this is line c
     4    this is line d
     5    helloworld1
     6    helloworld2
[root@localhost sed]# sed '1i this is the newly inserted line 1\nthis is the newly inserted line 2' sed_append.txt |cat -n
     1    this is the newly inserted line 1
     2    this is the newly inserted line 2
     3    this is line a
     4    this is line b
     5    this is line c
     6    this is line d
     7    helloworld1
     8    helloworld2
[root@localhost sed]# 
```

## sed脚本命令i：在指定行之前插入新行
### 在第N行之前插入一行
```
[root@localhost sed]# cat -n sed_append.txt 
     1    this is line a
     2    this is line b
     3    this is line c
     4    this is line d
[root@localhost sed]# sed '2i this is the newly inserted line' sed_append.txt |cat -n
     1    this is line a
     2    this is the newly inserted line
     3    this is line b
     4    this is line c
     5    this is line d
[root@localhost sed]# 
```
### 在第N行之前插入多行
```
[root@localhost sed]# cat -n sed_append.txt 
     1    this is line a
     2    this is line b
     3    this is line c
     4    this is line d
[root@localhost sed]# sed '2i this is the newly inserted line 1\
this is the newly inserted line 2' sed_append.txt |cat -n
     1    this is line a
     2    this is the newly inserted line 1
     3    this is the newly inserted line 2
     4    this is line b
     5    this is line c
     6    this is line d
[root@localhost sed]# 
```
## sed脚本命令c：替换整行
### 替换第2行的内容
```
[root@localhost sed]# cat -n sed_append.txt 
     1    this is line a
     2    this is line b
     3    this is line c
     4    this is line d
[root@localhost sed]# sed '2c this is the line after replacement' sed_append.txt |cat -n
     1    this is line a
     2    this is the line after replacement
     3    this is line c
     4    this is line d
[root@localhost sed]# 
```
## sed脚本命令y：字符集映射替换
y 转换命令是唯一可以处理单个字符的 sed 脚本命令，其基本格式如下：
```
sed '[address]y/inchars/outchars/'
```
转换命令会对 inchars 和 outchars 值进行一对一的映射，即 inchars 中的第一个字符会被转换为 outchars 中的第一个字符，第二个字符会被转换成 outchars 中的第二个字符...这个映射过程会一直持续到处理完指定字符。如果 inchars 和 outchars 的长度不同，则 sed 会产生一条错误消息。
### 示例1
例如按如下映射进行替换：

|匹配字符|替换字符|
|:---|:---|
|a|1|
|b|2|
|c|3|
|d|4|

```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# sed 'y/abcd/1234/' sed_append.txt
this is line 1
this is line 2
this is line 3
this is line 4
[root@localhost sed]# sed '1,2y/abcd/1234/' sed_append.txt
this is line 1
this is line 2
this is line c
this is line d
[root@localhost sed]# 
```
可以看到，inchars 模式中指定字符的每个实例都会被替换成 outchars 模式中相同位置的那个字符。

### 示例2

|匹配字符|替换字符|
|:---|:---|
|a|1|
|b|2|
|c|3|
|d|4|
|e|5|

<pre>
[root@localhost sed]&#35; cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]&#35; sed '1,2y/abcde/12345/' sed_append.txt
this is lin<mark>5</mark> <mark>1</mark>
this is lin<mark>5</mark> <mark>2</mark>
this is line c
this is line d
[root@localhost sed]&#35;
</pre>

### 大小写转换
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# sed '1,2y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' sed_append.txt
THIS IS LINE A
THIS IS LINE B
this is line c
this is line d
[root@localhost sed]# 
```
## sed脚本命令p：打印某行
> sed 默认会打印出被处理的输入内容，这些内容跟原始输入内容不一定完全一样，sed 的一些命令可以修改或删除输入内容，再把新的内容打印出来。
> 打印的输出结果并不是只对应匹配特定模式的行。
> 那些没有被处理的行，会原样打印。
> 如果只想打印匹配特定模式的行，要用 -n 选项和 p 命令。

注意：-n 选项并不表示打印匹配特定模式且被处理的行。
例如，使用 -n 选项和 d 命令不会看到任何打印，并不会打印出被删除的行。

`sed -n`∶使用安静(silent)模式。在一般 sed 的用法中，所有来自STDIN的资料一般都会被列出到萤幕上。但**如果加上 -n 参数后，则只有经过sed 特殊处理的那一行(或者动作)才会被列出来**。
### sed '[address]p' 输出匹配的行
p命令表示搜索符号条件的行，并输出该行的内容。
<pre>
[root@localhost sed]&#35; cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
&#35; helloworld_1
&#35; helloworld_2
&#35; helloworld_3
[root@localhost sed]&#35; sed '/^&#35;/p' sed_append.txt 
this is line a
this is line b
this is line c
this is line d
&#35; helloworld_1
<mark>&#35; helloworld_1</mark>
&#35; helloworld_2
<mark>&#35; helloworld_2</mark>
&#35; helloworld_3
<mark>&#35; helloworld_3</mark>
[root@localhost sed]&#35;
</pre>
可以看到匹配的行输出了两次，第一次的输出是sed的输出，第2个输出则是脚本命令p的输出。
如果想只输出匹配的行，其他的行不输出的话，则可以加上-n参数。：

<pre>
[root@localhost sed]&#35; cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
&#35; helloworld_1
&#35; helloworld_2
&#35; helloworld_3
[root@localhost sed]&#35; sed -n '/^&#35;/p' sed_append.txt 
&#35; helloworld_1
&#35; helloworld_2
&#35; helloworld_3
[root@localhost sed]&#35; 
</pre>


通常 p 会与参数 sed -n 一起运作。此命令的基本格式为：
### sed -n '[address]p'
```
sed -n '[address]p'
```
```
sed -n '1p' filename           #显示第一行 
sed -n '$p' filename           #显示最后一行
sed -n '1,2p' filename        #显示第一行到第二行
sed -n '2,$p' filename        #显示第二行到最后一行
```
p 命令常见的用法是打印包含匹配文本模式的行，例如：
### 打印第一行
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# sed -n '1p' sed_append.txt 
this is line a
[root@localhost sed]#
```
### 打印最后一行
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
helloworld1
helloworld2
[root@localhost sed]# sed -n '$p' sed_append.txt 
helloworld2
[root@localhost sed]# 
```
### 打印第1行到第2行
```
[root@localhost sed]# sed -n '1,2p' sed_append.txt 
this is line a
this is line b
[root@localhost sed]# 
```
### 打印第2行到最后一行
```
[root@localhost sed]# sed -n '2,$p' sed_append.txt
this is line b
this is line c
this is line d
helloworld1
helloworld2
[root@localhost sed]# 
```
### 打印包含指定关键字的行
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
helloworld1
helloworld2
[root@localhost sed]# sed -n '/helloworld/p' sed_append.txt
helloworld1
helloworld2
```
### 打印匹配正则表达式的行
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
helloworld1
helloworld2
[root@localhost sed]# sed -n '/world[0-9]/p' sed_append.txt
helloworld1
helloworld2
[root@localhost sed]# 
```

### sed -n选项p命令：只打印包含匹配模式的行
可以看到，用 -n 选项和 p 命令配合使用，可以只打印匹配的行。
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# sed -n '2p' sed_append.txt 
this is line b
[root@localhost sed]# sed -n '/b/p' sed_append.txt 
this is line b
[root@localhost sed]# sed -n '/line/p' sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# 
```
### sed多脚本
```
address {
    多个脚本命令
}
```
#### sed显示匹配的行，并显示替换后的结果。
如果需要在修改之前查看行，也可以使用打印命令，比如与替换或修改命令一起使用。可以创建一个脚本在修改行之前显示该行，如下所示：
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]#  sed -n '/b/{
> p;
> s/line/row/p
> }' sed_append.txt
this is line b
this is row b
[root@localhost sed]# 
```
sed 命令会查找包含小写字母b的行，然后执行两条命令。
首先，脚本用 p 命令来打印出原始行；
然后它用s命令替换文本，并用 p 标记打印出替换结果。
这样可以输出当前要处理的文本，以及替换之后的文本，以便于对比替换的结果是否达到要求

#### 多个脚本命令写在一行
可以吧多个命令写在一行之中，命令之间用英文的分号`;`分隔开即可：
```
sed '[address]{命令1;命令2;...命令n}'
```
<pre>
[root@localhost sed]&#35; cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
&#35; helloworld_1
&#35; helloworld_2
&#35; helloworld_3
[root@localhost sed]&#35; sed -n '/^&#35;/,${p;s/helloworld/HELLOWORLD/pg}' sed_append.txt 
&#35; helloworld_1
&#35; HELLOWORLD_1
&#35; helloworld_2
&#35; HELLOWORLD_2
&#35; helloworld_3
&#35; HELLOWORLD_3
[root@localhost sed]&#35; 
</pre>

### 正则表达式词首词尾
`\<`表示词首。 如：`\<abc`表示以abc为首的詞。
`\>`表示词尾。 如：`abc\>`表示以abc結尾的詞。
### 打印有hello为词首的单词的行
<pre>
[root@localhost sed]&#35; cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
&#35; helloworld_1
&#35; helloworld_2
&#35; helloworld_3
[root@localhost sed]&#35; sed -n '/\&lt;hello/p' sed_append.txt 
&#35; helloworld_1
&#35; helloworld_2
&#35; helloworld_3
[root@localhost sed]&#35; 
</pre>

### 打印有line为词尾的单词的行
<pre>
[root@localhost sed]&#35; cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
&&#35;35; helloworld_1
&&#35;35; helloworld_2
&&#35;35; helloworld_3
[root@localhost sed]&#35; sed -n '/line\&gt;/p' sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]&#35; 
</pre>

## sed脚本命令w file：输出模式空间中的内容到文件
w命令用来将文本中指定行的内容写入文件中，此命令的基本格式如下：
```
sed '[address]w filename'
```
这里的 filename 表示文件名，可以使用相对路径或绝对路径，但不管是哪种，运行 sed 命令的用户都必须有文件的写权限。
下面的例子是将数据流中的前两行打印到一个文本文件中：
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# sed '1,2 w sed_w_out.txt' sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# cat sed_w_out.txt 
this is line a
this is line b
[root@localhost sed]# 
```
## sed脚本命令r：插入独立文件的内容到当前数据流的指定位置
r 命令用于将一个独立文件的数据插入到当前数据流的指定位置，该命令的基本格式为：
```
sed "[address]r filename"
```
sed命令会将filename文件中的内容插入到address指定的行的后面。
### 在文件的某行后插入另一个文件的内容
例如，将sed_2.txt文件中的内容，插入到sed_append.txt文件中的第二行后面：
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# cat sed_2.txt 
HelloWorld
[root@localhost sed]# sed "2r sed_2.txt" sed_append.txt 
this is line a
this is line b
HelloWorld
this is line c
this is line d
[root@localhost sed]# 
```
### 在文件的末尾插入另一个文件的内容
如果你想将指定文件中的数据插入到数据流的末尾，可以使用地址符`$`，例如：
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# cat sed_2.txt 
HelloWorld
[root@localhost sed]# sed '$r sed_2.txt' sed_append.txt 
this is line a
this is line b
this is line c
this is line d
HelloWorld
```
需要注意的是，命令如果使用的是双引号的话，则需要使用转义符，也就是双引号中的美元符号，要写成`"\$"`，而使用单引号就不需要使用转义符，只需要写成`'$'`即可
```
[root@localhost sed]# sed "$r sed_2.txt" sed_append.txt 
sed：-e 表达式 #1，字符 10：未终止的“s”命令
[root@localhost sed]# sed "\$r sed_2.txt" sed_append.txt 
this is line a
this is line b
this is line c
this is line d
HelloWorld
[root@localhost sed]# 
```
## sed脚本命令q：匹配第一次后就退出sed程序
q命令的作用是使sed命令在第一次匹配任务结束后，退出 sed 程序，不再进行对后续数据的处理。
### sed匹配后退出
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# sed '2q' sed_append.txt 
this is line a
this is line b
[root@localhost sed]#
```
可以看到，sed 命令在打印输出第 2 行之后，就停止了，是 q 命令造成的，再比如：
### sed查找替换第一次模式匹配后退出
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]#  sed '/b/{ s/b/B/;q; }' sed_append.txt 
this is line a
this is line B
[root@localhost sed]# 
```
sed在当前行中查找到小写的字母b后，将小写的字母b替换成大写的字母B,然后退出sed不再处理后续的行。
# sed脚本命令的寻址方式
前面在介绍各个脚本命令时，我们一直忽略了对 address 部分的介绍。对各个脚本命令来说，address 用来表明该脚本命令作用到文本中的具体行。

默认情况下，sed 命令会作用于文本数据的所有行。如果只想将命令作用于特定行或某些行，则必须写明 address 部分，表示的方法有以下 2 种：
- 以数字形式指定行区间；
- 用文本模式指定具体行区间。

以上两种形式都可以使用如下这 2 种格式，分别是：
```
[address]脚本命令
```
或者
```
address {
    脚本命令1
    脚本命令2
    ......
    脚本命令n
}
```
## 以数字形式指定行区间
当使用数字方式的行寻址时，可以用行在文本流中的行位置来引用。sed 会将文本流中的第一行编号为 1，然后继续按顺序为接下来的行分配行号。

在脚本命令中，
- 指定的地址可以是单个行号，
- 也可以用**起始行号+逗号+结束行号**来指定指定的一定区间范围内的行（`起始行号,结尾行号`）。

### 使用数字指定行号
这里举一个 sed 命令作用到指定行号的例子：
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# sed '2s/s/_/g' sed_append.txt 
this is line a
thi_ i_ line b
this is line c
this is line d
[root@localhost sed]#
```
可以看到，sed 只修改地址指定的第二行的文本。下面的例子中使用了行地址区间：
### 使用区间指定行地址
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# sed '2,3s/s/_/g' sed_append.txt 
this is line a
thi_ i_ line b
thi_ i_ line c
this is line d
[root@localhost sed]# 
```
#### 特殊的行结束符$
在此基础上，如果想将命令作用到文本中从某行开始的所有行，可以用特殊地址——美元符（`$`）：
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
[root@localhost sed]# sed '2,$s/s/_/g' sed_append.txt 
this is line a
thi_ i_ line b
thi_ i_ line c
thi_ i_ line d
[root@localhost sed]# 
```
## 用文本模式指定行区间
sed 允许指定文本模式来过滤出命令要作用的行，格式如下：
```
/pattern/command
```
注意，必须用正斜线将要指定的pattern封起来，sed会将该命令作用到包含指定文本模式的行上。
### 固定文本模式：字符串形式的文本模式
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
helloworld1
helloworld2
[root@localhost sed]# cat sed_append.txt |grep 'helloworld'
helloworld1
helloworld2
[root@localhost sed]# sed '/helloworld/s/helloworld/HELLOWORLD/g' sed_append.txt 
this is line a
this is line b
this is line c
this is line d
HELLOWORLD1
HELLOWORLD2
[root@localhost sed]# 
```
虽然使用固定文本模式（字符串）能帮你过滤出特定的值，但其作用难免有限，因此，sed 允许在文本模式使用正则表达式指明作用的具体行。
正则表达式允许创建高级文本模式匹配表达式来匹配各种数据。这些表达式结合了一系列通配符、特殊字符以及固定文本字符来生成能够匹配几乎任何形式文本的简练模式。
### 高级文本模式：使用正则表达式的文本模式
```
[root@localhost sed]# cat sed_append.txt 
this is line a
this is line b
this is line c
this is line d
helloworld1
helloworld2
[root@localhost sed]# sed '/world[0-9]/s/world/WORLD/g' sed_append.txt 
this is line a
this is line b
this is line c
this is line d
helloWORLD1
helloWORLD2
[root@localhost sed]# 
```
# sed命令帮助文档
## sed --help
```
[root@localhost ~]# sed --help
用法: sed [选项]... {脚本(如果没有其他脚本)} [输入文件]...

  -n, --quiet, --silent
                 取消自动打印模式空间
  -e 脚本, --expression=脚本
                 添加“脚本”到程序的运行列表
  -f 脚本文件, --file=脚本文件
                 添加“脚本文件”到程序的运行列表
  --follow-symlinks
                 直接修改文件时跟随软链接
  -i[SUFFIX], --in-place[=SUFFIX]
                 edit files in place (makes backup if SUFFIX supplied)
  -c, --copy
                 use copy instead of rename when shuffling files in -i mode
  -b, --binary
                 does nothing; for compatibility with WIN32/CYGWIN/MSDOS/EMX (
                 open files in binary mode (CR+LFs are not treated specially))
  -l N, --line-length=N
                 指定“l”命令的换行期望长度
  --posix
                 关闭所有 GNU 扩展
  -r, --regexp-extended
                 在脚本中使用扩展正则表达式
  -s, --separate
                 将输入文件视为各个独立的文件而不是一个长的连续输入
  -u, --unbuffered
                 从输入文件读取最少的数据，更频繁的刷新输出
  -z, --null-data
                 separate lines by NUL characters
  --help
                 display this help and exit
  --version
                 output version information and exit

如果没有 -e, --expression, -f 或 --file 选项，那么第一个非选项参数被视为
sed脚本。其他非选项参数被视为输入文件，如果没有输入文件，那么程序将从标准
输入读取数据。
GNU sed home page: <http://www.gnu.org/software/sed/>.
General help using GNU software: <http://www.gnu.org/gethelp/>.
E-mail bug reports to: <bug-sed@gnu.org>.
Be sure to include the word ``sed'' somewhere in the ``Subject:'' field.
[root@localhost ~]# 
```
## man sed
```
SED(1)                                                          User Commands                                                          SED(1)

NAME
       sed - stream editor for filtering and transforming text

SYNOPSIS
       sed [OPTION]... {script-only-if-no-other-script} [input-file]...

DESCRIPTION
       Sed  is  a  stream  editor.   A stream editor is used to perform basic text transformations on an input stream (a file or input from a
       pipeline).  While in some ways similar to an editor which permits scripted edits (such as ed), sed works by making only one pass  over
       the  input(s),  and  is  consequently more efficient.  But it is sed's ability to filter text in a pipeline which particularly distin‐
       guishes it from other types of editors.

       -n, --quiet, --silent

              suppress automatic printing of pattern space

       -e script, --expression=script

              add the script to the commands to be executed

       -f script-file, --file=script-file

              add the contents of script-file to the commands to be executed

       --follow-symlinks

              follow symlinks when processing in place

       -i[SUFFIX], --in-place[=SUFFIX]

              edit files in place (makes backup if SUFFIX supplied)

       -c, --copy

              use copy instead of rename when shuffling files in -i mode

       -b, --binary

              does nothing; for compatibility with WIN32/CYGWIN/MSDOS/EMX ( open files in binary mode (CR+LFs are not treated specially))

       -l N, --line-length=N

              specify the desired line-wrap length for the `l' command

       --posix

              disable all GNU extensions.

       -r, --regexp-extended

              use extended regular expressions in the script.

       -s, --separate

              consider files as separate rather than as a single continuous long stream.

       -u, --unbuffered

              load minimal amounts of data from the input files and flush the output buffers more often

       -z, --null-data

              separate lines by NUL characters

       --help

              display this help and exit

       --version

              output version information and exit

       If no -e, --expression, -f, or --file option is given, then the first non-option argument is taken as the  sed  script  to  interpret.
       All remaining arguments are names of input files; if no input files are specified, then the standard input is read.

       GNU  sed  home  page: <http://www.gnu.org/software/sed/>.  General help using GNU software: <http://www.gnu.org/gethelp/>.  E-mail bug
       reports to: <bug-sed@gnu.org>.  Be sure to include the word ``sed'' somewhere in the ``Subject:'' field.

COMMAND SYNOPSIS
       This is just a brief synopsis of sed commands to serve as a reminder to those who already know sed; other documentation (such  as  the
       texinfo document) must be consulted for fuller descriptions.

   Zero-address ``commands''
       : label
              Label for b and t commands.

       #comment
              The comment extends until the next newline (or the end of a -e script fragment).

       }      The closing bracket of a { } block.

   Zero- or One- address commands
       =      Print the current line number.

       a \

       text   Append text, which has each embedded newline preceded by a backslash.

       i \

       text   Insert text, which has each embedded newline preceded by a backslash.

       q [exit-code]
              Immediately  quit  the sed script without processing any more input, except that if auto-print is not disabled the current pat‐
              tern space will be printed.  The exit code argument is a GNU extension.

       Q [exit-code]
              Immediately quit the sed script without processing any more input.  This is a GNU extension.

       r filename
              Append text read from filename.

       R filename
              Append a line read from filename.  Each invocation of the command reads a line from the file.  This is a GNU extension.

   Commands which accept address ranges
       {      Begin a block of commands (end with a }).

       b label
              Branch to label; if label is omitted, branch to end of script.

       c \

       text   Replace the selected lines with text, which has each embedded newline preceded by a backslash.

       d      Delete pattern space.  Start next cycle.

       D      If pattern space contains no newline, start a normal new cycle as if the d command was issued.  Otherwise, delete text  in  the
              pattern space up to the first newline, and restart cycle with the resultant pattern space, without reading a new line of input.

       h H    Copy/append pattern space to hold space.

       g G    Copy/append hold space to pattern space.

       l      List out the current line in a ``visually unambiguous'' form.

       l width
              List out the current line in a ``visually unambiguous'' form, breaking it at width characters.  This is a GNU extension.

       n N    Read/append the next line of input into the pattern space.

       p      Print the current pattern space.

       P      Print up to the first embedded newline of the current pattern space.

       s/regexp/replacement/
              Attempt to match regexp against the pattern space.  If successful, replace that portion matched with replacement.  The replace‐
              ment may contain the special character & to refer to that portion of the pattern space which matched, and the  special  escapes
              \1 through \9 to refer to the corresponding matching sub-expressions in the regexp.

       t label
              If  a s/// has done a successful substitution since the last input line was read and since the last t or T command, then branch
              to label; if label is omitted, branch to end of script.

       T label
              If no s/// has done a successful substitution since the last input line was read and since the last t or T command, then branch
              to label; if label is omitted, branch to end of script.  This is a GNU extension.

       w filename
              Write the current pattern space to filename.

       W filename
              Write the first line of the current pattern space to filename.  This is a GNU extension.

       x      Exchange the contents of the hold and pattern spaces.

       y/source/dest/
              Transliterate the characters in the pattern space which appear in source to the corresponding character in dest.

Addresses
       Sed  commands  can  be  given  with no addresses, in which case the command will be executed for all input lines; with one address, in
       which case the command will only be executed for input lines which match that address; or with two addresses, in which case  the  com‐
       mand  will  be executed for all input lines which match the inclusive range of lines starting from the first address and continuing to
       the second address.  Three things to note about address ranges: the syntax is addr1,addr2 (i.e., the  addresses  are  separated  by  a
       comma); the line which addr1 matched will always be accepted, even if addr2 selects an earlier line; and if addr2 is a regexp, it will
       not be tested against the line that addr1 matched.

       After the address (or address-range), and before the command, a !  may be inserted, which specifies that the  command  shall  only  be
       executed if the address (or address-range) does not match.

       The following address types are supported:

       number Match only the specified line number (which increments cumulatively across files, unless the -s option is specified on the com‐
              mand line).

       first~step
              Match every step'th line starting with line first.  For example, ``sed -n 1~2p'' will print all the odd-numbered lines  in  the
              input  stream, and the address 2~5 will match every fifth line, starting with the second.  first can be zero; in this case, sed
              operates as if it were equal to step.  (This is an extension.)

       $      Match the last line.

       /regexp/
              Match lines matching the regular expression regexp.

       \cregexpc
              Match lines matching the regular expression regexp.  The c may be any character.

       GNU sed also supports some special 2-address forms:

       0,addr2
              Start out in "matched first address" state, until addr2 is found.  This is similar to 1,addr2, except that if addr2 matches the
              very first line of input the 0,addr2 form will be at the end of its range, whereas the 1,addr2 form will still be at the begin‐
              ning of its range.  This works only when addr2 is a regular expression.

       addr1,+N
              Will match addr1 and the N lines following addr1.

       addr1,~N
              Will match addr1 and the lines following addr1 until the next line whose input line number is a multiple of N.

REGULAR EXPRESSIONS
       POSIX.2 BREs should be supported, but they aren't completely because of performance problems.  The \n sequence in a regular expression
       matches the newline character, and similarly for \a, \t, and other sequences.

BUGS
       E-mail bug reports to bug-sed@gnu.org.  Also, please include the output of ``sed --version'' in the body of your report if at all pos‐
       sible.

AUTHOR
       Written by Jay Fenlason, Tom Lord, Ken Pizzini, and Paolo Bonzini.  GNU sed home  page:  <http://www.gnu.org/software/sed/>.   General
       help  using  GNU  software:  <http://www.gnu.org/gethelp/>.   E-mail  bug  reports to: <bug-sed@gnu.org>.  Be sure to include the word
       ``sed'' somewhere in the ``Subject:'' field.

COPYRIGHT
       Copyright © 2012 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       awk(1), ed(1), grep(1), tr(1), perlre(1), sed.info, any of various books on sed, the sed FAQ (http://sed.sf.net/grabbag/tutorials/sed‐
       faq.txt), http://sed.sf.net/grabbag/.

       The full documentation for sed is maintained as a Texinfo manual.  If the info and sed programs are properly installed at your site,
       the command

              info sed

       should give you access to the complete manual.

sed 4.2.2                                                       September 2020                                                         SED(1)
 Manual page sed(1) line 210/246 (END) (press h for help or q to quit)

```


# 参考资料
[http://c.biancheng.net/view/4028.html](http://c.biancheng.net/view/4028.html)
[http://c.biancheng.net/view/4056.html](http://c.biancheng.net/view/4056.html)
[https://www.runoob.com/linux/linux-comm-sed.html](https://www.runoob.com/linux/linux-comm-sed.html)
[https://developer.aliyun.com/article/320516](https://developer.aliyun.com/article/320516)
[https://www.cnblogs.com/dong008259/archive/2011/12/07/2279897.html](https://www.cnblogs.com/dong008259/archive/2011/12/07/2279897.html)
[https://coolshell.cn/articles/9104.html](https://coolshell.cn/articles/9104.html)
[https://qianngchn.github.io/wiki/4.html](https://qianngchn.github.io/wiki/4.html)

[https://segmentfault.com/a/1190000022722531](https://segmentfault.com/a/1190000022722531)
[https://www.linuxcool.com/sed](https://www.linuxcool.com/sed)
[https://www.cnblogs.com/ggjucheng/archive/2013/01/13/2856901.html](https://www.cnblogs.com/ggjucheng/archive/2013/01/13/2856901.html)
[https://learnku.com/server/wikis/36595](https://learnku.com/server/wikis/36595)
[http://linux.51yip.com/search/sed](http://linux.51yip.com/search/sed)
[https://zhuanlan.zhihu.com/p/130797132](https://zhuanlan.zhihu.com/p/130797132)
## 手册
[http://www.gnu.org/software/sed/manual/sed.html](http://www.gnu.org/software/sed/manual/sed.html)
