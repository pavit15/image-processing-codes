img = imread('fish.jpg');
img = rgb2gray(img);
img = uint8(img);

[M, N] = size(img); 
L = 256;
a = uint8(zeros(M, N));

hc = imhist(img);
pdf = hc / (M * N);
cdf = cumsum(pdf);
cdfnorm = round((L - 1) * cdf);

for i = 1:M
    for j = 1:N
        a(i, j) = cdfnorm(img(i, j) + 1);
    end
end

histeqimg = histeq(img, 256);

figure;
subplot(3, 2, 1);
imshow(img);
title('Original Image');

subplot(3, 2, 2);
imhist(img);
title('Original Histogram');

subplot(3, 2, 3);
imshow(a);
title('Histogram Equalized Image');

subplot(3, 2, 4);
imhist(a);
title('Histogram of Equalized Image');

subplot(3, 2, 5);
imshow(histeqimg);
title('Image using histeq');

subplot(3, 2, 6);
imhist(histeqimg);
title('Histogram of histeq Image');