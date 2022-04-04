---
title: Linux 行筛选grep命令
categories: 
  - Linux
  - 通用
  - 正则表达式
abbrlink: 719da334
date: 2021-05-02 21:35:42
updated: 2022-04-04 00:51:45
---
# grep/egrep/fgrep:在文件中查找字符串（筛选）
## grep在文件中查找字符串
grep（Global regular expression print）
### 语法
grep 模式 文件名列表

## egrep 使用扩展正则表达式ERE描述模式
在指定模式方面比grep更灵活
## fgrep 快速搜索指定字符串
按字符串搜索而不是按模式搜索。
## grep选项
-F, --fixed-strings      Fixed strings (instead of regular expressions)
-G, --basic-regexp       Basic regular expression (BRE)
-E, --extended-regexp    Extended regular expression (ERE)
-P, --perl-regexp        Perl-compatible regular expression (PCRE)

-n     显示时每行前面显示行号
-v     显示所有不包含模式的行
-i     字母比较时忽略字母的大小写

例：grep -n main *.c
查找含有正则表达式main的行，并打印行号
当文件数超过一个时，除了输出行号，还输出文件名

例：grep -v '[Dd]isable' dev.stat>dev.active
取消文件中所有含有指定模式的行，生成新文件。

例：grep -i richard telnos
在文件中检索字符串richard，不顾字母的大小写

# 帮助文档

