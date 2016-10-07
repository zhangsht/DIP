function [output_img] = bilinearScale(w, h)
    %˫�����ڲ����ͼ�����
    %   w:Ŀ��ͼ���ȣ�h:Ŀ��ͼ��߶�
    
    ima=imread('e:\\picture\\70.png');
    [width, height] = size(ima);
    output_img = uint8(zeros(w, h));
%   ��ֹ��� �����к���
    ima(width + 1, height + 1) = 0;
%   ���к������������ϵ���������
    wFactor = (width - 1) / (w - 1);
    hFactor = (height - 1) / (h - 1);
    for m = 1 : w
        for n = 1 : h
            x = (m - 1) * wFactor + 1;
            y = (n - 1) * hFactor + 1;
%             x����ߡ��ұ� y�����桢��������ֵ
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

