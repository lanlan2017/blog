---
title: Java正则表达式Matcher类
categories: 
  - 编程
  - Java
  - Java 基础
  - Java 正则表达式
date: 2021-04-13 20:35:55
updated: 2021-04-13 22:05:01
---
# Matcher类
Matcher对象是一个状态机器，它依据Pattern对象做为匹配模式对字符串展开匹配检查，此类的实例**用于多个并发线程是不安全的**。



|方法|描述|
|:--|:--|
|`String group(int group)`|Returns the input subsequence captured by the given group during the previous match operation.|
|`String group(String name)`|Returns the input subsequence captured by the given named-capturing group during the previous match operation.|
|`int start(int group)`|Returns the start index of the subsequence captured by the given group during the previous match operation.|
|`int end(int group)`|Returns the offset after the last character of the subsequence captured by the given group during the previous match operation.|
|`int end(String name)`|Returns the offset after the last character of the subsequence captured by the given named-capturing group during the previous match operation.|
|`boolean find(int start)`|Resets this matcher and then attempts to find the next subsequence of the input sequence that matches the pattern, starting at the specified index.|
|`int groupCount()`|Returns the number of capturing groups in this matcher's pattern.|
|`boolean hasAnchoringBounds()`|Queries the anchoring of region bounds for this matcher.|
|`boolean hasTransparentBounds()`|Queries the transparency of region bounds for this matcher.|
|`boolean hitEnd()`|Returns true if the end of input was hit by the search engine in the last match operation performed by this matcher.|
|`boolean lookingAt()`|Attempts to match the input sequence, starting at the beginning of the region, against the pattern.|
|`boolean matches()`|Attempts to match the entire region against the pattern.|
|`Pattern pattern()`|Returns the pattern that is interpreted by this matcher.|
|`static String quoteReplacement(String s)`|Returns a literal replacement String for the specified String.|
|`Matcher region(int start, int end)`|Sets the limits of this matcher's region.|
|`int regionEnd()`|Reports the end index (exclusive) of this matcher's region.|
|`int regionStart()`|Reports the start index of this matcher's region.|
|`String replaceAll(String replacement)`|Replaces every subsequence of the input sequence that matches the pattern with the given replacement string.|
|`String replaceAll(Function<MatchResult,​String> replacer)`|Replaces every subsequence of the input sequence that matches the pattern with the result of applying the given replacer function to the match result of this matcher corresponding to that subsequence.|
|`String replaceFirst(String replacement)`|Replaces the first subsequence of the input sequence that matches the pattern with the given replacement string.|
|`String replaceFirst(Function<MatchResult,​String> replacer)`|Replaces the first subsequence of the input sequence that matches the pattern with the result of applying the given replacer function to the match result of this matcher corresponding to that subsequence.|
|`boolean requireEnd()`|Returns true if more input could change a positive match into a negative one.|
|`Matcher reset()`|Resets this matcher.|
|`Matcher reset(CharSequence input)`|Resets this matcher with a new input sequence.|
|`Stream<MatchResult> results()`|Returns a stream of match results for each subsequence of the input sequence that matches the pattern.|
|`int start(String name)`|Returns the start index of the subsequence captured by the given named-capturing group during the previous match operation.|
|`MatchResult toMatchResult()`|Returns the match state of this matcher as a MatchResult.|
|`String toString()`|Returns the string representation of this matcher.|
|`Matcher useAnchoringBounds(boolean b)`|Sets the anchoring of region bounds for this matcher.|
|`Matcher usePattern(Pattern newPattern)`|Changes the Pattern that this Matcher uses to find matches with.|
|`Matcher useTransparentBounds(boolean b)`|Sets the transparency of region bounds for this matcher.|



|方法|描述|
|:--|:--|
|`boolean find()`|Attempts to find the next subsequence of the input sequence that matches the pattern.|
|`int end()`|Returns the offset after the last character matched.|
|`Matcher appendReplacement(StringBuffer sb, String replacement)`|Implements a non-terminal append-and-replace step.|
|`Matcher appendReplacement(StringBuilder sb, String replacement)`|Implements a non-terminal append-and-replace step.|
|`StringBuffer appendTail(StringBuffer sb)`|Implements a terminal append-and-replace step.|
|`StringBuilder appendTail(StringBuilder sb)`|Implements a terminal append-and-replace step.|
|`int start()`|Returns the start index of the previous match.|
|`String group()`|Returns the input subsequence matched by the previous match.|


### 小结
- `find()`方法匹配子串的时候都会**记下**本次成功**匹配子串的`开始位置`和`结束位置`**
- `appendReplacement(sb`,`replacement)`方法先获取所有`从上次匹配的结束位置，到本次匹配结束位置的所有字符串`，然后`替换其中匹配的部分`，最后追加到`sb`中。
- `appendReplacement(sb)`方法把结束位置到文本结尾的所有字符追加到`sb`中。
- 使用appendReplace()和appendTail()方法可以更加灵活的进行替换操作，注意要结合find()方法使用。


# 参考资料
[http://www.51gjie.com/java/759.html](http://www.51gjie.com/java/759.html)