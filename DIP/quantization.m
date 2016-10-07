function [output_img] = quantization(level)
    %����ͼ��ĻҶȼ���
    %level��Ŀ��ͼ��ĻҶȼ�
    %�㷨������
        %1.���ݼ�����ò������ݶ�
        %2.��ԭ�Ҷ�ֵ��ӳ��ֵ������ceilȡ��
    
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

