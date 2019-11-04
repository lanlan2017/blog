---
title: 在线工具
date: 2019-10-17 12:08:16
comments: false
---
<textarea rows="16" id="input" placeholder="请输入" contenteditable="true"></textarea><input type="button" value="清空输入" onclick="clearInput()" /><input type="button" value="undo" onclick="undo()" /><br><span>转成Markdown:</span><br><input type="button" value="u" onclick="mdU()" /><input type="button" value="o" onclick="mdO()" /><input type="button" value="q" onclick="mdQ()" /><input type="button" value="k" onclick="mdCodeInLine()" /><input type="button" value="b" onclick="mdB()" /><input type="button" value="table" onclick="mdtableCopy()" /><br><select id="Option" name="Option"><option value=''>不设置语言</option><option value="java" selected>java</option><option value="javascript">javascript</option><option value="html">html</option><option value="sql">sql</option><option value="css">css</option></select><input type="button" value="cb" onclick="mdCbOption()" /><input type="button" value="cb java" onclick="mdCb('java')" /><input type="button" value="cb js" onclick="mdCb('javascript')" /><input type="button" value="cb html" onclick="mdCb('html')" /><input type="button" value="cb css" onclick="mdCb('css')" /><input type="button" value="cb sql" onclick="mdCb('sql')" /><br><span>格式化:</span><br><span>计数:</span><input type="text" name="count" id="count" value="1" size="3" /><input type="button" id="Reset" value="reset" onclick="document.getElementById('count').value='1'" /><input type="button" value="niuke" onclick="niuke()" /><input type="button" value="cHeader" onclick="cHeader()" /><br><span>字符串转换:</span><br><input type="button" value="大写" onclick="upperCase()" /><input type="button" value="小写" onclick="lowerCase()" /><input type="button" value="tab" onclick="tab()" /><input type="button" value="删除单行注释" onclick="deleteSingleLineComment()" /><input type="button" value="删除空行" onclick="deleteBlankLineInput()" /><input type="button" value="删除行头空白" onclick="deleteStartSpace()" /><input type="button" value="toOneLine" onclick="toOneLine()" /><br><span>其他工具</span><br><a href='/blog/html/6a91baf/'>Git 推送流程</a>
<style type="text/css">
    input[type="button"] {
        margin: 0.25em;
    }
    textarea {
        width: 100%;
        margin-right: auto;
    }
    header.post-header div.post-meta {
        margin-bottom: 0.875em;
    }
    div.posts-expand div.post-block {
        padding-top: 0em;
    }
