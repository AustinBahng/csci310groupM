package backend;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Shape;
import java.awt.font.FontRenderContext;
import java.awt.font.GlyphVector;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;

public class testMain {
	public static void main(String[] args) {
		CollageBuilder cb = new CollageBuilder();
		List<BufferedImage> images = cb.getImageResults("dog");
		for (int i=0; i < images.size(); i++) {
        	System.out.println(i);
            images.set(i, cb.resize(images.get(i), 190, 175));
            images.set(i, cb.addBorder(images.get(i), 3));
            images.set(i, cb.rotate(images.get(i), cb.generateRandomAngle()));
        }
		BufferedImage img = cb.concatenation(images,3);
		File output = new File("test.png");
		
		
		
		final BufferedImage textCollage = new BufferedImage(img.getWidth(), img.getHeight(), BufferedImage.TYPE_INT_ARGB);
		Graphics2D g = textCollage.createGraphics();
		FontRenderContext frc = g.getFontRenderContext();
		String text = "fasdfweoi";
		int textSize = (int) (Math.floor(img.getWidth() / (text.length() + 1)) * 2);
		System.out.println("font: " + textSize);
		Font font = new Font(Font.SANS_SERIF, Font.BOLD, textSize);
		GlyphVector gv = font.createGlyphVector(frc, text);
		Rectangle2D box = gv.getVisualBounds();
		
        int xOff = 25 - (int)box.getX();
        int yOff = 80 - (int)box.getY();
        Shape shape = gv.getOutline(xOff,yOff);
        
        g.setClip(shape);
        g.drawImage(img,0,0,null);
       
        // can add border to letters
        //g.setClip(null);
        //g.setStroke(new BasicStroke(2f));
        //g.setColor(Color.WHITE);
        
        g.setRenderingHint(
            RenderingHints.KEY_ANTIALIASING,
            RenderingHints.VALUE_ANTIALIAS_ON);
        g.draw(shape);

        g.dispose();
        
        try {
			ImageIO.write(textCollage, "png", output);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
