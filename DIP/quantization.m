function [output_img] = quantization(level)
    %量化图像的灰度级数
    %level是目标图像的灰度级
    %算法描述：
        %1.根据级数求得步长或梯度
        %2.求原灰度值的映射值，并用ceil取整
    
    factor = log2(256 / level);
    ima=imread('e:\\picture\\70.png');
    [width, height] = size(ima);
    output_img = uint8(zeros(width, height));
    
    for m= 1 : width
       for n = 1 : height
         x = ima(m, n);
         y = 255 / (256 / 2 ^ factor - 1);
         output_img(m, n) = ceil(x / y * y);
       end
    end
    imshow(output_img);
end

