---
title: Linux less命令
categories:
  - 编程
  - Linux
  - 通用
  - 文本文件及其处理命令
  - 读取文本文件
abbrlink: a0a57f0
date: 2021-04-23 14:00:40
updated: 2021-04-23 14:00:40
---
# Linux系统中的命令less

less is more
- 回退浏览的功能更强
- 可直接使键盘的上下箭头键，或者j,k，类似vi的光标定位键，以及PgUp，PgDn，Home，End键

有的Unix系统不提供less命令，但是可利用more命令的增强功能。

less 命令的作用和 more 十分类似，都用来浏览文本文件中的内容，不同之处在于，使用 more 命令浏览文件内容时，只能不断向后翻看，而使用 less 命令浏览，既可以向后翻看，也可以向前翻看。
不仅如此，为了方面用户浏览文本内容，less 命令还提供了以下几个功能：
- 使用光标键可以在文本文件中前后（左后）滚屏；
- 用行号或百分比作为书签浏览文件；
- 提供更加友好的检索、高亮显示等操作；
- 兼容常用的字处理程序（如 Vim、Emacs）的键盘操作；
- 阅读到文件结束时，less 命令不会退出；
- 屏幕底部的信息提示更容易控制使用，而且提供了更多的信息。

## less --help
输入`less --help`或者`less -?`可查看less的帮组文档：
```
                   SUMMARY OF LESS COMMANDS

      Commands marked with * may be preceded by a number, N.
      Notes in parentheses indicate the behavior if N is given.
      A key preceded by a caret indicates the Ctrl key; thus ^K is ctrl-K.

  h  H                 Display this help.
  q  :q  Q  :Q  ZZ     Exit.
 ---------------------------------------------------------------------------

                           MOVING

  e  ^E  j  ^N  CR  *  Forward  one line   (or N lines).
  y  ^Y  k  ^K  ^P  *  Backward one line   (or N lines).
  f  ^F  ^V  SPACE  *  Forward  one window (or N lines).
  b  ^B  ESC-v      *  Backward one window (or N lines).
  z                 *  Forward  one window (and set window to N).
  w                 *  Backward one window (and set window to N).
  ESC-SPACE         *  Forward  one window, but don't stop at end-of-file.
  d  ^D             *  Forward  one half-window (and set half-window to N).
  u  ^U             *  Backward one half-window (and set half-window to N).
  ESC-)  RightArrow *  Left  one half screen width (or N positions).
  ESC-(  LeftArrow  *  Right one half screen width (or N positions).
  F                    Forward forever; like "tail -f".
  r  ^R  ^L            Repaint screen.
  R                    Repaint screen, discarding buffered input.
        ---------------------------------------------------
        Default "window" is the screen height.
        Default "half-window" is half of the screen height.
 ---------------------------------------------------------------------------

                          SEARCHING

  /pattern          *  Search forward for (N-th) matching line.
  ?pattern          *  Search backward for (N-th) matching line.
  n                 *  Repeat previous search (for N-th occurrence).
  N                 *  Repeat previous search in reverse direction.
  ESC-n             *  Repeat previous search, spanning files.
  ESC-N             *  Repeat previous search, reverse dir. & spanning files.
  ESC-u                Undo (toggle) search highlighting.
  &pattern          *  Display only matching lines
        ---------------------------------------------------
        A search pattern may be preceded by one or more of:
        ^N or !  Search for NON-matching lines.
        ^E or *  Search multiple files (pass thru END OF FILE).
        ^F or @  Start search at FIRST file (for /) or last file (for ?).
        ^K       Highlight matches, but don't move (KEEP position).
        ^R       Don't use REGULAR EXPRESSIONS.
 ---------------------------------------------------------------------------

                           JUMPING

  g  <  ESC-<       *  Go to first line in file (or line N).
  G  >  ESC->       *  Go to last line in file (or line N).
  p  %              *  Go to beginning of file (or N percent into file).
  t                 *  Go to the (N-th) next tag.
  T                 *  Go to the (N-th) previous tag.
  {  (  [           *  Find close bracket } ) ].
  }  )  ]           *  Find open bracket { ( [.
  ESC-^F <c1> <c2>  *  Find close bracket <c2>.
  ESC-^B <c1> <c2>  *  Find open bracket <c1> 
        ---------------------------------------------------
        Each "find close bracket" command goes forward to the close bracket 
          matching the (N-th) open bracket in the top line.
        Each "find open bracket" command goes backward to the open bracket 
          matching the (N-th) close bracket in the bottom line.

  m<letter>            Mark the current position with <letter>.
  '<letter>            Go to a previously marked position.
  ''                   Go to the previous position.
  ^X^X                 Same as '.
        ---------------------------------------------------
        A mark is any upper-case or lower-case letter.
        Certain marks are predefined:
             ^  means  beginning of the file
             $  means  end of the file
 ---------------------------------------------------------------------------

                        CHANGING FILES

  :e [file]            Examine a new file.
  ^X^V                 Same as :e.
  :n                *  Examine the (N-th) next file from the command line.
  :p                *  Examine the (N-th) previous file from the command line.
  :x                *  Examine the first (or N-th) file from the command line.
  :d                   Delete the current file from the command line list.
  =  ^G  :f            Print current file name.
 ---------------------------------------------------------------------------

                    MISCELLANEOUS COMMANDS

  -<flag>              Toggle a command line option [see OPTIONS below].
  --<name>             Toggle a command line option, by name.
  _<flag>              Display the setting of a command line option.
  __<name>             Display the setting of an option, by name.
  +cmd                 Execute the less cmd each time a new file is examined.

  !command             Execute the shell command with $SHELL.
  |Xcommand            Pipe file between current pos & mark X to shell command.
  v                    Edit the current file with $VISUAL or $EDITOR.
  V                    Print version number of "less".
 ---------------------------------------------------------------------------

                           OPTIONS

        Most options may be changed either on the command line,
        or from within less by using the - or -- command.
        Options may be given in one of two forms: either a single
        character preceded by a -, or a name preceded by --.

  -?  ........  --help
                  Display help (from command line).
  -a  ........  --search-skip-screen
                  Search skips current screen.
  -A  ........  --SEARCH-SKIP-SCREEN
                  Search starts just after target line.
  -b [N]  ....  --buffers=[N]
                  Number of buffers.
  -B  ........  --auto-buffers
                  Don't automatically allocate buffers for pipes.
  -c  -C  ....  --clear-screen --CLEAR-SCREEN
                  Repaint by clearing rather than scrolling.
  -d  ........  --dumb
                  Dumb terminal.
  -D [xn.n]  .  --color=xn.n
                  Set screen colors. (MS-DOS only)
  -e  -E  ....  --quit-at-eof  --QUIT-AT-EOF
                  Quit at end of file.
  -f  ........  --force
                  Force open non-regular files.
  -F  ........  --quit-if-one-screen
                  Quit if entire file fits on first screen.
  -g  ........  --hilite-search
                  Highlight only last match for searches.
  -G  ........  --HILITE-SEARCH
                  Don't highlight any matches for searches.
  --old-bot
                  Revert to the old bottom of screen behavior.
  -h [N]  ....  --max-back-scroll=[N]
                  Backward scroll limit.
  -i  ........  --ignore-case
                  Ignore case in searches that do not contain uppercase.
  -I  ........  --IGNORE-CASE
                  Ignore case in all searches.
  -j [N]  ....  --jump-target=[N]
                  Screen position of target lines.
  -J  ........  --status-column
                  Display a status column at left edge of screen.
  -k [file]  .  --lesskey-file=[file]
                  Use a lesskey file.
  -K            --quit-on-intr
                  Exit less in response to ctrl-C.
  -L  ........  --no-lessopen
                  Ignore the LESSOPEN environment variable.
  -m  -M  ....  --long-prompt  --LONG-PROMPT
                  Set prompt style.
  -n  ........  --line-numbers
                  Don't use line numbers.
  -N  ........  --LINE-NUMBERS
                  Use line numbers.
  -o [file]  .  --log-file=[file]
                  Copy to log file (standard input only).
  -O [file]  .  --LOG-FILE=[file]
                  Copy to log file (unconditionally overwrite).
  -p [pattern]  --pattern=[pattern]
                  Start at pattern (from command line).
  -P [prompt]   --prompt=[prompt]
                  Define new prompt.
  -q  -Q  ....  --quiet  --QUIET  --silent --SILENT
                  Quiet the terminal bell.
  -r  -R  ....  --raw-control-chars  --RAW-CONTROL-CHARS
                  Output "raw" control characters.
  -s  ........  --squeeze-blank-lines
                  Squeeze multiple blank lines.
  -S  ........  --chop-long-lines
                  Chop (truncate) long lines rather than wrapping.
  -t [tag]  ..  --tag=[tag]
                  Find a tag.
  -T [tagsfile] --tag-file=[tagsfile]
                  Use an alternate tags file.
  -u  -U  ....  --underline-special  --UNDERLINE-SPECIAL
                  Change handling of backspaces.
  -V  ........  --version
                  Display the version number of "less".
  -w  ........  --hilite-unread
                  Highlight first new line after forward-screen.
  -W  ........  --HILITE-UNREAD
                  Highlight first new line after any forward movement.
  -x [N[,...]]  --tabs=[N[,...]]
                  Set tab stops.
  -X  ........  --no-init
                  Don't use termcap init/deinit strings.
  -y [N]  ....  --max-forw-scroll=[N]
                  Forward scroll limit.
  -z [N]  ....  --window=[N]
                  Set size of window.
  -" [c[c]]  .  --quotes=[c[c]]
                  Set shell quote characters.
  -~  ........  --tilde
                  Don't display tildes after end of file.
  -# [N]  ....  --shift=[N]
                  Horizontal scroll amount (0 = one half screen width)
      ........  --no-keypad
                  Don't send termcap keypad init/deinit strings.
      ........  --follow-name
                  The F command changes files if the input file is renamed.
      ........  --use-backslash
                  Subsequent options use backslash as escape char.


 ---------------------------------------------------------------------------

                          LINE EDITING

        These keys can be used to edit text being entered 
        on the "command line" at the bottom of the screen.

 RightArrow                       ESC-l     Move cursor right one character.
 LeftArrow                        ESC-h     Move cursor left one character.
 ctrl-RightArrow  ESC-RightArrow  ESC-w     Move cursor right one word.
 ctrl-LeftArrow   ESC-LeftArrow   ESC-b     Move cursor left one word.
 HOME                             ESC-0     Move cursor to start of line.
 END                              ESC-$     Move cursor to end of line.
 BACKSPACE                                  Delete char to left of cursor.
 DELETE                           ESC-x     Delete char under cursor.
 ctrl-BACKSPACE   ESC-BACKSPACE             Delete word to left of cursor.
 ctrl-DELETE      ESC-DELETE      ESC-X     Delete word under cursor.
 ctrl-U           ESC (MS-DOS only)         Delete entire line.
 UpArrow                          ESC-k     Retrieve previous command line.
 DownArrow                        ESC-j     Retrieve next command line.
 TAB                                        Complete filename & cycle.
 SHIFT-TAB                        ESC-TAB   Complete filename & reverse cycle.
 ctrl-L                                     Complete filename, list all.

```
# less交互指令
在使用 less 命令查看文件内容的过程中，和 more 命令一样，也会进入交互界面，因此需要读者掌握一些常用的交互指令。

