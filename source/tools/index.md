---
title: 在线工具
date: 2019-10-17 12:08:16
comments: false
---
<div id="panel"><textarea rows="16" id="input" placeholder="请输入" contenteditable="true"></textarea><input type="button" value="清空输入" onclick="clearInput()" /><input type="button" value="copy" onclick="copy()" /><input type="button" value="undo" onclick="undo()" /><br><span>转成Markdown:</span><br><input type="button" value="u" onclick="mdU()" /><input type="button" value="o" onclick="mdO()" /><input type="button" value="q" onclick="mdQ()" /><input type="button" value="k" onclick="mdCodeInLine()" /><input type="button" value="ks" onclick="mdCodeInLines()" /><input type="button" value="b" onclick="mdB()" /><input type="button" value="table" onclick="mdtableCopy()" /><input type="button" value="u2t" onclick="mdU2T()" /><input type="button" value="FM" onclick="frontMatter()" /><br><select id="Option" name="Option"><option value=''>不设置语言</option><option value="java" selected>java</option><option value="javascript">javascript</option><option value="html">html</option><option value="sql">sql</option><option value="css">css</option></select><input type="button" value="cb" onclick="mdCbOption()" /><input type="button" value="cb java" onclick="mdCb('java')" /><input type="button" value="cb js" onclick="mdCb('javascript')" /><input type="button" value="cb html" onclick="mdCb('html')" /><input type="button" value="cb css" onclick="mdCb('css')" /><input type="button" value="cb sql" onclick="mdCb('sql')" /><br><span>格式化:</span><br><span>计数:</span><input type="text" name="count" id="count" value="1" size="3" /><input type="button" id="Reset" value="reset" onclick="document.getElementById('count').value='1'" /><input type="button" value="niuke" onclick="niuke()" /><input type="button" value="formatJava" onclick="formatJava()" /><input type="button" value="cHeader" onclick="cHeader()" /><br><span>字符串转换:</span><br><input type="button" value="大写" onclick="upperCase()" /><input type="button" value="小写" onclick="lowerCase()" /><input type="button" value="tab" onclick="tab()" /><input type="button" value="unTab" onclick="unTab()" /><input type="button" value="删除单行注释" onclick="deleteSingleLineComment()" /><input type="button" value="删除空行" onclick="deleteBlankLine()" /><input type="button" value="删除行头空白" onclick="deleteSpaceStart()" /><input type="button" value="toOneLine" onclick="toOneLine()" /><input type="button" value="使用英文标点符号" onclick="toEnPunctuation()" /><input type="button" value="toTools" onclick="toTools()" /><br><span>其他工具</span><br><a href='/blog/html/6a91baf/'>Git 推送流程</a></div>
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
    var depth = 0;
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
        input.select();
        document.execCommand("Copy");
        input.blur();
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
    function result(text) {
        backupInput();
        input.value = text;
        copy();
    }
    function upperCase() {
        if (checkInput()) {
            result(input.value.toUpperCase());
        } else {
            input.placeholder = "请先输入!";
        }
    }
    function lowerCase() {
        if (checkInput()) {
            result(input.value.toLowerCase());
        } else {
            input.placeholder = "请先输入!";
        }
    }
    function deleteSingleLineComment(text) {
        if (typeof (text) == "undefined") {
            result(deleteSingleLineComment(input.value));
        }
        else {
            text = text.replace(/^[ ]*<!--.+-->/mg, "");
            return text.replace(/^[ ]*\/\/.*\n/mg, "");
        }
    }
    function deleteBlankLine(text) {
        if (typeof (text) == "undefined") {
            text = input.value;
            result(text.replace(/^[ ]*\n/mg, ""));
        }
        else {
            text = text.replace(/^[ ]*$\n/mg, "");
            text = text.replace(/\n^[ ]*$/mg, "");
            return text;
        }
    }
    function tab() {
        result(input.value.replace(/^/mg, "    "));
    }
    function unTab(text) {
        if (typeof (text) == "undefined") {
            result(unTab(input.value));
        }
        else {
            return text.replace(/^    /mg, "");
        }
    }
    function deleteSpaceStart(text) {
        if (typeof (text) == "undefined") {
            result(deleteBlankLine(input.value));
        } else {
            return text.replace(/^[ ]+/mg, "");
        }
    }
    function toOneLine(text) {
        if (typeof (text) == "undefined") {
            result(toOneLine(input.value));
        }
        else {
            text = text.replace(/^[ ]+/mg, "");
            text = text.replace(/\n/mg, "");
            return text;
        }
    }
    function toEnPunctuation(text) {
        if (typeof (text) == "undefined") {
            result(toEnPunctuation(input.value));
        }
        else {
            text = text.replace(/“/g, '"');
            text = text.replace(/”/g, '"');
            text = text.replace(/‘/g, "'");
            text = text.replace(/’/g, "'");
            text = text.replace(/，/g, ",");
            text = text.replace(/！/g, "!");
            text = text.replace(/：/g, ":");
            text = text.replace(/；/g, ";");
            text = text.replace(/（/g, "(");
            text = text.replace(/）/g, ")");
            return text;
        }
    }
    function miniDiv(text) {
        var miniText = text.match(/([ ]*<div id="panel">\n(?:.*\n)+?[ ]*<\/div>)/m)[0];
        console.log(miniText);
        miniText = toOneLine(miniText);
        text = text.replace(/([ ]*<div id="panel">\n(?:.*\n)+?[ ]*<\/div>)/m, "");
        return miniText + text;
    }
    function toTools() {
        var text = input.value;
        text = deleteSingleLineComment(text);
        text = deleteBlankLine(text)
        text = text.replace(/(?:.*\n)+<body>\n/m, "");
        text = text.replace(/<\/body>\n(?:.*\n?)*/m, "");
        text = miniDiv(text);
        text = unTab(text);
        result(text)
    }
    function mdU() {
        var text = input.value;
        text = deleteBlankLine(text);
        var ErrorStartCharacterRegex = /^[^a-zA-Z0-9\u4e00-\u9fa5][ ]+/mg;
        text = text.replace(ErrorStartCharacterRegex, "");
        text = text.replace(/^(.+)/mg, "- $1");
        text = deleteBlankLine(text);
        text = text + "\n";
        result(text);
    }
    function mdO() {
        var text = input.value;
        text = deleteBlankLine(text);
        var ErrorStartCharacterRegex = /^[^a-zA-Z0-9\u4e00-\u9fa5][ ]+/mg;
        text = text.replace(ErrorStartCharacterRegex, "");
        var lines = text.split(/\n/mg);
        var outText = "";
        lines.forEach(function (item, index) {
            outText += (index + 1) + ". " + item + "\n";
        })
        outText = outText + "\n";
        result(outText);
    }
    function mdQ() {
        var text = input.value;
        text = deleteBlankLine(text);
        var ErrorStartCharacterRegex = /^[^a-zA-Z0-9\u4e00-\u9fa5][ ]+/mg;
        text = text.replace(ErrorStartCharacterRegex, "")
        text = text.replace(/^/mg, "> ");
        text = text + "\n";
        result(text);
    }
    function mdCodeInLine() {
        result("`" + input.value + "`");
    }
    function mdCodeInLines(text) {
        if (typeof (text) == "undefined") {
            result(mdCodeInLines(input.value));
        } else {
            text = text.replace(/`?((?:-(?! ))?[a-zA-Z<][a-zA-Z0-9 ():\_.\/\[\]<>,+="-]*[a-zA-Z0-9)>/.\*])`?/mg,
                "`$1`");
            return text;
        }
    }
    function mdB() {
        result("**" + input.value + "**");
    }
    function mdCb(Language) {
        result("```" + Language + "\n" + input.value + "\n```");
    }
    function mdCbOption() {
        mdCb(document.getElementById('Option').value);
    }
    function mdU2T() {
        var tableHead = "||描述|\n|:--|:--|\n"
        var text = input.value;
        text = deleteSpaceStart(text);
        text = deleteBlankLine(text);
        text = toEnPunctuation(text);
        text = mdCodeInLines(text);
        text = text.replace(/^[-*] /mg, "");
        text = text.replace(/^(`.+?`):/mg, "$1|");
        text = text.replace(/^/mg, "|");
        text = text.replace(/$/mg, "|");
        text = tableHead + text;
        result(text);
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
        result(text);
    }
    function frontMatter() {
        var text = input.value;
        text = text.replace(/\n/mg, "");
        var title = text.replace(/^.+source\/_posts.+\/(.+?).md$/, "$1");
        var dateStr = title.match(/(\d{4}年\d{1,2}月\d{1,2})日/)[1];
        dateStr = dateStr.replace(/([年月])/g, "-");
        var now = new Date();
        dateStr += " " + now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
        console.log(dateStr);
        var categories = text.replace(/^.+source\/_posts(.+)\/.+?.md$/, "$1");
        categories = categories.replace(/\//g, "\n  - ");
        var fm = "---\n" + "title: " + title + "\n" + "categories: " + categories + "\n" + "date: " + dateStr +
            "\n---\n";
        result(fm);
    }
    function niuke() {
        var count = document.getElementById("count");
        var text = input.value;
        text = deleteBlankLine(text);
        text = toEnPunctuation(text);
        text = mdCodeInLines(text);
        text = text.replace(/([A-Z])\n(.+)/mg, "- $1 $2");
        text = text.replace(/(^正确答案: [A-Za-z]+$)/mg,
            "\n## 解析\n<details><summary>显示答案/隐藏答案</summary>$1</details>\n\n");
        text = "\n# 题目" + count.value + "\n" + text;
        result(text);
        count.value = Number(count.value) + 1;
    }
    function convertSingleLineComments(text) {
        return text.replace(/(?:[ ]*)(\/\/.+)/mg, "$1__newLine__");
    }
    function restoreSingleLineComment(text) {
        var tempText = '';
        var regex = /([ ]*)(?:(\/\/.+?)__newLine__)+(.*)/mg;
        var flag;
        if ((flag = regex.test(text))) {
            var singleLineComments = text.match(regex);
            var tabs = '';
            var start = 0;
            var end = 0;
            for (var i = 0; i < singleLineComments.length; i++) {
                var recovery = '';
                start = text.indexOf(singleLineComments[i]);
                tempText += text.substring(end, start);
                end = start + singleLineComments[i].length;
                var singleLineCommentArr = singleLineComments[i].split("__newLine__");
                for (var j = 0; j < singleLineCommentArr.length; j++) {
                    if (j == 0) {
                        tabs = singleLineCommentArr[j].substring(0, singleLineCommentArr[j].indexOf("//"));
                        recovery += singleLineCommentArr[j] + "\n";
                    } else {
                        recovery += tabs + singleLineCommentArr[j] + "\n";
                    }
                }
                tempText += recovery;
            }
        }
        tempText += text.substring(end);
        return tempText;
    }
    function restoreFor(text) {
        return text.replace(/for[ ]*\((.*?);\n?[ ]*(.*?);\n?[ ]*(.+)\)/mg, "for($1;$2;$3)");
    }
    function formatJava(inputValue) {
        if (typeof (inputValue) == "undefined") {
            var text = input.value;
            text = toEnPunctuation(text);
            text = convertSingleLineComments(text);
            text = toOneLine(text);
            text = formatJava(text);
            text = restoreSingleLineComment(text);
            text = deleteBlankLine(text);
            text = restoreFor(text);
            console.log(text);
            result(text);
        }
        else {
            var lineTemp = '';
            var value = '';
            for (var i = 0; i < inputValue.length; i++) {
                value = inputValue[i];
                if (value == "{") {
                    depth++;
                    lineTemp
                        += "{" + "\n" + depthTab(depth);
                } else if (value == "}") {
                    depth--;
                    lineTemp += "\n" + depthTab(depth) +
                        "}" + "\n" + depthTab(depth);
                    if (depth == 0) {
                        lineTemp += "\n";
                    }
                } else if (value == ";") {
                    lineTemp
                        += ";" + "\n" + depthTab(depth);
                } else {
                    lineTemp += value;
                }
            }
            return lineTemp;
        }
    }
    function depthTab(depth) {
        var tab = "    ";
        var depthTabs = '';
        for (var i = 0; i < depth; i++) {
            depthTabs += tab;
        }
        return depthTabs;
    }
    function cHeader() {
        if (checkInput()) {
            var legalFileName = /^[a-zA-Z_]\w*$/;
            if (legalFileName.test(input.value)) {
                var upperCase = input.value.toUpperCase();
                var text = "//" + input.value + ".h\n" + "#ifndef _" + upperCase + "_H_ //如果没有引入头文件" + input
                    .value + ".h\n" + "    #define _" + upperCase + "_H_ //那就引入头文件" + input.value + ".h\n" +
                    "#endif";
                result(text);
            } else {
                input.placeholder = "输入文件名格式错误,请以字母或下划线开头!";
            }
        } else {
            input.placeholder = "请先输入不带后缀的头文件名称";
        }
    }
</script>
