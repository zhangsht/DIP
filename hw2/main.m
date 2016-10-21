clc;
input_img = imread('D:\\70.png');
% 2.2
%equalize_hist();

% 2.3.1
% subplot(221);
% imshow(input_img);
% avg_filter(1 : 3, 1 : 3) = 1;
% subplot(222);
% filter2d(input_img, avg_filter);
% avg_filter(1 : 7, 1 : 7) = 1;
% subplot(223);
% filter2d(input_img, avg_filter);
% avg_filter(1 : 11, 1 : 11) = 1;
% subplot(224);
% filter2d(input_img, avg_filter);


% 2.3.2
% avg_filter = [1, 1, 1; 1, -8, 1; 1, 1, 1];
% filter2d(input_img, avg_filter);

% 2.3.3
% avg_filter(1 : 3, 1 : 3) = 1;
% subplot(121);
% output_image  = filter2d(input_img, avg_filter);
% g_mask = input_img - output_image;
% output_image = input_img + 3 * g_mask;
% subplot(122);
% imshow(output_image);




