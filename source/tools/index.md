---
title: 在线工具
date: 2019-10-17 12:08:16
comments: false
---
<div id="panel"><textarea rows="14" id="input" placeholder="请输入" contenteditable="true"></textarea><br><span class="tools"><span><button class="btn" onclick="clearInput()">清空输入</button><button class="btn" onclick="copy()">copy</button><button class="btn" onclick="undo()">undo</button><button class="btn" onclick="unNiuke()">unNiuke</button><button class="btn" onclick="linksTOC()">linksTOC</button><button class="btn" onclick="tags()">tags</button></span><br><span>计数器:</span><input type="text" name="counter" id="counter" value="1" size="3" /><span><button class="btn btn-color-red" onclick="document.getElementById('counter').value='1'">reset</button><button class="btn btn-color-red" onclick="plus()">plus</button><button class="btn btn-color-red" onclick="minus()">minus</button></span><br><span>转成Markdown:</span><br><span><button class="btn btn-color-green" onclick="mdU()">u</button><button class="btn btn-color-green" onclick="mdO()">o</button><button class="btn btn-color-green" onclick="mdQ()">q</button><button class="btn btn-color-green" onclick="mdK()">k</button><button class="btn btn-color-green" onclick="mdKs()">ks</button><button class="btn btn-color-green" onclick="mdB()">b</button><button class="btn btn-color-green" onclick="mdtableCopy()">table</button><button class="btn btn-color-green" onclick="mdU2T()">u2t</button><button class="btn btn-color-green" onclick="frontMatter()">FM</button></span><br><span>Markdown代码块:</span><select id="Option" name="Option"><option value=''>不设置语言</option><option value="java" selected>java</option><option value="javascript">javascript</option><option value="html">html</option><option value="sql">sql</option><option value="css">css</option></select><br><span><button class="btn btn-color-green" onclick="mdCbOption()">cb</button><button class="btn btn-color-green" onclick="mdCb('java')">cb&nbsp;java</button><button class="btn btn-color-green" onclick="mdCb('javascript')">cb&nbsp;js</button><button class="btn btn-color-green" onclick="mdCb('html')">cb&nbsp;html</button><button class="btn btn-color-green" onclick="mdCb('css')">cb&nbsp;css</button><button class="btn btn-color-green" onclick="mdCb('sql')">cb&nbsp;sql</button></span><br><span>格式化:</span><br><span><button class="btn btn-color-blueviolet" onclick="niuke()">niuke</button><button class="btn btn-color-blueviolet" onclick="formatJava()">formatJava</button><button class="btn btn-color-blueviolet" onclick="cHeader()">cHeader</button></span><br><span>字符串转换:</span><br><span><button class="btn btn-color-brown" onclick="upperCase()">大写</button><button class="btn btn-color-brown" onclick="lowerCase()">小写</button></span><span><button class="btn btn-color-brown" onclick="tab()">tab</button><button class="btn btn-color-brown" onclick="unTab()">unTab</button><button class="btn btn-color-brown" onclick="tabTo4Spaces()">tabTo4Spaces</button></span><span><button class="btn btn-color-brown" onclick="deleteSingleLineComment()">删除单行注释</button><button class="btn btn-color-brown" onclick="deleteMultilineComments()">删除多行注释</button><button class="btn btn-color-brown" onclick="deleteBlankLine()">删除空行</button><button class="btn btn-color-brown" onclick="deleteSpaceStart()">删除行头空白</button><button class="btn btn-color-brown" onclick="toOneLine()">toOneLine</button></span><span><button class="btn btn-color-brown" onclick="toEnPunctuation()">使用英文标点符号</button><button class="btn btn-color-brown" onclick="toTools()">toTools</button><button class="btn btn-color-brown" onclick="miniJava()">miniJava</button></span><br><span>其他工具</span><br><a href='/blog/html/6a91baf/'>Git 推送流程</a></span></div>
<style type="text/css">
    .btn {
        background-color: #008CBA;
        border: none;
        color: white;
        padding: 0em 0.2em 0em 0.2em;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        margin: 0.1em 0.1em 0.1em 0.1em;
        cursor: pointer;
        min-width: 2em;
    }
    .tools {
        /* 变成块级元素 */
        display: block;
        margin: 0.5em;
    }
    .block {
        display: block;
    }
    .btn-color-red {
        background-color: #f44336;
    }
    .btn-color-green {
        background-color: #4CAF50;
    }
    .btn-color-pink {
        background-color: #FF00FF;
    }
    .btn-color-blue {
        background-color: #008CBA;
    }
    .btn-color-blueviolet {
        background-color: BlueViolet;
    }
    .btn-color-brown {
        background-color: brown;
    }
    .btn-color-crimson {
        background-color: crimson;
    }
    .btn-color-black {
        background-color: black;
    }
    .btn-color-gray {
        background-color: #555555;
    }
    /* 文本框样式 */
    textarea {
        width: 100%;
        margin-right: auto;
    }
    /* 覆盖样式 */
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
    function tags() {
        input.value = "\ntags: 有空了解一下";
        copy();
    }
    function linksTOC(text) {
        if (text == null) {
            result(linksTOC(input.value));
        } else {
            var head = "<div id='my_toc'>\n\n";
            var tail =
                "\n</div>\n<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}" +
                "<__script>\n".replace("__", "/");
            var regex = /^(#+) (.+?)(?: #*)?$/mg;
            var matchs = text.match(regex);
            var resultStr = "";
            var item = '';
            var tabs = '';
            var title = '';
            var MdLinkRegex = /\[(.+?)\]\(.+?\)/;
            for (var i = 0; i < matchs.length; i++) {
                tabs = generateIndentation(matchs[i].replace(regex, "$1").length - 1);
                title = matchs[i].replace(regex, "$2");
                if (title.match(MdLinkRegex)) {
                    title = title.replace(MdLinkRegex, '$1');
                }
                item = tabs + "- [" + title + "](/blog/links/#" + title + ")" + "\n"
                console.log(item);
                resultStr += item;
            }
            return head + resultStr + tail;
        }
    }
    function generateIndentation(count) {
        var indentation = '';
        for (var i = 0; i < count; i++) {
            indentation += "    ";
        }
        return indentation;
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
            text = text.replace(/^[ ]*\/\/.*\n/mg, "");
            return text;
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
    function tabTo4Spaces(text) {
        if (typeof (text) == "undefined") {
            result(tabTo4Spaces(input.value));
        } else {
            return text.replace(/\t/mg, "    ");
        }
    }
    function deleteMultilineComments(text) {
        if (typeof (text) == "undefined") {
            result(deleteMultilineComments(input.value));
        } else {
            return text.replace(/\/\*{1,2}\n(?:[ ]*\*.*?\n)+/mg, "");
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
        var header="---\ntitle: 在线工具\ndate: 2019-10-17 12:08:16\ncomments: false\n---\n"
        var text = input.value;
        text = deleteSingleLineComment(text);
        text = deleteBlankLine(text)
        text = text.replace(/(?:.*\n)+<body>\n/m, "");
        text = text.replace(/<\/body>\n(?:.*\n?)*/m, "");
        text = miniDiv(text);
        text = unTab(text);
        text=header+text;
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
    function mdK() {
        result("`" + input.value + "`");
    }
    function mdKs(text) {
        if (typeof (text) == "undefined") {
            result(mdKs(input.value));
        } else {
            text = text.replace(/`?((?:-(?! ))?[a-zA-Z<][a-zA-Z0-9 ():\_.\/\[\]<>,+="?-]*[a-zA-Z0-9);>/.\*\]])`?/mg,
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
        text = mdKs(text);
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
        selects = mdKs(selects);
        selects = selects.replace(/([A-Z])\n(.+)/mg, "- $1 $2");
        problem += text.substring(0, selectStart);
        problem = deleteBlankLine(problem) + "\n";
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
    function formatJavaCode(text) {
        if (typeof (text) == "undefined") {
            console.log("请输入参数");
        } else {
            var lineTemp = '';
            var value = '';
            for (var i = 0; i < text.length; i++) {
                value = text[i];
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
    function formatJava(text) {
        if (typeof (text) == "undefined") {
            result(formatJava(input.value));
        }
        else {
            text = toEnPunctuation(text);
            text = convertSingleLineComments(text);
            text = toOneLine(text);
            text = formatJavaCode(text);
            text = restoreSingleLineComment(text);
            text = deleteBlankLine(text);
            text = restoreFor(text);
            return text;
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
    function miniJava() {
        var text = input.value;
        text = deleteMultilineComments(text);
        text = deleteSingleLineComment(text);
        text = formatJava(text);
        text = deleteSingleLineComment(text);
        text = deleteBlankLine(text);
        result(text);
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
