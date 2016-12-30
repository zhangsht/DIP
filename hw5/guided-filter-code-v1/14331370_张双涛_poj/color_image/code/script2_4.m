clc;
rgb = imread('D:\hw4_input\task_3\70.png');
subplot(2, 2, 1);
imshow(rgb);

% 
% r = rgb(:, :, 1);
% g = rgb(:, :, 2);
% b = rgb(:, :, 3);
% 
% [h_r, x] = equalize_hist(r, 1, 0);
% [h_g, y] = equalize_hist(g, 1, 0);
% [h_b, z] = equalize_hist(b,  1, 0);
% avg = (x + y + z) ./ 3;
% 
% [h_rr, xx] = equalize_hist(r, 2, avg);
% [h_gg, yy] = equalize_hist(g, 2, avg);
% [h_bb, zz] = equalize_hist(b, 2, avg);
% 
% new_rgb = cat(3, h_rr, h_gg, h_bb);
% subplot(2, 2, 2);
% imshow(new_rgb);


[new_rgb] = histogramRGB(rgb);
subplot(2, 2, 2);
imshow(new_rgb);



