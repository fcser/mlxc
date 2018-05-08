package cn.javaweb.other;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;

import java.io.File;
import java.util.Random;

public class ImageUtils {
	 public static BufferedImage watermark(BufferedImage buffImg, BufferedImage waterImg, int x, int y, float alpha) throws IOException {         // 获取底图
        // BufferedImage buffImg = ImageIO.read(file);         // 获取层图
       // BufferedImage waterImg = ImageIO.read(waterFile);
         // 创建Graphics2D对象，用在底图对象上绘图
         Graphics2D g2d = buffImg.createGraphics();
         int a = waterImg.getWidth();// 获取层图的宽度
         int b = waterImg.getHeight();// 获取层图的高度
         
        	int waterImgWidth = 300;// 获取层图的宽度
            int waterImgHeight = 300*a/b;
         
         //int waterImgWidth = 300;// 获取层图的宽度
        // int waterImgHeight = 225;// 获取层图的高度
        // int buffImgWidth = buffImg.getWidth();// 获取层图的宽度
         //int buffImgHeight = buffImg.getHeight();// 获取层图的高度
         //System.out.println(buffImgWidth+","+buffImgHeight);
         // 在图形和图像中实现混合和透明效果
         g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));
         // 绘制
         //g2d.drawImage(buffImg, x, y, buffImgWidth, buffImgHeight, null);
         g2d.drawImage(waterImg, x, y, waterImgWidth, waterImgHeight, null);
         g2d.dispose();// 释放图形上下文使用的系统资源
         return buffImg;
     }
	 
	 public static String getRandom(int length)
	 {
		 String base="abcdefghijklmnopqrstuvwxyz0123456789";
		 Random random=new Random();
		 StringBuffer sb=new StringBuffer();
		 for(int i=0;i<length;i++)
		 {
			 int number=random.nextInt(base.length());
			 sb.append(base.charAt(number));
		 }
		 return sb.toString();
	 }
 
     /**
44      * 输出水印图片
45      * 
46      * @param buffImg
47      *            图像加水印之后的BufferedImage对象
48      * @param savePath
49      *            图像加水印之后的保存路径
50      */
      public void generateWaterFile(BufferedImage buffImg, String savePath) {
         int temp = savePath.lastIndexOf(".") + 1;
         try {
            ImageIO.write(buffImg, savePath.substring(temp), new File(savePath));
         } catch (IOException e1) {
             e1.printStackTrace();
         }
     }
     /**
61      * 
62      * @param args
63      * @throws IOException
64      *             IO异常直接抛出了
65      * @author bls
66      */
     /*public static void main(String[] args) throws IOException {
         String sourceFilePath = "D://img//cen.png";
         String waterFilePath = "D://img//di.png";
         String saveFilePath = "D://img//naw5.png";
         ImageUtils newImageUtils = new ImageUtils();
         // 构建叠加层
         BufferedImage buffImg = ImageUtils.watermark(new File(sourceFilePath), new File(waterFilePath), 100, 100, 1.0f);
         // 输出水印图片
         newImageUtils.generateWaterFile(buffImg, saveFilePath);
     }*/
    /* public void doimg(String b,String c)
     {
    	 String  a= "D://img//cen.png";
    	 ImageUtils newImageUtils = new ImageUtils();
         // 构建叠加层
         BufferedImage buffImg = null;
		try {
			buffImg = ImageUtils.watermark(new File(a), new File(b), 100, 100, 1.0f);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         // 输出水印图片
         newImageUtils.generateWaterFile(buffImg, c);
     }*/
   /*  public BufferedImage doimg(String b)
     {
    	 String  a= "D://img//cen.png";
    	// ImageUtils newImageUtils = new ImageUtils();
         // 构建叠加层
         BufferedImage buffImg = null;
		try {
			buffImg = ImageUtils.watermark(new File(a), new File(b), 100, 100, 1.0f);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return buffImg;
         // 输出水印图片
        // newImageUtils.generateWaterFile(buffImg, c);
     }*/
}
