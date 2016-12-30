function output_image = fft2d(input_img, flags)
% 主要思想
% 利用傅里叶变换基底的性质降低运算量
% 通过两次一维计算实现二维傅里叶变换
    handle_img = input_img;
    [h, w] = size(handle_img);
    output_image = [];
%     考虑MH和MW具有2的幂次方形式
    MH = 2 ^ nextpow2(h);
    MW = 2 ^ nextpow2(w);
    
   if (flags == 0)
        mid = zeros(MH, MW);
        for x = 1 : h
            for y = 1 : w            
                mid(x, y) = double(handle_img(x, y)) * ((-1) ^ (x + y));
            end
        end
        temp = [];
        M = nextpow2(w);
        N = 2 ^ M;
        for u = 1 : MH
            row = mid(u, :);
            J = 0;
            for I = 0 : N - 1 
                if I < J
                    T = row(I + 1);
                    row(I + 1) = row(J + 1);
                    row(J + 1) = T;
                end
                K = N / 2;
                while(J >= K)
                    J = J - K;
                    K = K / 2;
                end
                J = J + K;
            end
            WN = exp(-1j * 2 * pi / N);
            for L = 1 : M
                B = 2 ^ (L - 1);
                for R = 0 : B - 1
                    P = 2 ^ (M - L) * R;
                    for K = R : 2 ^ L : N - 2;
                        T = row(K + 1) + row(K + B + 1) * WN ^ P;
                        row(K + B + 1) = row(K + 1) - row(K + B + 1) * WN ^ P;
                        row(K + 1) = T;
                    end
                end
            end
            temp = [temp; row];
        end
        M = nextpow2(h);
        N = 2 ^ M;
        temp = temp.';
        for u = 1 : MW
            row = temp(u, :);
            J = 0;
            for I = 0 : N - 1 
                if I < J
                    T = row(I + 1);
                    row(I + 1) = row(J + 1);
                    row(J + 1) = T;
                end
                K = N / 2;
                while(J >= K)
                    J = J - K;
                    K = K / 2;
                end
                J = J + K;
            end 
            WN = exp(-1j * 2 * pi / N);
            for L = 1 : M
                B = 2 ^ (L - 1);
                for R = 0 : B - 1
                    P = 2 ^ (M - L) * R;
                    for K= R : 2 ^ L : N - 2;
                        T = row(K + 1) + row(K + B + 1) * WN ^ P;
                        row(K + B + 1) = row(K + 1) - row(K + B + 1) * WN ^ P;
                        row(K + 1) = T;
                    end
                end
            end
            output_image = [output_image row.']; 
        end
        showImage = zeros(MH, MW);
        for x = 1 : MH
            for y = 1 : MW
                showImage(x, y) = abs(output_image(x, y));
            end
        end
        showImage = showImage - min(showImage(:));
        showImage = 255 * (showImage ./ max(max(showImage)));
        for x = 1 : MH
            for y = 1 : MW
                showImage(x, y) = (255 / log(256)) * log(1 + showImage(x, y));
            end
        end
        figure;
        imshow(uint8(showImage));
    else
        temp = [];
        M = nextpow2(w);
        N = 2 ^ M;
        for u = 1 : MH
            row = handle_img(u, :);
            J = 0;
            for I = 0 : N - 1 
                if I < J
                    T = row(I + 1);
                    row(I + 1) = row(J + 1);
                    row(J + 1) = T;
                end
                K = N / 2;
                while(J >= K)
                    J = J - K;
                    K = K / 2;
                end
                J = J + K;
            end
            WN = exp(-1j * 2 * pi / N);
            for L = 1 : M
                B = 2 ^ (L - 1);
                for R = 0 : B - 1
                    P = 2 ^ (M - L) * R;
                    for K= R : 2 ^ L : N - 2;
                        T = row(K + 1) + row(K + B + 1) * WN ^ (-P);
                        row(K + B + 1) = row(K + 1) - row(K + B + 1) * WN ^ (-P);
                        row(K + 1) = T;
                    end
                end
            end
            row = row * (1 / N);
            temp = [temp; row];
        end
        M = nextpow2(h);
        N = 2 ^ M;
        temp = temp.';
        for u = 1 : MW
            row = temp(u, :);
            J = 0;
            for I = 0 : N-1 
                if I < J
                    T = row(I + 1);
                    row(I + 1) = row(J + 1);
                    row(J + 1) = T;
                end
                K = N / 2;
                while(J >= K)
                    J = J - K;
                    K = K / 2;
                end
                J = J + K;
            end 
            WN = exp(-1j * 2 * pi / N);
            for L = 1 : M
                B = 2 ^ (L - 1);
                for R = 0 : B - 1
                    P = 2 ^ (M - L) * R;
                    for K= R : 2 ^ L : N - 2;
                        T = row(K + 1) + row(K + B + 1) * WN ^ (-P);
                        row(K + B + 1) = row(K + 1) - row(K + B + 1) * WN ^ (-P);
                        row(K + 1) = T;
                    end
                end
            end
            row = row * (1 / N);
            output_image = [output_image row.'];    
        end
        for x = 1 : MH
            for y = 1 : MW            
                output_image(x, y) = real(output_image(x, y)) * ((-1) ^ (x + y));
            end
        end
        imshow(uint8(output_image));
    end
end
