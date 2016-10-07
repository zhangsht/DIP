function [ imt ] = scale( xs, ys )
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
imt = uint8(zeros(xs,ys));

ima=imread('e:\\70.png');
[imax,imay] = size(ima);

    x = xs/imax;     %缩放倍数
    y = ys/imay;     %缩放倍数

if x>1 || y>1
    x = fix(x);     %缩放倍数
    y = fix(y);     %缩放倍数
end
for m=1:xs
     for n=1:ys
         outx = (m-1)/x+1;   %求输出图像各点的位置
         outy = (n-1)/y+1;
         %要求各点到邻近点的距离，先求出四个邻近点的位置
         xk = fix(outx);
         yk = fix(outy);
         %可求出距离，写为xd和yd
         xd = outx - xk;
         yd = outy - yk;

          if outx<imax && outy<imay
             imt(m,n)=ima(xk,yk)*(1-xd)*(1-yd)+ima(xk+1,yk)*(1-yd)*xd+ima(xk,yk+1)*yd*(1-xd)+ima(xk+1,yk+1)*xd*yd;
          elseif outx==imax && outy<imay
             imt(m,n)=ima(xk,yk)*(1-xd)*(1-yd)+ima(xk,yk+1)*yd*(1-xd);
         elseif outx<imax && outy==imay
             imt(m,n)=ima(xk,yk)*(1-xd)*(1-yd)+ima(xk+1,yk)*(1-yd)*xd;
         elseif outx==imax && outy==imay
             imt(m,n)=ima(xk,yk)*(1-xd)*(1-yd);
         end
     end
end
imt = uint8(imt);
end