|交互指令|功能|
|:---|:---|
|/字符串|向下搜索“字符串”的功能。|
|?字符串|向上搜索“字符串”的功能。|
|n|重复*前一个搜索（与 / 成 ? 有关）。|
|N|反向重复前一个搜索（与 / 或 ? 有关）。|
|b|向上移动一页。|
|d|向下移动半页。|
|h 或 H|显示帮助界面。|
|q 或 Q|退出 less 命令。|
|y|向上移动一行。|
|空格键|向下移动一页。|
|回车键|向下移动一行。|
|【PgDn】键|向下移动一页。|
|【PgUp】键|向上移动一页。|
|Ctrl+f|向下移动一页。|
|Ctrl+b|向上移动一页。|
|Ctrl+d|向下移动一页。|
|Ctrl+u|向上移动半页。|
|j|向下移动一行。|
|k|向上移动一行。|
|G|移动至最后一行。|
|g|移动到第一行。|
|ZZ|退出 less 命令。|
|v|使用配置的编辑器编辑当前文件。|
|[|移动到本文档的上一个节点。|
|]|移动到本文档的下一个节点。|
|p|移动到同级的上一个节点。|
|u|向上移动半页。|

# less选项

|选项|选项含义|
|:---|:---|
|-N|显示每行的行号。|
|-S|行过长时将超出部分舍弃。|
|-e|当文件显示结束后，自动离开。|
|-g|只标志最后搜索到的关键同。|
|-Q|不使用警告音。|
|-i|忽略搜索时的大小写。|
|-m|显示类似 more 命令的百分比。|
|-f|强迫打开特殊文件，比如外围设备代号、目录和二进制文件。|
|-s|显示连续空行为一行。|
|-b <缓冲区大小>|设置缓冲区的大小。|
|-o <文件名>|将 less 输出的内容保存到指定文件中。|
|-x <数字>|将【Tab】键显示为规定的数字空格。|

