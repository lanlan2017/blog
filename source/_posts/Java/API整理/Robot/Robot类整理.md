---
title: Robot类整理
categories: 
  - Java
  - API整理
  - Robot
date: 2019-10-19 20:23:38
updated: 2019-11-25 00:23:43
abbrlink: 321f0e4e
---
<div id='my_toc'>

- [API](/blog/321f0e4e/#API)
- [MouseEvent](/blog/321f0e4e/#MouseEvent)

</div>
<!--more-->
<script>if (navigator.platform.search('arm')==-1){document.getElementById('my_toc').style.display = 'none';}</script>

<!--end-->
## API ##
|方法|描述|
|:--|:--|
|BufferedImage createScreenCapture(Rectangle screenRect)|Creates an image containing pixels read from the screen.|
|void delay(int ms)|Sleeps for the specified time.|
|int getAutoDelay()|Returns the number of milliseconds this Robot sleeps after generating an event.|
|Color getPixelColor(int x, int y)|Returns the color of a pixel at the given screen coordinates.|
|boolean isAutoWaitForIdle()|Returns whether this Robot automatically invokes waitForIdle after generating an event.|
|void keyPress(int keycode)|Presses a given key.|
|void keyRelease(int keycode)|Releases a given key.|
|void mouseMove(int x, int y)|Moves mouse pointer to given screen coordinates.|
|void mousePress(int buttons)|Presses one or more mouse buttons.|
|void mouseRelease(int buttons)|Releases one or more mouse buttons.|
|void mouseWheel(int wheelAmt)|Rotates the scroll wheel on wheel-equipped mice.|
|void setAutoDelay(int ms)|Sets the number of milliseconds this Robot sleeps after generating an event.|
|void setAutoWaitForIdle(boolean isOn)|Sets whether this Robot automatically invokes waitForIdle after generating an event.|
|String toString()|Returns a string representation of this Robot.|
|void waitForIdle()|Waits until all events currently on the event queue have been processed.|




# MouseEvent #

>原文链接: [Robot类整理](https://lanlan2017.github.io/blog/321f0e4e/)
