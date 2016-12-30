function [ output_image ] = filter2d( input_img, type, n)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
[height, width] = size(input_img);

input_img = double(input_img);
output_image = input_img;

if strcmp(type, 'arithmetic')
    for i = 1 : height - n + 1
        for j = 1 : width - n + 1
            tem = input_img(i : i + n - 1, j : j + n - 1);
            s = sum(sum(tem));
            output_image(round(i + (n - 1) / 2) + 1, round(j + (n - 1) / 2) + 1) = s ./ (n * n);
        end
    end

elseif strcmp(type, 'min')
    for i = 1 : height - n + 1
        for j = 1 : width - n + 1
            tem = input_img(i : i + n - 1, j : j + n - 1);
            min = 255;
            for p = 1 : n
                for q = 1 : n
                    if tem(p, q) < min
                        min = tem(p, q);
                    end
                end
            end
            output_image(round(i + (n - 1) / 2) + 1, round(j + (n - 1) / 2) + 1) = min;
        end
    end
elseif strcmp(type, 'geometric')
    for i = 1 : height - n + 1
        for j = 1 : width - n + 1
            tem = input_img(i : i + n - 1, j : j + n - 1);
            mul = 1;
            for p = 1 : n
                for q = 1 : n
                    mul = mul * tem(p, q);
                end
            end
            output_image(round(i + (n - 1) / 2) + 1, round(j + (n - 1) / 2) + 1) = nthroot(mul, n * n);
        end
    end

elseif strcmp(type, 'median')
    for i = 1 : height - n + 1
        for j = 1 : width - n + 1
            tem = input_img(i : i + n - 1, j : j + n - 1);
            s = median(median(tem, 1));
            output_image(round(i + (n - 1) / 2) + 1, round(j + (n - 1) / 2) + 1) = s;
        end
    end

elseif strcmp(type, 'harmonic')
    for i = 1 : height - n + 1
        for j = 1 : width - n + 1
            tem = input_img(i : i + n - 1, j : j + n - 1);
            tem = 1 ./ tem;
            s = sum(sum(tem));
            output_image(round(i + (n - 1) / 2) + 1, round(j + (n - 1) / 2) + 1) = (n * n) ./ s;
        end
    end
elseif strcmp(type, 'contraharmonic')
    for i = 1 : height - n + 1
        for j = 1 : width - n + 1
            fil = input_img(i : i + n - 1, j : j + n - 1);
            tem = fil .* (fil .^ 2.5);
            s = sum(sum(tem));
            tem2 = fil .* (fil .^ 1.5);
            s2 = sum(sum(tem2));
          
            output_image(round(i + (n - 1) / 2) + 1, round(j + (n - 1) / 2) + 1) = s ./ s2;
        end
    end
end
output_image = uint8(output_image);
end