## less -N filename：显示行号
如果要 less 显示行号，请使用以下 -N 选项启动程序：
```
less -N filename
```
## less -X filename
默认情况下， less 退出时，将从屏幕中清除文件内容。要在屏幕上保留文件内容，请使用以下 -X 选项：
```
less -X filename
```
<pre>
[root@localhost Linux_Test]&#35; less -X date_test.txt 
<mark>2020-01-24 04:05:06</mark>
2021/4/25
[root@localhost Linux_Test]&#35; 
</pre>

## less +F 日志文件
该 +F 选项告诉 less 您查看文件内容可能会更改。这在打开日志文件时很有用。
less +F /var/log/messages
添加了 +F 选项的 less的表现与 tail -f 命令几乎相同。
# less使用示例
## 命令|less
### 查看命令历史使用记录并通过less分页显示
```
history | less
```
### ps查看进程信息并通过less分页显示
```
ps -ef |less
```

## 查看多个文件
### 一开始就打开多个文件
方式一，传递多个参数给 less，就能浏览多个文件。
```
less log.txt log.log
```
### 在less中使用less查看另一个文件
方式二，正在浏览一个文件时，使用 :e 打开另一个文件。
```
:e file2
```
当打开多个文件时，使用如下命令在多个文件之间切换
```
:n - 浏览下一个文件
:p - 浏览前一个文件
```

# 参考资料
[http://c.biancheng.net/view/4004.html](http://c.biancheng.net/view/4004.html)
[https://www.runoob.com/linux/linux-comm-less.html](https://www.runoob.com/linux/linux-comm-less.html)
[https://www.linuxidc.com/Linux/2019-08/159901.htm](https://www.linuxidc.com/Linux/2019-08/159901.htm)
[https://www.yiibai.com/linux/less.html](https://www.yiibai.com/linux/less.html)
[https://segmentfault.com/a/1190000011653442](https://segmentfault.com/a/1190000011653442)