/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.template.libraries;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;

/**
 *
 * @author fqlh0717
 */
public class IdenticonGenerator {

    /**
     *
     */
    public static int height = 5;

    /**
     *
     */
    public static int width = 5;

    /**
     *
     * @param userName
     * @param hashGenerator
     * @return
     */
    public static BufferedImage generate(String userName, HashGeneratorInterface hashGenerator) {
        byte[] hash = hashGenerator.generate(userName);

        BufferedImage identicon = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
        Graphics raster = identicon.getGraphics();

        //get byte values as unsigned ints
        int r = hash[0] & 255;
        int g = hash[1] & 255;
        int b = hash[2] & 255;

        int[] background = new int[]{255, 255, 255, 0};
        int[] foreground = new int[]{r, g, b, 255};

        for (int x = 0; x < width; x++) {

            int i = x < 3 ? x : 4 - x;

            for (int y = 0; y < height; y++) {
                int[] pixelColor;

                if ((hash[i] >> y & 1) == 1) {
                    raster.setColor(Color.GRAY);
                    pixelColor = foreground;
                } else {
                    raster.setColor(new Color(r, g, b));
                    pixelColor = background;
                }
                raster.fillRect(x * 10, y * 10, 10, 10);
            }
        }

        return identicon;
    }
}