## PCRE语法
查PCRE语法：man pcresyntax
```
PCRESYNTAX(3)                                                        Library Functions Manual                                                       PCRESYNTAX(3)

NAME
       PCRE - Perl-compatible regular expressions

PCRE REGULAR EXPRESSION SYNTAX SUMMARY

       The full syntax and semantics of the regular expressions that are supported by PCRE are described in the pcrepattern documentation. This document contains
       a quick-reference summary of the syntax.

QUOTING

         \x         where x is non-alphanumeric is a literal x
         \Q...\E    treat enclosed characters as literal

CHARACTERS

         \a         alarm, that is, the BEL character (hex 07)
         \cx        "control-x", where x is any ASCII character
         \e         escape (hex 1B)
         \f         form feed (hex 0C)
         \n         newline (hex 0A)
         \r         carriage return (hex 0D)
         \t         tab (hex 09)
         \ddd       character with octal code ddd, or backreference
         \xhh       character with hex code hh
         \x{hhh..}  character with hex code hhh..

CHARACTER TYPES

         .          any character except newline;
                      in dotall mode, any character whatsoever
         \C         one data unit, even in UTF mode (best avoided)
         \d         a decimal digit
         \D         a character that is not a decimal digit
         \h         a horizontal white space character
         \H         a character that is not a horizontal white space character
         \N         a character that is not a newline
         \p{xx}     a character with the xx property
         \P{xx}     a character without the xx property
         \R         a newline sequence
         \s         a white space character
         \S         a character that is not a white space character
         \v         a vertical white space character
         \V         a character that is not a vertical white space character
         \w         a "word" character
         \W         a "non-word" character
         \X         a Unicode extended grapheme cluster

       In PCRE, by default, \d, \D, \s, \S, \w, and \W recognize only ASCII characters, even in a UTF mode. However, this can be changed by setting the  PCRE_UCP
       option.

GENERAL CATEGORY PROPERTIES FOR \p and \P

         C          Other
         Cc         Control
         Cf         Format
         Cn         Unassigned
         Co         Private use
         Cs         Surrogate

         L          Letter
         Ll         Lower case letter
         Lm         Modifier letter
         Lo         Other letter
         Lt         Title case letter
         Lu         Upper case letter
         L&         Ll, Lu, or Lt

         M          Mark
         Mc         Spacing mark
         Me         Enclosing mark
         Mn         Non-spacing mark

         N          Number
         Nd         Decimal number
         Nl         Letter number
         No         Other number

         P          Punctuation
         Pc         Connector punctuation
         Pd         Dash punctuation
         Pe         Close punctuation
         Pf         Final punctuation
         Pi         Initial punctuation
         Po         Other punctuation
         Ps         Open punctuation

         S          Symbol
         Sc         Currency symbol
         Sk         Modifier symbol
         Sm         Mathematical symbol
         So         Other symbol

         Z          Separator
         Zl         Line separator
         Zp         Paragraph separator
         Zs         Space separator

PCRE SPECIAL CATEGORY PROPERTIES FOR \p and \P

         Xan        Alphanumeric: union of properties L and N
         Xps        POSIX space: property Z or tab, NL, VT, FF, CR
         Xsp        Perl space: property Z or tab, NL, FF, CR
         Xwd        Perl word: property Xan or underscore

SCRIPT NAMES FOR \p AND \P

       Arabic,  Armenian, Avestan, Balinese, Bamum, Batak, Bengali, Bopomofo, Brahmi, Braille, Buginese, Buhid, Canadian_Aboriginal, Carian, Chakma, Cham, Chero‐
       kee, Common, Coptic, Cuneiform, Cypriot, Cyrillic, Deseret, Devanagari, Egyptian_Hieroglyphs, Ethiopic, Georgian,  Glagolitic,  Gothic,  Greek,  Gujarati,
       Gurmukhi,  Han,  Hangul, Hanunoo, Hebrew, Hiragana, Imperial_Aramaic, Inherited, Inscriptional_Pahlavi, Inscriptional_Parthian, Javanese, Kaithi, Kannada,
       Katakana, Kayah_Li, Kharoshthi, Khmer, Lao, Latin, Lepcha, Limbu, Linear_B, Lisu, Lycian,  Lydian,  Malayalam,  Mandaic,  Meetei_Mayek,  Meroitic_Cursive,
       Meroitic_Hieroglyphs, Miao, Mongolian, Myanmar, New_Tai_Lue, Nko, Ogham, Old_Italic, Old_Persian, Old_South_Arabian, Old_Turkic, Ol_Chiki, Oriya, Osmanya,
       Phags_Pa, Phoenician, Rejang, Runic, Samaritan, Saurashtra, Sharada, Shavian, Sinhala, Sora_Sompeng, Sundanese, Syloti_Nagri, Syriac,  Tagalog,  Tagbanwa,
       Tai_Le, Tai_Tham, Tai_Viet, Takri, Tamil, Telugu, Thaana, Thai, Tibetan, Tifinagh, Ugaritic, Vai, Yi.

CHARACTER CLASSES

         [...]       positive character class
         [^...]      negative character class
         [x-y]       range (can be used for hex characters)
         [[:xxx:]]   positive POSIX named set
         [[:^xxx:]]  negative POSIX named set

         alnum       alphanumeric
         alpha       alphabetic
         ascii       0-127
         blank       space or tab
         cntrl       control character
         digit       decimal digit
         graph       printing, excluding space
         lower       lower case letter
         print       printing, including space
         punct       printing, excluding alphanumeric
         space       white space
         upper       upper case letter
         word        same as \w
         xdigit      hexadecimal digit

       In  PCRE,  POSIX  character  set names recognize only ASCII characters by default, but some of them use Unicode properties if PCRE_UCP is set. You can use
       \Q...\E inside a character class.

QUANTIFIERS

         ?           0 or 1, greedy
         ?+          0 or 1, possessive
         ??          0 or 1, lazy
         *           0 or more, greedy
         *+          0 or more, possessive
         *?          0 or more, lazy
         +           1 or more, greedy
         ++          1 or more, possessive
         +?          1 or more, lazy
         {n}         exactly n
         {n,m}       at least n, no more than m, greedy
         {n,m}+      at least n, no more than m, possessive
         {n,m}?      at least n, no more than m, lazy
         {n,}        n or more, greedy
         {n,}+       n or more, possessive
         {n,}?       n or more, lazy

ANCHORS AND SIMPLE ASSERTIONS

         \b          word boundary
         \B          not a word boundary
         ^           start of subject
                      also after internal newline in multiline mode
         \A          start of subject
         $           end of subject
                      also before newline at end of subject
                      also before internal newline in multiline mode
         \Z          end of subject
                      also before newline at end of subject
         \z          end of subject
         \G          first matching position in subject

MATCH POINT RESET

         \K          reset start of match

ALTERNATION

         expr|expr|expr...

CAPTURING

         (...)           capturing group
         (?<name>...)    named capturing group (Perl)
         (?'name'...)    named capturing group (Perl)
         (?P<name>...)   named capturing group (Python)
         (?:...)         non-capturing group
         (?|...)         non-capturing group; reset group numbers for
                          capturing groups in each alternative

ATOMIC GROUPS

         (?>...)         atomic, non-capturing group

COMMENT

         (?#....)        comment (not nestable)

OPTION SETTING

         (?i)            caseless
         (?J)            allow duplicate names
         (?m)            multiline
         (?s)            single line (dotall)
         (?U)            default ungreedy (lazy)
         (?x)            extended (ignore white space)
         (?-...)         unset option(s)

       The following are recognized only at the start of a pattern or after one of the newline-setting options with similar syntax:

         (*NO_START_OPT) no start-match optimization (PCRE_NO_START_OPTIMIZE)
         (*UTF8)         set UTF-8 mode: 8-bit library (PCRE_UTF8)
         (*UTF16)        set UTF-16 mode: 16-bit library (PCRE_UTF16)
         (*UTF32)        set UTF-32 mode: 32-bit library (PCRE_UTF32)
         (*UTF)          set appropriate UTF mode for the library in use
         (*UCP)          set PCRE_UCP (use Unicode properties for \d etc)

LOOKAHEAD AND LOOKBEHIND ASSERTIONS

         (?=...)         positive look ahead
         (?!...)         negative look ahead
         (?<=...)        positive look behind
         (?<!...)        negative look behind

       Each top-level branch of a look behind must be of a fixed length.

BACKREFERENCES

         \n              reference by number (can be ambiguous)
         \gn             reference by number
         \g{n}           reference by number
         \g{-n}          relative reference by number
         \k<name>        reference by name (Perl)
         \k'name'        reference by name (Perl)
         \g{name}        reference by name (Perl)
         \k{name}        reference by name (.NET)
         (?P=name)       reference by name (Python)

SUBROUTINE REFERENCES (POSSIBLY RECURSIVE)

         (?R)            recurse whole pattern
         (?n)            call subpattern by absolute number
         (?+n)           call subpattern by relative number
         (?-n)           call subpattern by relative number
         (?&name)        call subpattern by name (Perl)
         (?P>name)       call subpattern by name (Python)
         \g<name>        call subpattern by name (Oniguruma)
         \g'name'        call subpattern by name (Oniguruma)
         \g<n>           call subpattern by absolute number (Oniguruma)
         \g'n'           call subpattern by absolute number (Oniguruma)
         \g<+n>          call subpattern by relative number (PCRE extension)
         \g'+n'          call subpattern by relative number (PCRE extension)
         \g<-n>          call subpattern by relative number (PCRE extension)
         \g'-n'          call subpattern by relative number (PCRE extension)

CONDITIONAL PATTERNS

         (?(condition)yes-pattern)
         (?(condition)yes-pattern|no-pattern)

         (?(n)...        absolute reference condition
         (?(+n)...       relative reference condition
         (?(-n)...       relative reference condition
         (?(<name>)...   named reference condition (Perl)
         (?('name')...   named reference condition (Perl)
         (?(name)...     named reference condition (PCRE)
         (?(R)...        overall recursion condition
         (?(Rn)...       specific group recursion condition
         (?(R&name)...   specific recursion condition
         (?(DEFINE)...   define subpattern for reference
         (?(assert)...   assertion condition

BACKTRACKING CONTROL

       The following act immediately they are reached:

         (*ACCEPT)       force successful match
         (*FAIL)         force backtrack; synonym (*F)
         (*MARK:NAME)    set name to be passed back; synonym (*:NAME)

       The following act only when a subsequent match failure causes a backtrack to reach them. They all force a match failure, but they differ in  what  happens
       afterwards. Those that advance the start-of-match point do so only if the pattern is not anchored.

         (*COMMIT)       overall failure, no advance of starting point
         (*PRUNE)        advance to next starting character
         (*PRUNE:NAME)   equivalent to (*MARK:NAME)(*PRUNE)
         (*SKIP)         advance to current matching position
         (*SKIP:NAME)    advance to position corresponding to an earlier
                         (*MARK:NAME); if not found, the (*SKIP) is ignored
         (*THEN)         local failure, backtrack to next alternation
         (*THEN:NAME)    equivalent to (*MARK:NAME)(*THEN)

NEWLINE CONVENTIONS

       These are recognized only at the very start of the pattern or after a (*BSR_...), (*UTF8), (*UTF16), (*UTF32) or (*UCP) option.

         (*CR)           carriage return only
         (*LF)           linefeed only
         (*CRLF)         carriage return followed by linefeed
         (*ANYCRLF)      all three of the above
         (*ANY)          any Unicode newline sequence

WHAT \R MATCHES

       These are recognized only at the very start of the pattern or after a (*...) option that sets the newline convention or a UTF or UCP mode.

         (*BSR_ANYCRLF)  CR, LF, or CRLF
         (*BSR_UNICODE)  any Unicode newline sequence

CALLOUTS

         (?C)      callout
         (?Cn)     callout with data n

SEE ALSO

       pcrepattern(3), pcreapi(3), pcrecallout(3), pcrematching(3), pcre(3).

AUTHOR

       Philip Hazel
       University Computing Service
       Cambridge CB2 3QH, England.

REVISION

       Last updated: 11 November 2012
       Copyright (c) 1997-2012 University of Cambridge.

PCRE 8.32                                                                11 November 2012                                                           PCRESYNTAX(3)
```

