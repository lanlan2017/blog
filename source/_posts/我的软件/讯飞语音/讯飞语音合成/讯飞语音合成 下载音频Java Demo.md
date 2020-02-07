---
title: 讯飞语音合成 下载音频Java Demo
categories: 
  - 我的软件
  - 讯飞语音
  - 讯飞语音合成
date: 2019-03-07 15:03:05
updated: 2019-12-17 05:18:53
abbrlink: e47ffad6
---
<div id='my_toc'><a href="/blog/e47ffad6/#注册讯飞账号" class="header_2">注册讯飞账号</a>&nbsp;<br><a href="/blog/e47ffad6/#实名认证" class="header_2">实名认证</a>&nbsp;<br><a href="/blog/e47ffad6/#创建应用" class="header_2">创建应用</a>&nbsp;<br><a href="/blog/e47ffad6/#添加语音合成服务" class="header_2">添加语音合成服务</a>&nbsp;<br><a href="/blog/e47ffad6/#下载SDK" class="header_2">下载SDK</a>&nbsp;<br><a href="/blog/e47ffad6/#解压下载到的SDK压缩包" class="header_2">解压下载到的SDK压缩包</a>&nbsp;<br><a href="/blog/e47ffad6/#应用到Java项目" class="header_2">应用到Java项目</a>&nbsp;<br><a href="/blog/e47ffad6/#创建测试类" class="header_2">创建测试类</a>&nbsp;<br><a href="/blog/e47ffad6/#1-设置合成监听器" class="header_3">1 设置合成监听器</a>&nbsp;<br><a href="/blog/e47ffad6/#编写main方法" class="header_3">编写main方法</a>&nbsp;<br><a href="/blog/e47ffad6/#完整下载Java-demo如下" class="header_2">完整下载Java demo如下</a>&nbsp;<br><a href="/blog/e47ffad6/#用audition-cs6-打开" class="header_2">用audition cs6 打开</a>&nbsp;<br></div>
<style>.header_1{margin-left: 1em;}.header_2{margin-left: 2em;}.header_3{margin-left: 3em;}.header_4{margin-left: 4em;}.header_5{margin-left: 5em;}.header_6{margin-left: 6em;}</style>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}var e,p = document.getElementsByTagName('p');while (p.length>0) {e = p[0];e.parentElement.removeChild(e);}</script>

