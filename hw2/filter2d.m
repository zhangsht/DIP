function [ output_image ] = filter2d( input_img, avg_filter)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
[height, width] = size(input_img);
[n, n] = size(avg_filter);

input_img = double(input_img);
output_image = input_img;

for i = 1 : height - n + 1
    for j = 1 : width - n + 1
        tem = input_img(i : i + n - 1, j : j + n - 1) .* avg_filter;
        s = sum(sum(tem));
        output_image(i + (n - 1) / 2, j + (n - 1) / 2) = s / (n * n);
    end
end
output_image = uint8(output_image);
imshow(output_image);
end

