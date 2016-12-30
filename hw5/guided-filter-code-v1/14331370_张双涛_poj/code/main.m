clc;
clear;
%========= Image smoothing ==========
% I = double(imread('.\dataset\img_smoothing\lena.bmp')) / 255;
% p = I;
% ========= 3 * 3 grid, change r(2, 4, 8), change eps(0.1, 0.2, 0.4)==========
% r = 2;
% eps = 0.1 ^ 2;
% q = guideImageFilter(I, p, r, eps);
% subplot(3, 3, 1); 
% imshow(q, [0, 1]);
% title('r = 2, eps = 0.1');
% 
% r = 4;
% eps = 0.1 ^ 2;
% q = guideImageFilter(I, p, r, eps);
% subplot(3, 3, 4); 
% imshow(q, [0, 1]);
% title('r = 4, eps = 0.1');
% 
% r = 8;
% eps = 0.1 ^ 2;
% q = guideImageFilter(I, p, r, eps);
% subplot(3, 3, 7); 
% imshow(q, [0, 1]);
% title('r = 8, eps = 0.1');
% 
% r = 2;
% eps = 0.2 ^ 2;
% q = guideImageFilter(I, p, r, eps);
% subplot(3, 3, 2); 
% imshow(q, [0, 1]);
% title('r = 2, eps = 0.2');
% 
% r = 4;
% eps = 0.2 ^ 2;
% q = guideImageFilter(I, p, r, eps);
% subplot(3, 3, 5); 
% imshow(q, [0, 1]);
% title('r = 4, eps = 0.2');
% 
% r = 8;
% eps = 0.2 ^ 2;
% q = guideImageFilter(I, p, r, eps);
% subplot(3, 3, 8); 
% imshow(q, [0, 1]);
% title('r = 8, eps = 0.2');
% 
% r = 2;
% eps = 0.4 ^ 2;
% q = guideImageFilter(I, p, r, eps);
% subplot(3, 3, 3); 
% imshow(q, [0, 1]);
% title('r = 2, eps = 0.4');
% 
% r = 4;
% eps = 0.4 ^ 2;
% q = guideImageFilter(I, p, r, eps);
% subplot(3, 3, 6); 
% imshow(q, [0, 1]);
% title('r = 4, eps = 0.4');
% 
% r = 8;
% eps = 0.4 ^ 2;
% q = guideImageFilter(I, p, r, eps);
% subplot(3, 3, 9); 
% imshow(q, [0, 1]);
% title('r = 8, eps = 0.4');


% ======== image detail engancement =======
I = double(imread('.\family\final.jpg')) / 255;
p = I;

r = 16;
eps = 0.1^2;

q = zeros(size(I));

% handle three channels sepatately
q(:, :, 1) = guideImageFilter(I(:, :, 1), p(:, :, 1), r, eps);
q(:, :, 2) = guideImageFilter(I(:, :, 2), p(:, :, 2), r, eps);
q(:, :, 3) = guideImageFilter(I(:, :, 3), p(:, :, 3), r, eps);
% high-boost filtering
I_enhanced = (I - q) * 3 + q;

figure();
imshow([I I_enhanced], [0, 1]);
imwrite(I_enhanced, '.\family\hha.jpg');
title('从左到右依次为原图、 细节增强');