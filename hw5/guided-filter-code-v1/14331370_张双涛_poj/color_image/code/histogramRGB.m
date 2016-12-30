function [ new_rgb, I] = histogramRGB( rgb )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

rgb = im2double(rgb);
r = rgb(:, :, 1);
g = rgb(:, :, 2);
b = rgb(:, :, 3);

% RGB转HSI
% 注意归一化
num = 0.5*((r - g) + (r - b)); 
den = sqrt((r - g).^2 + (r - b).*(g - b)); 
theta = acos(num./(den + eps)); 

H = theta; 
H(b > g) = 2*pi - H(b > g); 
H = H/(2*pi); 

num = min(min(r, g), b); 
den = r + g + b; 
den(den == 0) = eps; 
S = 1 - 3.* num./den; 

H(S == 0) = 0; 

I = (r + g + b)/3; 

hsi = cat(3, H, S, I);

% HSI转RGB
% 注意对I的量化标定
H = hsi(:, :, 1) * 2 * pi; 
S = hsi(:, :, 2); 
I = hsi(:, :, 3); 

m = 255 / (max(max(I)));
I = round(I * m);
% 亮度均衡化
I = equalize_hist(I, 1, 0);
I = I / m;


R = zeros(size(hsi, 1), size(hsi, 2)); 
G = zeros(size(hsi, 1), size(hsi, 2)); 
B = zeros(size(hsi, 1), size(hsi, 2)); 

idx = find( (0 <= H) & (H < 2*pi/3)); 
B(idx) = I(idx) .* (1 - S(idx)); 
R(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx)) ./ cos(pi/3 - H(idx))); 
G(idx) = 3*I(idx) - (R(idx) + B(idx)); 

idx = find( (2*pi/3 <= H) & (H < 4*pi/3) ); 
R(idx) = I(idx) .* (1 - S(idx)); 
G(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx) - 2*pi/3) ./ cos(pi - H(idx))); 
B(idx) = 3*I(idx) - (R(idx) + G(idx)); 

idx = find( (4*pi/3 <= H) & (H <= 2*pi)); 
G(idx) = I(idx) .* (1 - S(idx)); 
B(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx) - 4*pi/3) ./ cos(5*pi/3 - H(idx))); 
R(idx) = 3*I(idx) - (G(idx) + B(idx)); 

rgb = cat(3, R, G, B); 
new_rgb = max(min(rgb, 1), 0); 
end

