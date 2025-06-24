img = imread('ted.jpg');
imggray = rgb2gray(img);
imggray = double(imggray);

lap1 = [0 -1 0; -1 4 -1; 0 -1 0];
lap2 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
lap3 = [0 1 0; 1 -4 1; 0 1 0];
lap4 = [1 1 1; 1 -8 1; 1 1 1];

res1 = conv2(imggray, lap1, 'same');
res2 = conv2(imggray, lap2, 'same');
res3 = conv2(imggray, lap3, 'same');
res4 = conv2(imggray, lap4, 'same');

sharp1 = imggray + res1;
sharp2 = imggray + res2;
sharp3 = imggray - res3;
sharp4 = imggray - res4;

avgfilter = fspecial('average', 3); 
bluravg = conv2(imggray, avgfilter, 'same');
sharpavg = imggray + (imggray - bluravg);  

weightedfilter = fspecial('gaussian', [3 3], 1);
blurweighted = conv2(imggray, weightedfilter, 'same');
sharpweighted = imggray + (imggray - blurweighted);

figure;
subplot(3,3,1); imshow(uint8(imggray)); title('Original');
subplot(3,3,2); imshow(uint8(sharp1)); title('Mask 1 (Center 4)');
subplot(3,3,3); imshow(uint8(sharp3)); title('Mask 3 (Center -4)');
subplot(3,3,4); imshow(uint8(sharp2)); title('Mask 2 (Center 8)');
subplot(3,3,5); imshow(uint8(sharp4)); title('Mask 4 (Center -8)');
subplot(3,3,6); imshow(uint8(sharpavg)); title('Avg Sharp Masking');
subplot(3,3,7); imshow(uint8(sharpweighted)); title('Weighted Avg Sharp');
subplot(3,3,8:9); axis off; title('');
