clc;
clear;
IM1 = imread('C:\Users\Sudha\Documents\MATLAB\csc872\FP2\Cameraman.bmp');
IM2 = imresize(IM1,0.125);%64x64
IM2v = IM2(:);
IM2v = double(IM2v);
IM2v_size = numel(IM2v);
h = 5;%5%5
k = 20;%20%10
TH = 2;
j = 1;
OP = zeros(size(IM2,1));
for i=1:IM2v_size
    x=IM2v(i);%form new vector similar to image vector
    y1 = x; 
    yk = y1;
    for l = 1:k %iteration
        N = 0;
        D = 0;
        for j = 1:IM2v_size
     % Isotropic (Gaussian) Kernel
        exp_num =(exp(-(yk-IM2v(j))^2/h^2));
        N = N + IM2v(j)*exp_num; 
        D = D + exp_num;
        end
        mean = N/D;
        yk = mean;
    end
    OP(i) = mean; 
end
figure;
subplot(1,2,1);
imagesc(uint8(IM2));
colormap(gray);
title('Original');

subplot(1,2,2);
imagesc((uint8(OP)));
colormap(gray);
title('Mean Shift');


