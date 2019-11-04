---
title: Java截图
categories: 
  - Java
  - java_GUI
date: 2018-09-13 10:31:53
updated: 2019-10-30 11:55:40
abbrlink: 14ec9002
---
- [完整的代码](/blog/html/14ec9002/#完整的代码)
    - [ScreenShotOCR类](/blog/html/14ec9002/#ScreenShotOCR类)
    - [BaiduOCR类](/blog/html/14ec9002/#BaiduOCR类)

<!--more-->
<script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.slim.min.js"></script>
<script>$(document).ready(function () {$(".post-body > ul:nth-child(1)").hide();});</script>

<!--end-->
源码：[https://www.cnblogs.com/feitianshaoxai/p/6560110.html](https://www.cnblogs.com/feitianshaoxai/p/6560110.html)

上面代码实现了截图的操作，我要在上面的代码中加入自动保存然后调用百度识图的操作。具体可以模仿上面的保存函数

加入的百度文字识图按钮：
```java
// 百度识图按钮
JButton baiduOCRButton = new JButton("百度文字识别");
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
```
实现算法：
```java
// 调用百度识图
public void baiduOCR() throws IOException
{
	// 写入文件
	ImageIO.write(saveImage, "png", new File("1.png"));
	Thread baiduOCR=new Thread(new BaiduOCR("1.png",this));
	baiduOCR.start();
}
```
说明：直接把截图保存在工程路径下的“1.png”文件中。然后启动一个`baiduOCR`线程来处理这个图片：
```java
package release.ocr.baidu;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONObject;
import com.baidu.aip.ocr.AipOcr;
import clipboard.util.SysClipboardUtil;
import net.sf.json.JSONArray;

public class BaiduOCR implements Runnable
{
	// 设置APPID/AK/SK
	public static final String APP_ID = "你的百度APP_ID";
	public static final String API_KEY = "你的百度API_KEY";
	public static final String SECRET_KEY = "你的百度SECRET_KEY";
	//窗体引用,用于使得窗体不可见
	ScreenShotWindow screenShotWindow;
	//文件路径,我们识别的就是这个图片
	String path;
       //通过构造函数传入参数
	public BaiduOCR(String path,ScreenShotWindow screenShotWindow)
	{
		this.path=path;
		this.screenShotWindow=screenShotWindow;
	}
	@Override
	public void run()
	{
		//让窗体不可见，以便用户可以进行其他操作
		ScreenShotOCR.notVisiabl();
		//调用百度文字识别接口
		baiduOCR(path);
		//回调函数，执行完毕后关闭程序
		ScreenShotWindow.Exit();

	}
	/**   
	 * 调用百度文字识别
	 */  
	public static void baiduOCR(String path)
	{
		// 初始化一个AipOcr
		AipOcr client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);
		// 可选：设置网络连接参数
		client.setConnectionTimeoutInMillis(2000);
		client.setSocketTimeoutInMillis(60000);
		// 调用接口取得识别的结果：JSON数据
		JSONObject res = client.basicGeneral(path,
				new HashMap<String, String>());
		String text = res.toString(2);
            //从JSON数据中取出翻译的结果
            //转为HashMap
		HashMap<String, Object> resMap = (HashMap<String, Object>) res.toMap();
		// 迭代器
		Iterator<Map.Entry<String, Object>> it = resMap.entrySet().iterator();
		// 缓冲，用来存储识别结果
		StringBuilder sbBuilder = new StringBuilder();
		Map.Entry<String, Object> entry;
            //遍历Map集合
		while (it.hasNext())
		{
			entry = it.next();
                    //找到翻译结果组
			if (entry.getKey().equals("words_result"))
			{
				// 获取词组
				JSONArray jsonArray = JSONArray.fromObject(entry.getValue());
				System.out.println(jsonArray.toString());
				for (Object object : jsonArray)
				{
					sbBuilder.append(object.toString());
				}
			}
		}
            //获取识别结果
		String words = sbBuilder.toString();
            //使用正则表达式删除无用信息，只留下翻译的结果
		words = words.replaceAll("(?:(?:\\\"\\})?\\{\\\"words\\\":\\\"|\\\"\\})", "");
		SysClipboardUtil.setSysClipboardText(words);
	}
}

```

## 完整的代码 ##
### ScreenShotOCR类 ###
ScreenShotOCR类实现截图的功能，窗体的显示。
```java
package release.ocr.baidu;

import java.awt.AWTException;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
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
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JToolBar;
import javax.swing.JWindow;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.filechooser.FileSystemView;

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
	public static void notVisiabl()
	{
		ssw.setVisible(false);
	}

}
/*
 * 截图矩形窗口
 */
class ScreenShotWindow extends JWindow
{
	private int orgx, orgy, endx, endy;
	private BufferedImage image = null;
	private BufferedImage tempImage = null;
	private BufferedImage saveImage = null;

	private ToolsWindow tools = null;

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

/*
 * 操作窗口
 */
class ToolsWindow extends JWindow
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
		JButton baiduOCRButton = new JButton("百度文字识别");
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
### BaiduOCR类 ###

```java
package release.ocr.baidu;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONObject;
import com.baidu.aip.ocr.AipOcr;
import clipboard.util.SysClipboardUtil;
import net.sf.json.JSONArray;

public class BaiduOCR implements Runnable
{
	// 设置APPID/AK/SK
	public static final String APP_ID = "你的BaiduAPP_ID";
	public static final String API_KEY = "你的";
	public static final String SECRET_KEY = "你的";
	//窗体引用
	ScreenShotWindow screenShotWindow;
	//文件路径
	String path;
	public BaiduOCR(String path,ScreenShotWindow screenShotWindow)
	{
		this.path=path;
		this.screenShotWindow=screenShotWindow;
	}
	@Override
	public void run()
	{
		//让窗体不可见
		ScreenShotOCR.notVisiabl();
		//调用百度文字识别接口
		baiduOCR(path);
		//回调函数，执行完毕后关闭程序
		ScreenShotWindow.Exit();

	}
	/**   
	 * 调用百度文字识别
	 */  
	public static void baiduOCR(String path)
	{
		// 初始化一个AipOcr
		AipOcr client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);
		// 可选：设置网络连接参数
		client.setConnectionTimeoutInMillis(2000);
		client.setSocketTimeoutInMillis(60000);
		// 调用接口
		JSONObject res = client.basicGeneral(path,
				new HashMap<String, String>());
		String text = res.toString(2);
		HashMap<String, Object> resMap = (HashMap<String, Object>) res.toMap();
		// 第二种：
		Iterator<Map.Entry<String, Object>> it = resMap.entrySet().iterator();
		// 缓冲，用来存储识别结果
		StringBuilder sbBuilder = new StringBuilder();
		Map.Entry<String, Object> entry;
		while (it.hasNext())
		{
			entry = it.next();
			if (entry.getKey().equals("words_result"))
			{
				// 获取词组
				JSONArray jsonArray = JSONArray.fromObject(entry.getValue());
				System.out.println(jsonArray.toString());
				for (Object object : jsonArray)
				{
					sbBuilder.append(object.toString());
				}
			}
		}
		String words = sbBuilder.toString();
		words = words.replaceAll("(?:(?:\\\"\\})?\\{\\\"words\\\":\\\"|\\\"\\})", "");
		SysClipboardUtil.setSysClipboardText(words);
	}
}

```

>原文链接: [Java截图](https://lanlan2017.github.io/blog/14ec9002/)