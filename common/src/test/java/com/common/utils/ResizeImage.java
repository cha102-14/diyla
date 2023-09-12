package com.common.utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class ResizeImage {
    public static void main(String[] args) throws IOException {
        for (int i = 1; i <= 16; i++) {

            resizeFile("C:\\Image\\1 (" + i + ").jpg",
                    "C:\\Image\\1 (" + i + ").jpg");
            System.out.println("調整大小完成" + i);
        }
        System.out.println("全部結束");
    }

    public static void resizeFile(String imagePathToRead,
                                  String imagePathToWrite)
            throws IOException {

        File fileToRead = new File(imagePathToRead);
        BufferedImage bufferedImageInput = ImageIO.read(fileToRead);
        int originalWidth = bufferedImageInput.getWidth();
        int originalHeight = bufferedImageInput.getHeight();
        System.out.println("原圖片寬度:" +originalWidth + "原圖片高度:" + originalHeight);
        int resizeWidth = originalWidth / 2;
        int resizeHeight = originalHeight / 2;
        System.out.println("調整後圖片寬度:" +resizeWidth + "調整後圖片高度:" + resizeHeight);
        BufferedImage bufferedImageOutput = new BufferedImage(resizeWidth,
                resizeHeight, bufferedImageInput.getType());

        Graphics2D g2d = bufferedImageOutput.createGraphics();
        g2d.drawImage(bufferedImageInput, 0, 0, resizeWidth, resizeHeight, null);
        g2d.dispose();

        String formatName = imagePathToWrite.substring(imagePathToWrite
                .lastIndexOf(".") + 1);

        ImageIO.write(bufferedImageOutput, formatName, new File(imagePathToWrite));
    }

}
