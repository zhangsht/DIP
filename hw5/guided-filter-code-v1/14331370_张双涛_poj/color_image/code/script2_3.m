clc;
% img = imread('D:\hw4_input\task_1.png');
% subplot(1, 3, 1);
% imshow(img);
% 
% % subplot(2, 2, 2);
% % noise_img = imageNoise(img, 2, 0, 0.2);
% % imshow(noise_img);
% f_img2 = filter2d(img, 'contraharmonic', 3);
% subplot(1, 3, 2);
% imshow(f_img2);
% 
% f_img2 = filter2d(img, 'contraharmonic', 9);
% subplot(1, 3, 3);
% imshow(f_img2);

img = imread('D:\hw4_input\task_2.png');
subplot(2, 2, 1);
imshow(img);

subplot(2, 2, 2);
noise_img = imageNoise(img, 2, 0, 0.2);
imshow(noise_img);


f_img2 = filter2d(img, 'harmonic', 5);
subplot(2, 2, 3);
imshow(f_img2);
