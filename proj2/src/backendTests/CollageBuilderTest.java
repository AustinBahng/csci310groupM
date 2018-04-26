package backendTests;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertTrue;

import java.awt.image.BufferedImage;
import java.util.List;

import org.junit.Test;

import backend.Collage;
import backend.CollageBuilder;

public class CollageBuilderTest {

	@Test
	public void testShapeCollage() {
		CollageBuilder cb = new CollageBuilder();
		List<BufferedImage> images = cb.getImageResults("dog");
		BufferedImage collage = CollageBuilder.concatenation(images, 3);
		BufferedImage shapedCollage = cb.shapeCollage(collage, "dog");
		assertNotSame(collage, shapedCollage);
	}

	@Test
	public void testValidCalculateSufficiecy() {
		CollageBuilder cb = new CollageBuilder();
		cb.buildCollage("dog", "dog", 0, 1, 1, 800, 600);
		boolean valid = cb.calculateSufficiecy();
		assertTrue(valid);
	}

	@Test
	public void testInvalidCalculateSufficiecy() {
		CollageBuilder cb = new CollageBuilder();
		cb.buildCollage("asdfug3i17ga9we7fg3or899asdvuga7w3o8r7giuasef", "dog", 0, 1, 1, 800, 600);
		boolean valid = cb.calculateSufficiecy();
		assertFalse(valid);
	}

	@Test
	public void testValidBuildCollage() {
		CollageBuilder cb = new CollageBuilder();
		Collage test = cb.buildCollage("dog", "dog", 0, 1, 1, 800, 600);
		assertTrue(test.getDisplay());
	}

	@Test
	public void testInvalidBuildCollage() {
		CollageBuilder cb = new CollageBuilder();
		Collage test = cb.buildCollage("asdfuig2ior79iu73t9aosdufoogaowiurg23f3ougaef2jkasdhfiu", "dog", 0, 1, 1, 800,
				600);
		assertFalse(test.getDisplay());
	}

	@Test
	public void testConcatenation() {
		CollageBuilder cb = new CollageBuilder();
		List<BufferedImage> images = cb.getImageResults("dog");
		BufferedImage collage = CollageBuilder.concatenation(images, 3);
		assertNotNull(collage);
	}

	@Test
	public void testValidGetImageResults() {
		CollageBuilder cb = new CollageBuilder();
		List<BufferedImage> test = cb.getImageResults("usc");
		assertEquals(test.size(), 100);
	}

	@Test
	public void testInvalidGetImageResults() {
		CollageBuilder cb = new CollageBuilder();
		List<BufferedImage> test = cb.getImageResults("asdfiug32r7o8agfo238rgalseiefuagsdbfjh3g2iryawie78fgsa");
		assertNotSame(test.size(), 30);
	}

	@Test
	public void testRotate() {
		BufferedImage testImg = new BufferedImage(50, 50, BufferedImage.TYPE_INT_ARGB);
		BufferedImage testImg2 = CollageBuilder.rotate(testImg, 10);
		assertNotSame(testImg, testImg2);
	}

	@Test
	public void testUpperGenerateRandomAngle() {
		CollageBuilder cb = new CollageBuilder();
		int rand = 0;
		rand = cb.generateRandomAngle();
		Boolean check = (rand <= 45);
		assertTrue(check);
	}

	@Test
	public void testLowerGenerateRandomAngle() {
		CollageBuilder cb = new CollageBuilder();
		int rand = 0;
		rand = cb.generateRandomAngle();
		Boolean check = (rand >= -45);
		assertTrue(check);
	}

	@Test
	public void testResizeWidth() {
		BufferedImage img = new BufferedImage(50, 50, BufferedImage.TYPE_INT_ARGB);
		BufferedImage resizedImg = CollageBuilder.resize(img, 100, 100);
		assertEquals(resizedImg.getWidth(), 100);
	}

