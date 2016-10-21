function output_image = equalize_hist()
%直方图均衡化
input_img = imread('D:\\70.png');
subplot(221);
imshow(input_img);
[m, n] = size(input_img);
h = zeros(1, 256);
for i = 1 : m
    for j = 1 : n
        f = input_img(i, j);
        h(f + 1) = h (f + 1) + 1;
    end
end
subplot(222);
bar(h);

%每个像素值个数统计
pixel_number = zeros(1, 256);
for i = 1 : m
    for j = 1 : n
        pixel_number(input_img(i, j) + 1) = pixel_number(input_img(i, j) + 1) + 1;
    end
end

%计算每个像素值个数在所有像素中的例子
pixel_prob = zeros(1, 256);
for i  = 1 : 256
    pixel_prob(i) = pixel_number(i) / (m * n * 1.0);
end

%计算每个像素值的累计概率和映射的s值
pixel_commu = zeros(1, 256);
pixel_commu(1) = pixel_prob(1);
for i = 2 : 256
    pixel_commu(i) = pixel_commu(i - 1) + pixel_prob(i);
end
pixel_commu = uint8(255 * pixel_commu + 0.5);

for i = 1 : m
    for j = 1 : n
        input_img(i,j) = pixel_commu(input_img(i, j) + 1);
    end
end

subplot(223)
imshow(input_img);
%统计均衡化后的每个像素值出现的次数
for i = 1 : m
    for j = 1 : n
        f = input_img(i, j);
        h(f + 1) = h (f + 1) + 1;
    end
end
subplot(224);
bar(h);
imwrite(input_img, 'D:\\70.png');
end

