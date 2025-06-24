img = imread('filters.png');  
img = imnoise(img, 'salt & pepper', 0.02);
img = im2gray(img);  
img = double(img);  

filtersize = 3; 
padsize = floor(filtersize / 2);
paddedimg = padarray(img, [padsize, padsize], 'replicate');
[M, N] = size(img);

avgfiltered = zeros(M, N);
weightedavgfiltered = zeros(M, N);
medianfiltered = zeros(M, N);

weightedfilter = [1 2 1; 2 4 2; 1 2 1];  
weightedfilter = weightedfilter / sum(weightedfilter(:));  

for i = 1:M
    for j = 1:N        
        region = paddedimg(i:i+filtersize-1, j:j+filtersize-1);
        avgfiltered(i, j) = mean(region(:));  
        weightedavgfiltered(i, j) = sum(sum(region .* weightedfilter));  
        medianfiltered(i, j) = median(region(:));  
    end
end

avgfiltered = uint8(avgfiltered);
weightedavgfiltered = uint8(weightedavgfiltered);
medianfiltered = uint8(medianfiltered);

avgkernel = ones(3,3) / 9;  
avgbuiltin = uint8(conv2(img, avgkernel, 'same'));  
wavgbuiltin = uint8(conv2(img, weightedfilter, 'same'));  
medianbuiltin = uint8(medfilt2(img, [3 3]));  

figure;
subplot(2,3,1), imshow(avgfiltered), title('Avg Filter Manual');
subplot(2,3,2), imshow(weightedavgfiltered), title('Weighted Avg Manual');
subplot(2,3,3), imshow(medianfiltered), title('Median Filter Manual');

subplot(2,3,4), imshow(avgbuiltin), title('Avg Filter Built-in');
subplot(2,3,5), imshow(wavgbuiltin), title('Weighted Avg Built-in');
subplot(2,3,6), imshow(medianbuiltin), title('Median Filter Built-in');

figure;
subplot(1,1,1), imshow('filters.png');