</style>
<script>
    var input = document.getElementById("input");
    var inputBackup;
    var timeOut;
    function checkInput() {
        return !(input.value === null || input.value === "");
    }
    function backupInput() {
        inputBackup = input.value;
    }
    function undo() {
        input.value = inputBackup;
        if (timeOut != null) {
            window.clearTimeout(timeOut);
        }
    }
    function clearInput() {
        input.value = "";
    }
    function copy() {
        if (timeOut != null) {
            window.clearTimeout(timeOut);
        }
        input.select();
        document.execCommand("Copy");
        input.placeholder = "运行结果已经复制到剪贴板中!";
        input.blur();
        timeOut = window.setTimeout(clearInput, 10000);
    }
    function upperCase() {
        if (checkInput()) {
            backupInput();
            input.value = input.value.toUpperCase();
            copy();
        } else {
            input.placeholder = "请先输入!";
        }
    }
    function lowerCase() {
        if (checkInput()) {
            backupInput();
            input.value = input.value.toLowerCase();
            copy();
        } else {
            input.placeholder = "请先输入!";
        }
    }
    function deleteSingleLineComment() {
        var text = input.value;
        backupInput();
        text = text.replace(/^[ ]*\/\/.*\n/mg, "");
        input.value = text;
        copy();
    }
    function deleteBlankLineInput() {
        var text = input.value;
        backupInput();
        text = text.replace(/^[ ]*\n/mg, "");
        input.value = text;
        copy();
    }
    function deleteBlankLine(text) {
        return text.replace(/^[ ]*\n/mg, "");
    }
    function tab() {
        var text = input.value;
        backupInput();
        text = text.replace(/^/mg, "    ");
        input.value = text;
        copy();
    }
    function deleteStartSpace() {
        var text = input.value;
        backupInput();
        text = text.replace(/^[ ]+/mg, "");
        input.value = text;
        copy();
    }
    function toOneLine() {
        var text = input.value;
        backupInput();
        text = text.replace(/^[ ]+/mg, "");
        text = text.replace(/\n/mg, "");
        input.value = text;
        copy();
    }
    function mdU() {
        var text = input.value;
        backupInput();
        text = deleteBlankLine(text);
        var ErrorStartCharacterRegex = /^[^a-zA-Z0-9\u4e00-\u9fa5][ ]+/mg;
        text = text.replace(ErrorStartCharacterRegex, "");
        text = text.replace(/^/mg, "- ");
        input.value = text + "\n";
        copy();
    }
    function mdO() {
        var text = input.value;
        backupInput();
        text = deleteBlankLine(text);
        var ErrorStartCharacterRegex = /^[^a-zA-Z0-9\u4e00-\u9fa5][ ]+/mg;
        text = text.replace(ErrorStartCharacterRegex, "");
        var lines = text.split(/\n/mg);
        var outText = "";
        lines.forEach(function (item, index) {
            outText += (index + 1) + ". " + item + "\n";
        })
        input.value = outText + "\n";
        copy();
    }
    function mdQ() {
        var text = input.value;
        backupInput();
        text = deleteBlankLine(text);
        var ErrorStartCharacterRegex = /^[^a-zA-Z0-9\u4e00-\u9fa5][ ]+/mg;
        text = text.replace(ErrorStartCharacterRegex, "")
        text = text.replace(/^/mg, "> ");
        input.value = text + "\n";
    }
    function mdCodeInLine() {
        backupInput();
        input.value = "`" + input.value + "`";
        copy();
    }
    function mdB() {
        backupInput();
        input.value = "**" + input.value + "**";
        copy();
    }
    function mdCb(Language) {
        backupInput();
        input.value = "```" + Language + "\n" + input.value + "\n```";
        copy();
    }
    function mdCbOption() {
        mdCb(document.getElementById('Option').value);
    }
    function mdtableCopy() {
        var text = input.value;
        text = text.replace(/[ ]{2,}/mg, "|");
        text = text.replace(/^/mg, "|");
        text = text.replace(/$/mg, "|");
        var strs = text.split("\n");
        text = '';
        strs.forEach(function (item, index) {
            console.log(index)
            if (index == 1) {
                text += item.replace(/[^|]+/mg, ":--") + "\n";
            }
            text += item + "\n";
        });
        backupInput();
        input.value = text;
        copy();
    }
    function niuke() {
        var count = document.getElementById("count");
        var text = input.value;
        backupInput();
        text = deleteBlankLine(text);
        text = text.replace(/([A-Z])\n(.+)/mg, "- $1 $2");
        text = text.replace(/(^正确答案)/mg, "\n$1");
        input.value = "\n# 题目" + count.value + "\n" + text + "\n\n## 解析\n";
        count.value = Number(count.value) + 1;
        copy();
    }
    function cHeader() {
        if (checkInput()) {
            var legalFileName = /^[a-zA-Z_]\w*$/;
            if (legalFileName.test(input.value)) {
                backupInput();
                var upperCase = input.value.toUpperCase();
                input.value = "//" + input.value + ".h\n" + "#ifndef _" + upperCase + "_H_ //如果没有引入头文件" + input
                    .value + ".h\n" + "    #define _" + upperCase + "_H_ //那就引入头文件" + input.value + ".h\n" +
                    "#endif";
                copy();
            } else {
                input.placeholder = "输入文件名格式错误,请以字母或下划线开头!";
            }
        } else {
            input.placeholder = "请先输入不带后缀的头文件名称";
        }
    }
</script>