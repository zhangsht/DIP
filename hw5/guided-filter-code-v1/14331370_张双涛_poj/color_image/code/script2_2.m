clc;
img = imread('D:\hw4_input\task_1.png');
subplot(1, 3, 1);
imshow(img);

output_img = filter2(fspecial('average', 3), img);
subplot(1, 3, 2)
imshow(output_img);

output_img = filter2(fspecial('average', 9), img);
subplot(1, 3, 3)
imshow(output_img);
