function output_image = equalize_hist()
%ֱ��ͼ���⻯
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

%ÿ������ֵ����ͳ��
pixel_number = zeros(1, 256);
for i = 1 : m
    for j = 1 : n
        pixel_number(input_img(i, j) + 1) = pixel_number(input_img(i, j) + 1) + 1;
    end
end

%����ÿ������ֵ���������������е�����
pixel_prob = zeros(1, 256);
for i  = 1 : 256
    pixel_prob(i) = pixel_number(i) / (m * n * 1.0);
end

%����ÿ������ֵ���ۼƸ��ʺ�ӳ���sֵ
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
%ͳ�ƾ��⻯���ÿ������ֵ���ֵĴ���
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

