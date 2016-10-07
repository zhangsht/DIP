clc;
imwrite(bilinearScale(192,128), 'E:\\picture\\192_128.png', 'png');
imwrite(bilinearScale(96,64), 'E:\\picture\\96_64.png', 'png');
imwrite(bilinearScale(48,32), 'E:\\picture\\48_32.png', 'png');
imwrite(bilinearScale(24,16), 'E:\\picture\\24_16.png', 'png');
imwrite(bilinearScale(12,8), 'E:\\picture\\12_8.png', 'png');
imwrite(bilinearScale(300,200), 'E:\\picture\\300_200.png', 'png');
imwrite(bilinearScale(450,300), 'E:\\picture\\450_300.png', 'png');
imwrite(bilinearScale(500,200), 'E:\\picture\\500_200.png', 'png');



imwrite(quantization(128), 'E:\\picture\\128.png', 'png');
imwrite(quantization(32), 'E:\\picture\\32.png', 'png');
imwrite(quantization(8), 'E:\\picture\\8.png', 'png');
imwrite(quantization(4), 'E:\\picture\\4.png', 'png');
imwrite(quantization(2), 'E:\\picture\\2.png', 'png');