<!--end-->
## 注册讯飞账号 ##
略
## 实名认证 ##
略
## 创建应用 ##
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/myapp/TTS/XunFei/YuYinHeCheng/1.png)
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/myapp/TTS/XunFei/YuYinHeCheng/2.png)
## 添加语音合成服务 ##
进入控制台,点击`我的应用`,然后添加语音合成服务(免费),并记下APPID
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/myapp/TTS/XunFei/YuYinHeCheng/3.png)
## 下载SDK ##
点击应用右侧的SDK下载 
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/myapp/TTS/XunFei/YuYinHeCheng/4.png)
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/myapp/TTS/XunFei/YuYinHeCheng/5.png)
你将会下载到一个压缩包:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/myapp/TTS/XunFei/YuYinHeCheng/6.png)
## 解压下载到的SDK压缩包 ##
## 应用到Java项目 ##
创建一个Java项目,然后把压缩包中的lib目录下的的所有东西全部复制粘贴到这个Java项目中：
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/myapp/TTS/XunFei/YuYinHeCheng/8.png)
然后把jar包添加到`build path`中:
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/myapp/TTS/XunFei/YuYinHeCheng/9.png)
到这里项目就搭建好了,下面来创建测试类。
## 创建测试类 ##
### 1 设置合成监听器 ###
在测试类中粘贴如下代码:
```java
// 1 设置合成监听器
static SynthesizeToUriListener synthesizeToUriListener = new SynthesizeToUriListener()
{
    // progress为合成进度0~100
    public void onBufferProgress(int progress)
    {
    }
    // 会话合成完成回调接口
    // uri为合成保存地址，error为错误信息，为null时表示合成会话成功
    public void onSynthesizeCompleted(String uri, SpeechError error)
    {
    }
    @Override
    public void onEvent(int arg0, int arg1, int arg2, int arg3, Object arg4,
            Object arg5)
    {
        // TODO Auto-generated method stub
    }
};
```
设置好监听器之后，下面就可来合成并下载音频了。
### 编写main方法 ###
```java
public static void main(String[] args)
{
    // 2 将“XXXXXXXX”替换成您申请的APPID
    SpeechUtility.createUtility(SpeechConstant.APPID + "=XXXXXXXX");
    // 3.创建SpeechSynthesizer对象
    SpeechSynthesizer mTts = SpeechSynthesizer.createSynthesizer();
    // 4.合成参数设置，详见《MSC Reference Manual》SpeechSynthesizer 类
    // 设置发音人
    mTts.setParameter(SpeechConstant.VOICE_NAME, "xiaoyu");
    // 设置语速，范围0~100
    mTts.setParameter(SpeechConstant.SPEED, "50");
    // 设置语调，范围0~100
    mTts.setParameter(SpeechConstant.PITCH, "50");
    // 设置音量，范围0~100
    mTts.setParameter(SpeechConstant.VOLUME, "50");
    // 5设置要合成的文本
    String text="测试语音合成";
    // 6.开始合成 //设置合成音频保存位置（可自定义保存位置），默认保存在“./tts_test.pcm”
    mTts.synthesizeToUri(text, "./tts_test.pcm",
            synthesizeToUriListener);
}
```
## 完整下载Java demo如下 ##
```java
package demo;
import com.iflytek.cloud.speech.SpeechConstant;
import com.iflytek.cloud.speech.SpeechError;
import com.iflytek.cloud.speech.SpeechSynthesizer;
import com.iflytek.cloud.speech.SpeechUtility;
import com.iflytek.cloud.speech.SynthesizeToUriListener;
public class DownloadDemo
{
    public static void main(String[] args)
    {
        // 2 将“XXXXXXXX”替换成您申请的APPID
        SpeechUtility.createUtility(SpeechConstant.APPID + "=5c80ae6b");
        // 3.创建SpeechSynthesizer对象
        SpeechSynthesizer mTts = SpeechSynthesizer.createSynthesizer();
        // 4.合成参数设置，详见《MSC Reference Manual》SpeechSynthesizer 类
        // 设置发音人
        mTts.setParameter(SpeechConstant.VOICE_NAME, "xiaoyu");
        // 设置语速，范围0~100
        mTts.setParameter(SpeechConstant.SPEED, "50");
        // 设置语调，范围0~100
        mTts.setParameter(SpeechConstant.PITCH, "50");
        // 设置音量，范围0~100
        mTts.setParameter(SpeechConstant.VOLUME, "50");
        // 5设置要合成的文本
        String text = "测试语音合成";
        // 6.开始合成 //设置合成音频保存位置（可自定义保存位置），默认保存在“./tts_test.pcm”
        mTts.synthesizeToUri(text, "./tts_test.pcm", synthesizeToUriListener);
    }
    // 1 设置合成监听器
    static SynthesizeToUriListener synthesizeToUriListener = new SynthesizeToUriListener()
    {
        // progress为合成进度0~100
        public void onBufferProgress(int progress)
        {
        }
        // 会话合成完成回调接口
        // uri为合成保存地址，error为错误信息，为null时表示合成会话成功
        public void onSynthesizeCompleted(String uri, SpeechError error)
        {
        }
        @Override
        public void onEvent(int arg0, int arg1, int arg2, int arg3, Object arg4,
                Object arg5)
        {
            // TODO Auto-generated method stub
        }
    };
}

```
运行上面程序即可合成`测试语音合成`这个音频信息,保存在`./tts_test.pcm`中,不过这个文件好像不可直接打开播放,我用audition打开
## 用audition cs6 打开 ##
采样率选择`16000`,其他默认,然后就可以播放了,如果播放的声音跟`猪叫`差不多的话，那应该是采样率错了，反正采样率多测试几次下就好了
![这里有一张图片](https://image-1257720033.cos.ap-shanghai.myqcloud.com/blog/myapp/TTS/XunFei/YuYinHeCheng/11.png)
语音合成的地方肯定有些合成的不如意的地方,可以在audition中再次编辑,然后保存为mp3等等即可，这样以后就可直接播放了。