## man grep
```
NAME
       grep, egrep, fgrep - 打印匹配给定模式的行

总览 SYNOPSIS
       grep [options] PATTERN [FILE...]
       grep [options] [-e PATTERN | -f FILE] [FILE...]

描述 DESCRIPTION
       Grep   搜索以   FILE   命名的文件输入   (或者是标准输入，如果没有指定文件名，或者给出的文件名是   -   的话)，寻找含有与给定的模式  PATTERN  相匹配的内容的行。  
       将把含有匹配内容的行打印出来。

       另外，也可以使用两个变种程序 egrep 和 fgrep 。 Egrep 与 grep -E 相同。 Fgrep 与 grep -F 相同。

选项 OPTIONS
       -A NUM, --after-context=NUM
              打印出紧随匹配的行之后的下文 NUM 行。在相邻的匹配组之间将会打印内容是 -- 的一行。

       -a, --text
              将一个二进制文件视为一个文本文件来处理；它与 --binary-files=text 选项等价。

       -B NUM, --before-context=NUM
              打印出匹配的行之前的上文 NUM 行。在相邻的匹配组之间将会打印内容是 -- 的一行。

       -C NUM, --context=NUM
              打印出匹配的行的上下文前后各 NUM 行。在相邻的匹配组之间将会打印内容是 -- 的一行。

       -b, --byte-offset
              在输出的每行前面同时打印出当前行在输入文件中的字节偏移量。

       --binary-files=TYPE
              如果一个文件的起始几个字节表明文件包含二进制数据，那么假定文件是        TYPE        类型的。默认情况下，         TYPE         是         binary         ，
              一般会输出一个一行的消息说一个二进制文件匹配，或者如果没有匹配的话就没有消息输出。如果类型   TYPE   是   without-match   ，那么  grep  假定二进制文件不会
              选项等价。如果类型    TYPE    是    text     ，那么     grep     将一个二进制文件视为文本文件来处理；它与     -a     选项等价。     警告：     grep     -
              可能会输出二进制的无用内容。如果输出设备是一个终端，并且终端的驱动将这些输出中的一些当作命令，可能会带来恶劣的副作用。

       --colour[=WHEN], --color[=WHEN]
              在匹配的行周围以 GREP_COLOR 环境变量中指定的记号来标记。WHEN 可以是 `never', `always', 或是 `auto'。

       -c, --count
              禁止通常的输出；作为替代，为每一个输入文件打印一个匹配的行的总数。如果使用 -v, --invert-match 选项 (参见下面)，将是不匹配的行的总数。

       -D ACTION, --devices=ACTION
              如果输入文件是一个设备，FIFO  或是套接字  (socket)  ，使用动作 ACTION 来处理它。默认情况下，动作 ACTION 是 read ，意味着设备将视为普通文件那样来读。如果动
              ，将不处理而直接跳过设备。

       -d ACTION, --directories=ACTION
              如果输入文件是一个目录，使用动作    ACTION    来处理它。默认情况下，动作    ACTION    是    read    ，意味着目录将视为普通文件那样来读。如果动作     ACTI
              ，将不处理而直接跳过目录。如果动作 ACTION 是 recurse ， grep 将递归地读每一目录下的所有文件。这样做和 -r 选项等价。

       -E, --extended-regexp
              将模式 PATTERN 作为一个扩展的正则表达式来解释 (参见下面)。

       -e PATTERN, --regexp=PATTERN
              使用模式 PATTERN 作为模式；在保护以 - 为起始的模式时有用。

       -F, --fixed-strings
              将模式 PATTERN 视为一个固定的字符串的列表，用新行 (newlines) 分隔，只要匹配其中之一即可。

       -P, --perl-regexp
              将模式 PATTERN 作为一个 Perl 正则表达式来解释。

       -f FILE, --file=FILE
              从文件 FILE 中获取模式，每行一个。空文件含有0个模式，因此不匹配任何东西。

       -G, --basic-regexp
              将模式 PATTERN 作为一个基本的正则表达式 (参见下面) 来解释。这是默认值。

       -H, --with-filename
              为每个匹配打印文件名。

       -h, --no-filename
              当搜索多个文件时，禁止在输出的前面加上文件名前缀。

       --help 输出一个简短的帮助信息。

       -I     处理一个二进制文件，但是认为它不包含匹配的内容。这和 --binary-files=without-match 选项等价。

       -i, --ignore-case
              忽略模式 PATTERN 和输入文件中的大小写的分别。

       -L, --files-without-match
              禁止通常的输出；作为替代，打印出每个在通常情况下不会产生输出的输入文件的名字。对每个文件的扫描在遇到第一个匹配的时候就会停止。

       -l, --files-with-matches
              禁止通常的输出；作为替代，打印出每个在通常情况下会产生输出的输入文件的名字。对每个文件的扫描在遇到第一个匹配的时候就会停止。

       -m NUM, --max-count=NUM
              在找到            NUM            个匹配的行之后，不再读这个文件。如果输入是来自一个普通文件的标准输入，并且已经输出了            NUM            个匹配的行
              保证标准输入被定位于退出时的最后一次匹配的行之后，不管是否指定了要输出紧随的下文的行。这样可以使一个调用程序恢复搜索。当              grep              在
              个匹配的行之后停止，它会输出任何紧随的下文的行。当使用了  -c 或 --count 选项的时候， grep 不会输出比 NUM 更多的行。当指定了 -v 或 --invert-match 选项的时
              NUM 个不匹配的行之后停止。

       --mmap 如果可能的话，使用    mmap(2)    系统调用来读取输入，而不是默认的     read(2)     系统调用。在一些情况下，     --mmap     提供较好的性能。但是，如果一个输
              正在操作时大小发生变化，或者如果发生了一个 I/O 错误， --mmap 可能导致不可知的行为 (包括core dumps)。

       -n, --line-number
              在输出的每行前面加上它所在的文件中它的行号。

       -o, --only-matching
              只显示匹配的行中与 PATTERN 相匹配的部分。

       --label=LABEL
              将实际上来自标准输入的输入视为来自输入文件 LABEL 。这对于 zgrep 这样的工具非常有用，例如： gzip -cd foo.gz |grep --label=foo something

       --line-buffering
              使用行缓冲，it can be a performance penality.

       -q, --quiet, --silent
              安静。不向标准输出写任何东西。如果找到任何匹配的内容就立即以状态值 0 退出，即使检测到了错误。 参见 -s 或 --no-messages 选项。

       -R, -r, --recursive
              递归地读每一目录下的所有文件。这样做和 -d recurse 选项等价。

         --include=PATTERN
              仅仅在搜索匹配 PATTERN 的文件时在目录中递归搜索。

         --exclude=PATTERN
              在目录中递归搜索，但是跳过匹配 PATTERN 的文件。

       -s, --no-messages
              禁止输出关于文件不存在或不可读的错误信息。  对于可移植性需要注意：与 GNU grep 不同，传统的 grep 不遵守 POSIX.2 规范，因为传统的 grep 缺少一个 -q 选项，而
              grep 的 -q 选项行为相似。需要可移植到传统 grep 的 shell 脚本应当避免使用 -q 和 -s 选项，而应当将输出重定向到 /dev/null 。

       -U, --binary
              将文件视为二进制。默认情况下，在     MS-DOS     和     MS-Windows      系统中，      grep      通过从文件中读取头部的      32kB      内容来判断它的文件类
              判断文件是一个文本文件，它将原始文件内容中的         CR         字符去除         (使得含有         ^         和         $         的正则表达式可以正常工作
              将不进行这些工作，而使所有文件保持不变地读取并传递给匹配机制。如果文件是一个以  CR/LF  换行的文本文件，这样作将导致一些正则表达式失败。这个选项在  MS-DOS
              之外的系统中无效。

       -u, --unix-byte-offsets
              报告  Unix  风格的字节偏移量。这个开关使得  grep  报告字节偏移量时，将文件作为  Unix  风格的文本文件看待，也就是说将  CR  字符去掉。这将产生与在一台  Uni
              完全相同的结果。除非同时使用 -b 选项，否则这个选项无效。这个选项在 MS-DOS 和 MS-Windows 之外的系统中无效。

       -V, --version
              向标准错误输出打印 grep 的版本号。版本号应当包含在所有的 bug 报告中 (参见下面)。

       -v, --invert-match
              改变匹配的意义，只选择不匹配的行。

       -w, --word-regexp
              只选择含有能组成完整的词的匹配的行。判断方法是匹配的子字符串必须是一行的开始，或者是在一个不可能是词的组成的字符之后。与此相似，它必须是一行的结束，或者是
的字符之前。词的组成字符是字母，数字，还有下划线。

       -x, --line-regexp
              只选择能匹配完整一行的匹配。

       -y     -i 的同义词，废弃不用。

       -Z, --null
              输出一个全零字节            (ASCII            码中的            NUL            字符)            而不是一般情况下输出在文件名之后的字符。例如，           
              在每个文件名之后输出一个全零字节而不是普通的新行符。这个选项使得输出清楚明白，即使文件名的表示中包含特殊字符比如新行符。这个选项可以与命令 find -print0, 
              和 xargs -0 一起使用，来处理任意的文件名，即使是那些含有新行符的文件名。

正则表达式 REGULAR EXPRESSIONS
       一个正则表达式是一个描述了一个字符串集合的模式。正则表达式的构造类似于算术表达式，使用各种各样的操作符来将更小的表达式连在一起。

       Grep       能理解两种不同版本的正则表达式语法：“basic”       和       “extended”。在       GNU grep       中，两种语法可以实现的功能是没有区别的。在其他实现中，
       正则表达式表达能力要弱一点。下面的描述适用于扩展的 (extended) 正则表达式，它与基本正则表达式的区别会在最后做一个总结。

       基本的构造块是匹配单个字符的正则表达式。大部分字符，包括所有字母和数字，是匹配它们自身的正则表达式。任何具有特殊含义的元字符可以通过前置一个反斜杠来引用。(may b
       ceding it with a backslash.)

       方括号表达式     (bracket)     是一个字符序列，放在     [     和     ]     当中。它匹配序列中的任何一个字符；如果序列中的第一个字符是脱字符     (caret)    ^    
       序列中的任何一个字符。例如，正则表达式 [0123456789] 匹配任何一个数字。

       在方括号表达式之中，一个  范围表达式  (range)  由两个字符组成，中间用一个连字符  (hyphen)  分隔。它匹配在这两个字符之间的任何一个字符，使用本地化的序列顺序和字符
       between  the  two  characters,inclusive,  using  the  locale's  collating  sequence  and  character  set.)  例如，在默认的  C locale中， [a-d] 与 [abcd] 等价。典
       将字符以字典顺序排序，在这些 locale 中， [a-d] 不与 [abcd] 等价；例如它可能与 [aBbCcDd] 等价。要获得传统的对方括号表达式的解释，可以设定环境变量 LC_ALL 值为 C 来

       最后，在方括号表达式中有一些预定义的字符类，如下所示。它们的名字是自说明的，它们是   [:alnum:](字母和数字),   [:alpha:](字母),    [:cntrl:](),    [:digit:](数字
       [:lower:](小写字母),  [:print:](可打印字符),  [:punct:](),  [:space:](空格), [:upper:](大写字母), 和 [:xdigit:] 。例如， [[:alnum:]] 意思是 [0-9A-Za-z] ，但是后
       locale C 和ASCII 字符编码，而前一种是与 locale 和字符集无关的。(注意这些字符类名中的方括号也是符号名称的一部分，必须包含在用来为序列定界的方括号之中。)

       大多数元字符处于序列中时会失去它们的特殊意义。为了包含一个字面意义    (literal)    的    ]     ，需要将它放在序列的最前。与此相似，为了包含一个字面意义     (lit
       ，需要将它放在除了序列最前之外的其他位置。最后，为了包含一个字面意义 (literal) 的 - ，需要将它放在序列最后。

       句点符 (period) .  匹配任何一个字符。符号 \w 是 [[:alnum:]] 的同义词， \W 是 [^[:alnum]] 的同义词。

       脱字符  (caret)  ^  和美元标记  (dollar)  $  分别是匹配一行的首部和尾部的空字串的元字符。符号 \< 和 \> 分别是匹配一个词的首部和尾部的空字串的元字符。符号 \b 匹配
       的空字串，符号 \B 匹配 不 处于一个词的边缘的空字串。

       一个正则表达式后面可以跟随多种重复操作符之一。
       ?      先前的项是可选的，最多匹配一次。
       *      先前的项可以匹配零次或多次。
       +      先前的项可以匹配一次或多次。
       {n}    先前的项将匹配恰好 n 次。
       {n,}   先前的项可以匹配 n 或更多次。
       {n,m}  先前的项将匹配至少 n 词，但是不会超过 m 次。

       两个正则表达式可以连接到一起；得出的正则表达式可以匹配任何由两个分别匹配连接前的子表达式的子字符串连接而成的字符串。

       两个正则表达式可以用中缀操作符 | 联合到一起，得出的正则表达式可以匹配任何匹配联合前的任何一个子表达式的字符串。

       重复操作符的优先级比连接高，接下来又比选择的优先级高。一个完整的子表达式可以用圆括号 (parentheses) 括住来超越这些优先级规则。(to override these precedence rules

       反向引用 \n 中， n 是一个数字，匹配正则表达式中，以第 n 个圆括号括住的子表达式已匹配的子字符串。

       在基本正则表达式中，元字符 ?, +, {, |, (, 和 ) 丧失了它们的特殊意义；作为替代，使用加反斜杠的 (backslash) 版本 \?, \+, \{, \|, \(, 和 \) 。

       传统的 egrep 不支持元字符 { ，并且一些 egrep 的实现通过支持 \{ 来代替它，因此可移植的脚本应当避免 在 egrep 中使用 { 模式，应当使用 [{] 来匹配一个字面意义 (liter

       GNU egrep 通过假设如果 {  处于  an  invalid  interval  specification  的起始，就不是一个特殊字符，来支持传统的用法。例如，shell  命令  egrep  '{1'  将会搜索这个
       而不是报告在正则表达式中发生了语法错误。POSIX.2 允许这个行为，将其视为一个扩展，但是可移植的脚本应当避免使用它。

环境变量 ENVIRONMENT VARIABLES
       Grep 的行为受下列环境变量影响。

       一个  locale  LC_foo  是通过按下面的顺序，  LC_ALL,  LC_foo, LANG, 检查这三个环境变量的取值而确定的。设置了的第一个变量指定了 locale。例如，如果 LC_ALL 没有设置
       设置为 pt_BR ，那么巴西的葡萄牙语 (Brazilian Portuguese) 将用作  LC_MESSAGES  locale  的值。如果没有设置这其中任何一个环境变量，或者没有安装所设置的  locale  目
       没有将国家和语言支持 (national language support (NLS)) 编译在内，将默认使用 locale C。

       GREP_OPTIONS
              这个变量指定了将放在所有显式指定的选项之前的默认选项。例如，如果      GREP_OPTIONS      是      '--binary-files=without-match      --directories=skip'   
              将像已经在任何显式指定的选项之前指定了  --binary-files=without-match   和   --directories=skip   选项那样来运作。选项以空白   (whitespace)   分隔。一个反
              使得下一个字符转义 (escape)，因此可以用来指定一个含有空白或者反斜杠的选项。

       GREP_COLOR
              指定用来高亮显示的标记。

       LC_ALL, LC_COLLATE, LANG
              这些变量指定了 locale LC_COLLATE ，决定了解释类似 [a-z] 的范围表达式时的序列顺序 (collating sequence) 。

       LC_ALL, LC_CTYPE, LANG
              这些选项指定了 locale LC_CTYPE ，决定了字符的类型，例如，哪些字符是空白 (whitespace) 。

       LC_ALL, LC_MESSAGES, LANG
              这些选项指定了 locale LC_MESSAGES ，决定了 grep 的消息使用的语言。默认的 locale C 使用美国英语的消息。

       POSIXLY_CORRECT
              如果设置了的话，          grep          将像          POSIX.2          要求的那样来运作；否则，          grep          将像其他         GNU         程序一样来运作。POSIX.2
              要求文件名之后的选项必须视为文件名；默认情况下，这些选项被交换到操作数列表的前面，被当作选项来处理。同时，     POSIX.2     要求不可识别的选项在诊断消息
中表示为      “ille?
              gal”，但是既然它们没有真正触犯法律，因此默认情况下它们在诊断 (diagnose) 消息中表示为 “invalid”。 POSIXLY_CORRECT 同时禁止了下面描述的 _N_GNU_nonoption_argv_flags_。

       _N_GNU_nonoption_argv_flags_
              (这里    N    是    grep's   数字形式的进程ID。)   如果这个环境变量的值的第   i   个字符是   1   ，那么不将   grep   的第   i   个操作数视为一个选项，即使它看上去像。shell
              可以将这个变量设置在它运行的每个命令的环境中，指定哪个操作数是文件名通配符扩展的结果，因此不应当被视为选项。这个行为只有在使用 GNU C  库时有效，并且只有在  POSIXLY_CORRECT
              没有设置的时候。

诊断 DIAGNOSTICS
       一般地，如果找到了选择的行，退出时状态值为0，否则为1。但是如果发生错误，退出时状态值是2，除非指定了 -q 或 --quiet 或 --silent 选项，并且找到了选择的行。

BUGS
       bug 报告的电子邮件地址是 bug-gnu-utils@gnu.org。 一定要在“Subject:”中带有 “grep” 这个词。

       在 {n,m} 结构中重复次数过多会导致 grep 使用大量内存。另外，一些过分晦涩的正则表达式需要指数级的时间和空间，可能会导致 grep 耗尽所有内存。

       向后引用 (backreferences) 非常慢，可能需要指数级的时间。

```
## grep --help
```
[root@localhost ~]# grep --help
用法: grep [选项]... PATTERN [FILE]...
在每个 FILE 或是标准输入中查找 PATTERN。
默认的 PATTERN 是一个基本正则表达式(缩写为 BRE)。
例如: grep -i 'hello world' menu.h main.c

正则表达式选择与解释:
  -E, --extended-regexp     PATTERN 是一个可扩展的正则表达式(缩写为 ERE)
  -F, --fixed-strings       PATTERN 是一组由断行符分隔的定长字符串。
  -G, --basic-regexp        PATTERN 是一个基本正则表达式(缩写为 BRE)
  -P, --perl-regexp         PATTERN 是一个 Perl 正则表达式
  -e, --regexp=PATTERN      用 PATTERN 来进行匹配操作
  -f, --file=FILE           从 FILE 中取得 PATTERN
  -i, --ignore-case         忽略大小写
  -w, --word-regexp         强制 PATTERN 仅完全匹配字词
  -x, --line-regexp         强制 PATTERN 仅完全匹配一行
  -z, --null-data           一个 0 字节的数据行，但不是空行

Miscellaneous:
  -s, --no-messages         suppress error messages
  -v, --invert-match        select non-matching lines
  -V, --version             display version information and exit
      --help                display this help text and exit

输出控制:
  -m, --max-count=NUM       NUM 次匹配后停止
  -b, --byte-offset         输出的同时打印字节偏移
  -n, --line-number         输出的同时打印行号
      --line-buffered       每行输出清空
  -H, --with-filename       为每一匹配项打印文件名
  -h, --no-filename         输出时不显示文件名前缀
      --label=LABEL         将LABEL 作为标准输入文件名前缀
  -o, --only-matching       show only the part of a line matching PATTERN
  -q, --quiet, --silent     suppress all normal output
      --binary-files=TYPE   assume that binary files are TYPE;
                            TYPE is 'binary', 'text', or 'without-match'
  -a, --text                equivalent to --binary-files=text
  -I                        equivalent to --binary-files=without-match
  -d, --directories=ACTION  how to handle directories;
                            ACTION is 'read', 'recurse', or 'skip'
  -D, --devices=ACTION      how to handle devices, FIFOs and sockets;
                            ACTION is 'read' or 'skip'
  -r, --recursive           like --directories=recurse
  -R, --dereference-recursive
                            likewise, but follow all symlinks
      --include=FILE_PATTERN
                            search only files that match FILE_PATTERN
      --exclude=FILE_PATTERN
                            skip files and directories matching FILE_PATTERN
      --exclude-from=FILE   skip files matching any file pattern from FILE
      --exclude-dir=PATTERN directories that match PATTERN will be skipped.
  -L, --files-without-match print only names of FILEs containing no match
  -l, --files-with-matches  print only names of FILEs containing matches
  -c, --count               print only a count of matching lines per FILE
  -T, --initial-tab         make tabs line up (if needed)
  -Z, --null                print 0 byte after FILE name

文件控制:
  -B, --before-context=NUM  打印以文本起始的NUM 行
  -A, --after-context=NUM   打印以文本结尾的NUM 行
  -C, --context=NUM         打印输出文本NUM 行
  -NUM                      same as --context=NUM
      --group-separator=SEP use SEP as a group separator
      --no-group-separator  use empty string as a group separator
      --color[=WHEN],
      --colour[=WHEN]       use markers to highlight the matching strings;
                            WHEN is 'always', 'never', or 'auto'
  -U, --binary              do not strip CR characters at EOL (MSDOS/Windows)
  -u, --unix-byte-offsets   report offsets as if CRs were not there
                            (MSDOS/Windows)

‘egrep’即‘grep -E’。‘fgrep’即‘grep -F’。
直接使用‘egrep’或是‘fgrep’均已不可行了。
若FILE 为 -，将读取标准输入。不带FILE，读取当前目录，除非命令行中指定了-r 选项。
如果少于两个FILE 参数，就要默认使用-h 参数。
如果有任意行被匹配，那退出状态为 0，否则为 1；
如果有错误产生，且未指定 -q 参数，那退出状态为 2。
```
# grep命令示例
## 显示当前目录下的所有子目录：ls -l|grep '^d'
```
[root@localhost Linux_Test]# ls -l
总用量 48
-rw-r--r--. 1 root root    0 5月   3 15:27 a.txt
-rw-r--r--. 1 root root    0 5月   3 15:27 b.txt
drwxr-xr-x. 2 root root 4096 5月   1 15:16 cat
-rw-r--r--. 1 root root    0 5月   3 15:27 c.txt
drwxr-xr-x. 2 root root 4096 5月   1 15:18 date
-rw-r--r--. 1 root root    0 5月   3 15:27 d.txt
drwxr-xr-x. 2 root root 4096 5月   1 15:16 less
drwxr-xr-x. 2 root root 4096 5月   1 15:14 ls
drwxr-xr-x. 2 root root 4096 5月   1 15:15 more
drwxr-xr-x. 2 root root 4096 5月   1 15:18 ps
drwxr-xr-x. 2 root root 4096 5月   1 15:15 sort
drwxr-xr-x. 2 root root 4096 5月   1 15:14 tr
drwxr-xr-x. 2 root root 4096 5月   1 18:47 uniq
drwxr-xr-x. 2 root root 4096 5月   1 15:17 vi
drwxr-xr-x. 2 root root 4096 5月   1 15:17 wc
drwxr-xr-x. 4 root root 4096 5月   3 14:36 正则表达式
[root@localhost Linux_Test]# ls -l|grep '^d'
drwxr-xr-x. 2 root root 4096 5月   1 15:16 cat
drwxr-xr-x. 2 root root 4096 5月   1 15:18 date
drwxr-xr-x. 2 root root 4096 5月   1 15:16 less
drwxr-xr-x. 2 root root 4096 5月   1 15:14 ls
drwxr-xr-x. 2 root root 4096 5月   1 15:15 more
drwxr-xr-x. 2 root root 4096 5月   1 15:18 ps
drwxr-xr-x. 2 root root 4096 5月   1 15:15 sort
drwxr-xr-x. 2 root root 4096 5月   1 15:14 tr
drwxr-xr-x. 2 root root 4096 5月   1 18:47 uniq
drwxr-xr-x. 2 root root 4096 5月   1 15:17 vi
drwxr-xr-x. 2 root root 4096 5月   1 15:17 wc
drwxr-xr-x. 4 root root 4096 5月   3 14:36 正则表达式
[root@localhost Linux_Test]# 
```
## 显示当前目录下的所有文件：ls -l|grep '^-'
```
[root@localhost Linux_Test]# ls -l|grep '^-'
-rw-r--r--. 1 root root    0 5月   3 15:27 a.txt
-rw-r--r--. 1 root root    0 5月   3 15:27 b.txt
-rw-r--r--. 1 root root    0 5月   3 15:27 c.txt
-rw-r--r--. 1 root root    0 5月   3 15:27 d.txt
[root@localhost Linux_Test]# 
```
# 参考资料
