function [ imt ] = scale( xs, ys )
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
imt = uint8(zeros(xs,ys));

ima=imread('e:\\70.png');
[imax,imay] = size(ima);

    x = xs/imax;     %���ű���
    y = ys/imay;     %���ű���

if x>1 || y>1
    x = fix(x);     %���ű���
    y = fix(y);     %���ű���
end
for m=1:xs
     for n=1:ys
         outx = (m-1)/x+1;   %�����ͼ������λ��
         outy = (n-1)/y+1;
         %Ҫ����㵽�ڽ���ľ��룬������ĸ��ڽ����λ��
         xk = fix(outx);
         yk = fix(outy);
         %��������룬дΪxd��yd
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

