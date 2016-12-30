function [ output_sum ] = sumOfBox( input_img, r)
% output_sum(x, y)=sum(sum(input_img(x-r:x+r,y-r:y+r)))
% pad zeros at the border

[height, width] = size(input_img);
output_sum = zeros(size(input_img));

%======= version 1 ==========
% padColum = zeros(height, r);
%zero padding
% padRow = zeros(r,width + 2 * r);
% step1 = [padColum input_img padColum];
% current_img = [padRow; step1; padRow];
% 
% for i = r + 1 : height + r
%     for j = r + 1 : width + r
%         tem = current_img(i - r : i + r, j - r : j + r);
%         output_sum(i - r, j - r) = sum(sum(tem));
%     end
% end

% ========= version 2 ===========
%cumulative sum over Y axis
imCum = cumsum(input_img, 1);
%difference over Y axis
output_sum(1:r+1, :) = imCum(1+r:2*r+1, :);
output_sum(r+2:height-r, :) = imCum(2*r+2:height, :) - imCum(1:height-2*r-1, :);
output_sum(height-r+1:height, :) = repmat(imCum(height, :), [r, 1]) - imCum(height-2*r:height-r-1, :);

%cumulative sum over X axis
imCum = cumsum(output_sum, 2);
%difference over Y axis
output_sum(:, 1:r+1) = imCum(:, 1+r:2*r+1);
output_sum(:, r+2:width-r) = imCum(:, 2*r+2:width) - imCum(:, 1:width-2*r-1);
output_sum(:, width-r+1:width) = repmat(imCum(:, width), [1, r]) - imCum(:, width-2*r:width-r-1);
end

