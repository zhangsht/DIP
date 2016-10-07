function [output_img] = bilinearScale(w, h)
    %双线性内插进行图像放缩
    %   w:目标图像宽度，h:目标图像高度
    
    ima=imread('e:\\picture\\70.png');
    [width, height] = size(ima);
    output_img = uint8(zeros(w, h));
%   防止溢出 增加行和列
    ima(width + 1, height + 1) = 0;
%   在行和列两个方向上的缩放因子
    wFactor = (width - 1) / (w - 1);
    hFactor = (height - 1) / (h - 1);
    for m = 1 : w
        for n = 1 : h
            x = (m - 1) * wFactor + 1;
            y = (n - 1) * hFactor + 1;
%             x的左边、右边 y的上面、下面坐标值
            lx = floor(x);
            rx = ceil(x);
            uy = floor(y);
            dy = ceil(y);
            u = x - lx;
            v = y - uy;
            output_img(m, n) = ima(lx, uy) * (1 - u) * (1 - v) + ima(rx, uy) * u * (1 - v) + ima(lx, dy) * (1 - u) * v + ima(rx, dy) * u * v;
        end
    end
    imshow(output_img);
end

