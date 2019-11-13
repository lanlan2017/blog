---
title: 在线工具
date: 2019-10-17 12:08:16
comments: false
---
<div id="panel"><textarea rows="16" id="input" placeholder="请输入" contenteditable="true"></textarea><span class="button-group"><button class="button button-primary button-rounded button-raised button-small"onclick="clearInput()">clearInput</button><button class="button button-primary button-rounded button-raised button-small" onclick="copy()">copy</button><button class="button button-primary button-rounded button-raised button-small" onclick="undo()">undo</button><button class="button button-primary button-rounded button-raised button-small"onclick="unNiuke()">unNiuke</button></span><br><span>计数器:</span><input type="text" name="counter" id="counter" value="1" size="3" /><br><span class="button-group"><button class="button button-action button-rounded button-raised button-small"onclick="document.getElementById('counter').value='1'">reset</button><button class="button button-action button-rounded button-raised button-small" onclick="plus()">plus</button><button class="button button-action button-rounded button-raised button-small"onclick="minus()">minus</button></span><br><span>转成Markdown:</span><br><span class="button-group"><button class="button button-highlight button-square button-raised button-small" onclick="mdU()">u</button><button class="button button-highlight button-square button-raised button-small" onclick="mdO()">o</button><button class="button button-highlight button-square button-raised button-small" onclick="mdQ()">q</button><button class="button button-highlight button-square button-raised button-small"onclick="mdCodeInLine()">k</button><button class="button button-highlight button-square button-raised button-small"onclick="mdCodeInLines()">ks</button><button class="button button-highlight button-square button-raised button-small" onclick="mdB()">b</button><button class="button button-highlight button-rounded button-raised button-small"onclick="mdtableCopy()">table</button><button class="button button-highlight button-square button-raised button-small" onclick="mdU2T()">u2t</button><button class="button button-highlight button-square button-raised button-small"onclick="frontMatter()">FM</button><br></span><br><span>Markdown代码块:</span><select id="Option" name="Option"><option value=''>不设置语言</option><option value="java" selected>java</option><option value="javascript">javascript</option><option value="html">html</option><option value="sql">sql</option><option value="css">css</option></select><br><span class="button-group"><button class="button button-highlight button-square button-raised button-small"onclick="mdCbOption()">cb</button><button class="button button-highlight button-rounded button-raised button-small" onclick="mdCb('java')">cbjava</button><button class="button button-highlight button-rounded button-raised button-small"onclick="mdCb('javascript')">cb js</button><button class="button button-highlight button-rounded button-raised button-small" onclick="mdCb('html')">cbhtml</button><button class="button button-highlight button-rounded button-raised button-small" onclick="mdCb('css')">cbcss</button><button class="button button-highlight button-rounded button-raised button-small" onclick="mdCb('sql')">cbsql</button></span><br><span>格式化:</span><br><span class="button-group"><button class="button button-caution button-rounded button-raised button-small"onclick="niuke()">niuke</button><button class="button button-caution button-rounded button-raised button-small"onclick="formatJava()">formatJava</button><button class="button button-caution button-rounded button-raised button-small"onclick="cHeader()">cHeader</button></span><br><span>字符串转换:</span><br><span class="button-group"><button class="button button-royal button-square button-raised button-small"onclick="upperCase()">大写</button><button class="button button-royal button-square button-raised button-small"onclick="lowerCase()">小写</button></span><span class="button-group"><button class="button button-royal button-rounded button-raised button-small" onclick="tab()">tab</button><button class="button button-royal button-rounded button-raised button-small"onclick="unTab()">unTab</button></span><span class="button-group"><button class="button button-royal button-rounded button-raised button-small"onclick="deleteSingleLineComment()">删除单行注释</button><button class="button button-royal button-rounded button-raised button-small"onclick="deleteBlankLine()">删除空行</button><button class="button button-royal button-rounded button-raised button-small"onclick="deleteSpaceStart()">删除行头空白</button><button class="button button-royal button-rounded button-raised button-small"onclick="toOneLine()">toOneLine</button></span><span class="button-group"><button class="button button-royal button-rounded button-raised button-small"onclick="toEnPunctuation()">使用英文标点符号</button><button class="button button-royal button-rounded button-raised button-small"onclick="toTools()">toTools</button></span><br><span>其他工具</span><br><a href='/blog/html/6a91baf/'>Git 推送流程</a></div>    <script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<link href="https://cdn.bootcss.com/Buttons/2.0.0/css/buttons.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/Buttons/2.0.0/js/buttons.min.js"></script>

<style type="text/css">
    /* input[type="button"] {
        margin: 0.25em;
    } */
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
    function plus() {
        var counter = document.getElementById('counter');
        counter.value = Number(counter.value) + 1
    }
    function minus() {
        var counter = document.getElementById('counter');
        var minus1 = Number(counter.value) - 1;
        counter.value = (minus1) > 0 ? minus1 : 1;
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
    function unNiuke() {
        undo();
        minus();
    }
    function niuke() {
        var problem = '';
        var selects = '';
        var answer = '';
        var selectStart = 0;
        var selectEnd = 0;
        var counter = document.getElementById("counter");
        var text = input.value;
        text = toEnPunctuation(text);
        selects = text.match(/(?:[A-z]\n.+?\n)+/mg)[0];
        selectStart = text.indexOf(selects);
        selectEnd = selectStart + selects.length;
        selects = mdCodeInLines(selects);
        selects = selects.replace(/([A-Z])\n(.+)/mg, "- $1 $2");
        problem += text.substring(0, selectStart);
        answer = text.substring(selectEnd);
        answer = deleteBlankLine(answer);
        answer = answer.replace(/(^正确答案: `?[A-Za-z]+`?$)/mg,
            "\n## 解析\n<details><summary>显示答案/隐藏答案</summary>$1</details>\n\n");
        text = "\n# 题目" + counter.value + "\n" + problem + selects + answer;
        result(text);
        plus();
    }
    function convertSingleLineComments(text) {
        return text.replace(/(?:[ ]*)(\/\/.+)/mg, "$1__newLine__");
    }
    function restoreSingleLineComment(text) {
        var textTemp = '';
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
                textTemp += text.substring(end, start);
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
                textTemp += recovery;
            }
        }
        textTemp += text.substring(end);
        return textTemp;
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