	@Test
	public void testResizeHeight() {
		BufferedImage img = new BufferedImage(50, 50, BufferedImage.TYPE_INT_ARGB);
		BufferedImage resizedImg = CollageBuilder.resize(img, 100, 100);
		assertEquals(resizedImg.getHeight(), 100);
	}

	@Test
	public void testAddBorder() {
		BufferedImage testImg = new BufferedImage(50, 50, BufferedImage.TYPE_INT_ARGB);
		BufferedImage testImg2 = CollageBuilder.addBorder(testImg, 5);
		assertNotSame(testImg, testImg2);
	}

	@Test
	public void testNoRotate() {
		BufferedImage testImg = new BufferedImage(50, 50, BufferedImage.TYPE_INT_ARGB);
		BufferedImage testImg2 = CollageBuilder.rotate(testImg, 10);
		assertNotSame(testImg, testImg2);
	}

	@Test
	public void testNoBorders() {
		BufferedImage testImg = new BufferedImage(50, 50, BufferedImage.TYPE_INT_ARGB);
		BufferedImage testImg2 = CollageBuilder.addBorder(testImg, 5);
		assertNotSame(testImg, testImg2);
	}

	@Test
	public void testSepiaFilter() {
		BufferedImage testImg = new BufferedImage(50, 50, BufferedImage.TYPE_INT_ARGB);
		BufferedImage testImg2 = CollageBuilder.toSepia(testImg);
		assertNotSame(testImg, testImg2);
	}

	@Test
	public void testBlackAndWhiteFilter() {
		BufferedImage testImg = new BufferedImage(50, 50, BufferedImage.TYPE_INT_ARGB);
		BufferedImage testImg2 = CollageBuilder.toBlackAndWhite(testImg);
		assertNotSame(testImg, testImg2);
	}

	@Test
	public void testGreyscaleFilter() {
		CollageBuilder cb = new CollageBuilder();
		Collage test1 = cb.buildCollage("dog", "dog", 2, 1, 1, 800, 600);
		Collage test2 = cb.buildCollage("dog", "dog", 0, 1, 1, 800, 600);

		assertNotSame(test1, test2);
	}

	@Test
	public void testCreateCollageWithSepiaFilterBordersAndRotations() {
		CollageBuilder cb = new CollageBuilder();
		Collage test = cb.buildCollage("dog", "dog", 1, 1, 1, 800, 600);
		assertTrue(test.getDisplay());
	}

	@Test
	public void testCreateCollageWithGreyscaleFilterBordersAndRotations() {
		CollageBuilder cb = new CollageBuilder();
		Collage test = cb.buildCollage("dog", "dog", 2, 1, 1, 800, 600);
		assertTrue(test.getDisplay());
	}

	@Test
	public void testCreateCollageWithBWFilterBordersAndRotations() {
		CollageBuilder cb = new CollageBuilder();
		Collage test = cb.buildCollage("dog", "dog", 3, 1, 1, 800, 600);
		assertTrue(test.getDisplay());
	}

	@Test
	public void testCreateCollageWithSepiaFilterNoBordersAndNoRotations() {
		CollageBuilder cb = new CollageBuilder();
		Collage test = cb.buildCollage("blue", "t", 1, 0, 0, 800, 600);
		assertTrue(test.getDisplay());
	}

	@Test
	public void testCreateCollageWithGreyscaleFilterNoBordersAndNoRotations() {
		CollageBuilder cb = new CollageBuilder();
		Collage test = cb.buildCollage("dog", "t", 2, 0, 0, 800, 600);
		assertTrue(test.getDisplay());
	}

	@Test
	public void testCreateCollageWithBWFilterNoBordersAndNoRotations() {
		CollageBuilder cb = new CollageBuilder();
		Collage test = cb.buildCollage("dog", "t", 3, 0, 0, 800, 600);
		assertTrue(test.getDisplay());
	}
}
