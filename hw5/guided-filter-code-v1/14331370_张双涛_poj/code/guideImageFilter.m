function [ q ] = guideImageFilter( I, p, r, eps)
% I:guided image
% p:input image
% r:windows size
% eps:regularization parameter

[height, width] = size(I);
N = sumOfBox(ones(height, width), r);

mean_I = sumOfBox(I, r) ./ N;
mean_p = sumOfBox(p, r) ./ N;
mean_Ip = sumOfBox(I.*p, r) ./ N;

% the covariance of (I, p) in each local patch.
cov_Ip = mean_Ip - mean_I .* mean_p; 

mean_II = sumOfBox(I.*I, r) ./ N;
var_I = mean_II - mean_I .* mean_I;

% Eqn. (5)&(6) in the paper;
% get a & b with linear regression
a = cov_Ip ./ (var_I + eps); 
b = mean_p - a .* mean_I; 

% mean of a & b in all linear functions
mean_a = sumOfBox(a, r) ./ N;
mean_b = sumOfBox(b, r) ./ N;

% Eqn. (8) in the paper;
q = mean_a .* I + mean_b; 
end

