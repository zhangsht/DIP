function out_image = filter2d_freq(imagePath, filter)
% ��������ͼ����˲����ĸ���Ҷ�任
% ���õ��Ľ�����˷�����
% ���õ��Ľ��������Ҷ���任
    handle_img = imread(imagePath);
    [h, w] = size(handle_img);
    [filterHeight, filterWidth] = size(filter);
    finalHeight = h + filterHeight;
    finalWidth = w + filterWidth;
    
    Picture = zeros(finalHeight, finalWidth);
    Filter = zeros(finalHeight, finalWidth);
    out_image = zeros(h, w);
    result = zeros(finalHeight, finalWidth);
    for x = 1 : h
        for y = 1 : w
            Picture(x, y) = handle_img(x, y);
        end
    end
    Fpic = fft2d(Picture, 0);
    for x = 1 : filterHeight
        for y = 1 : filterWidth
            Filter(x, y) = filter(x, y);
        end
    end

    Ffil = fft2d(Filter, 0);
    result = Ffil .* Fpic;
    result = fft2d(result, 1);
    for x = 1 : h
        for y = 1 : w
            out_image(x, y) = result(x, y);
        end
    end
    figure;
    imshow(uint8(out_image));
end
