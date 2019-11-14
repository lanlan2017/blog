---
title: Java调用百度文字识别
categories: 
  - 我的软件
  - 百度文字识别
date: 2018-09-11 19:39:14
updated: 2019-11-05 10:32:11
abbrlink: 29121dfd
---
- [优化](/blog/29121dfd/#优化)
    - [加入GUI](/blog/29121dfd/#加入GUI)
    - [加入全局热键](/blog/29121dfd/#加入全局热键)
        - [ScreenShotOCR程序入口类](/blog/29121dfd/#ScreenShotOCR程序入口类)
        - [菜单窗口](/blog/29121dfd/#菜单窗口)
        - [ScreenShotWindow截图窗口](/blog/29121dfd/#ScreenShotWindow截图窗口)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
# 优化 #
## 加入GUI ##
加入编写GUI,加入Java截图功能，截图后自动保存，然后调用百度识图API,并将从处理结果中的JSON字符串中，取出识别的数据。


## 加入全局热键 ##
上面已经完成了大致的功能，但是缺点是每次都要调用一次。
我不想每次都调用一次程序，而是打开一次程序，后面可以多次截图处理。工作结束后再关掉程序。

代码：
### ScreenShotOCR程序入口类 ###
```java
package release.ocr.baidu;

import java.awt.AWTException;
import java.awt.EventQueue;

public class ScreenShotOCR
{
	static ScreenShotWindow ssw;
	public static void main(String[] args)
	{

		EventQueue.invokeLater(new Runnable()
		{
			@Override
			public void run()
			{
				try
				{
					ssw = new ScreenShotWindow();
					ssw.setVisible(true);
				} catch (AWTException e)
				{
					e.printStackTrace();
				}
			}
		});
	}
	// 回调函数，使得当前窗口不可见。
	public static void notVisible()
	{
		ssw.setVisible(false);
	}
	public static void visiable()
	{
		ssw.setVisible(true);
	}

}

```
### 菜单窗口 ###
这里不用再次添加按钮，所以这个类不用改变。
```java
package release.ocr.baidu;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import javax.swing.JButton;
import javax.swing.JToolBar;
import javax.swing.JWindow;


/*
 * 操作窗口
 */
public class ToolsWindow extends JWindow
{
	private ScreenShotWindow parent;

	public ToolsWindow(ScreenShotWindow parent, int x, int y)
	{
		this.parent = parent;
		this.init();
		this.setLocation(x, y);
		this.pack();
		this.setVisible(true);
	}

	private void init()
	{

		this.setLayout(new BorderLayout());
		JToolBar toolBar = new JToolBar("Java 截图");

		// 保存按钮
		JButton saveButton = new JButton("保存");
		saveButton.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try
				{
					// 保存截图
					parent.saveImage();
				} catch (IOException e1)
				{
					e1.printStackTrace();
				}
			}
		});
		toolBar.add(saveButton);

		// 百度识图按钮
		JButton baiduOCRButton = new JButton("文字识别");
		baiduOCRButton.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent e)
			{
				try
				{
					// 保存截图
					parent.baiduOCR();
				} catch (IOException e1)
				{
					e1.printStackTrace();
				}
			}
		});
		toolBar.add(baiduOCRButton);

		// 关闭按钮
		JButton closeButton = new JButton("退出");
		closeButton.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent e)
			{
				System.exit(0);
			}
		});
		toolBar.add(closeButton);

		this.add(toolBar, BorderLayout.NORTH);
	}

}

```
### ScreenShotWindow截图窗口 ###
ScreenShotWindow中加入热键相关的代码：
- 添加字段：
```java
// 热键相关设置
private static final long serialVersionUID = 1L;
// 定义热键标识，用于在设置多个热键时，在事件处理中区分用户按下的热键
public static final int FUNC_KEY_MARK = 1;
public static final int EXIT_KEY_MARK = 0;
```
- ScreenShotWindow构造函数中加入热键事件监听处理函数。
```java
// 第2步：注册热键，第一个参数表示该热键的标识，第二个参数表示组合键，如果没有则为0，第三个参数为定义的主要热键
JIntellitype.getInstance().registerHotKey(FUNC_KEY_MARK,JIntellitype.MOD_ALT, (int) 'V');
JIntellitype.getInstance().registerHotKey(EXIT_KEY_MARK,JIntellitype.MOD_ALT, (int) 'Q');

// 第3步：添加热键监听器
JIntellitype.getInstance().addHotKeyListener(new HotkeyListener()
{

	@Override
	public void onHotKey(int markCode)
	{
		switch (markCode)
		{
			//按下alt+v快捷键表示宝表示打开截图窗口，这样可以开始截图
			case FUNC_KEY_MARK :
				// showMessage();
				ScreenShotOCR.visiable();
				break;
			// alt+q快捷键表示退出程序
			case EXIT_KEY_MARK :
				System.exit(0);
				break;
		}
	}
});
```

```java
package release.ocr.baidu;

import java.awt.AWTException;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;
import java.awt.image.BufferedImage;
import java.awt.image.RescaleOp;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.imageio.ImageIO;
import javax.swing.JFileChooser;
import javax.swing.JWindow;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.filechooser.FileSystemView;
import com.melloware.jintellitype.HotkeyListener;
import com.melloware.jintellitype.JIntellitype;

/*
* 截图矩形窗口
*/
public class ScreenShotWindow extends JWindow
{
	private int orgx, orgy, endx, endy;
	private BufferedImage image = null;
	private BufferedImage tempImage = null;
	private BufferedImage saveImage = null;
	private ToolsWindow tools = null;

	// 热键相关设置
	private static final long serialVersionUID = 1L;
	// 定义热键标识，用于在设置多个热键时，在事件处理中区分用户按下的热键
	public static final int FUNC_KEY_MARK = 1;
	public static final int EXIT_KEY_MARK = 0;

	// 构造函数
	public ScreenShotWindow() throws AWTException
	{
		// 获取屏幕尺寸
		Dimension d = Toolkit.getDefaultToolkit().getScreenSize();
		// 设置窗口显示大小
		this.setBounds(0, 0, d.width, d.height);

		// 截取整个屏幕
		Robot robot = new Robot();
		image = robot
				.createScreenCapture(new Rectangle(0, 0, d.width, d.height));

		// 设置鼠标监听事件
		this.addMouseListener(new MouseAdapter()
		{
			// 鼠标按下
			@Override
			public void mousePressed(MouseEvent e)
			{
				// 鼠标松开时记录结束点坐标，并隐藏操作窗口
				orgx = e.getX();
				orgy = e.getY();

				if (tools != null)
				{
					tools.setVisible(false);
				}
			}
			@Override
			public void mouseReleased(MouseEvent e)
			{
				// 鼠标松开时，显示操作窗口
				if (tools == null)
				{
					tools = new ToolsWindow(ScreenShotWindow.this, e.getX(),
							e.getY());
				} else
				{
					tools.setLocation(e.getX(), e.getY());
				}
				tools.setVisible(true);
				tools.toFront();
			}
		});
		// 鼠标移动和拖动监听事件处理函数
		this.addMouseMotionListener(new MouseMotionAdapter()
		{

			@Override
			public void mouseDragged(MouseEvent e)
			{
				// 鼠标拖动时，记录坐标并重绘窗口
				endx = e.getX();
				endy = e.getY();

				// 临时图像，用于缓冲屏幕区域放置屏幕闪烁
				Image tempImage2 = createImage(ScreenShotWindow.this.getWidth(),
						ScreenShotWindow.this.getHeight());
				Graphics g = tempImage2.getGraphics();
				g.drawImage(tempImage, 0, 0, null);
				int x = Math.min(orgx, endx);
				int y = Math.min(orgy, endy);
				int width = Math.abs(endx - orgx) + 1;
				int height = Math.abs(endy - orgy) + 1;
				// 加上1防止width或height0
				g.setColor(Color.BLUE);
				g.drawRect(x - 1, y - 1, width + 1, height + 1);
				// 减1加1都了防止图片矩形框覆盖掉
				saveImage = image.getSubimage(x, y, width, height);
				g.drawImage(saveImage, x, y, null);

				ScreenShotWindow.this.getGraphics().drawImage(tempImage2, 0, 0,
						ScreenShotWindow.this);
			}
		});

		// 第2步：注册热键，第一个参数表示该热键的标识，第二个参数表示组合键，如果没有则为0，第三个参数为定义的主要热键
		 JIntellitype.getInstance().registerHotKey(FUNC_KEY_MARK,
		 JIntellitype.MOD_ALT, (int) 'V');
		JIntellitype.getInstance().registerHotKey(EXIT_KEY_MARK,
				JIntellitype.MOD_ALT, (int) 'Q');

		// 第3步：添加热键监听器
		JIntellitype.getInstance().addHotKeyListener(new HotkeyListener()
		{

			@Override
			public void onHotKey(int markCode)
			{
				switch (markCode)
				{
					//按下alt+v快捷键表示
					case FUNC_KEY_MARK :
						// showMessage();
						ScreenShotOCR.visiable();
						break;
					// alt+q快捷键表示退出程序
					case EXIT_KEY_MARK :
						System.exit(0);
						break;
				}
			}
		});

	}

	@Override
	public void paint(Graphics g)
	{
		RescaleOp ro = new RescaleOp(0.8f, 0, null);
		tempImage = ro.filter(image, null);
		g.drawImage(tempImage, 0, 0, this);
	}
	// 保存图像到文件
	public void saveImage() throws IOException
	{
		JFileChooser jfc = new JFileChooser();
		jfc.setDialogTitle("保存");

		// 文件过滤器，用户过滤可选择文件
		FileNameExtensionFilter filter = new FileNameExtensionFilter("PNG",
				"png");
		jfc.setFileFilter(filter);

		// 初始化一个默认文件（此文件会生成到桌面上）
		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmddHHmmss");
		String fileName = sdf.format(new Date());
		File filePath = FileSystemView.getFileSystemView().getHomeDirectory();
		File defaultFile = new File(
				filePath + File.separator + fileName + ".png");
		jfc.setSelectedFile(defaultFile);

		int flag = jfc.showSaveDialog(this);
		if (flag == JFileChooser.APPROVE_OPTION)
		{
			File file = jfc.getSelectedFile();
			String path = file.getPath();
			// 检查文件后缀，放置用户忘记输入后缀或者输入不正确的后缀
			if (!(path.endsWith(".png") || path.endsWith(".PNG")))
			{
				path += ".png";
			}
			// 写入文件
			ImageIO.write(saveImage, "png", new File(path));
			System.exit(0);
		}
	}
	// 调用百度识图
	public void baiduOCR() throws IOException
	{

		// 写入文件
		ImageIO.write(saveImage, "png", new File("1.png"));
		Thread baiduOCR = new Thread(new BaiduOCR("1.png", this));
		baiduOCR.start();
	}
	public static void Exit()
	{
		System.exit(0);
	}
}

```


新的问题，程序不能很好的退出，而且让截图窗口显示的方式并不会重新截图，这样我已经阅读到一页文章了，但是窗口中保存的还是前页的截图，所以，应该重新初始化话截图才对。也就是说是使用线程来做才对。

>原文链接: [Java调用百度文字识别](https://lanlan2017.github.io/blog/29121dfd/)
