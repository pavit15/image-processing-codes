img = imread('ivp.jpg');
img = rgb2gray(img); 
img = double(img);

r1 = input('Enter r1: ');
r2 = input('Enter r2: ');
v = input('Enter v: ');
w = input('Enter w: ');

alpha = v / r1;              
beta = (w - v) / (r2 - r1);    
gamma = (255 - w) / (255 - r2); 

[r, c] = size(img);
answer = zeros(r, c);

for i = 1:r
    for j = 1:c
        pixel = img(i, j);
        
        if pixel < r1
            answer(i, j) = alpha * pixel;
        elseif pixel >= r1 && pixel < r2
            answer(i, j) = beta * (pixel - r1) + v;
        else
            answer(i, j) = gamma * (pixel - r2) + w;
        end
    end
end

answer = uint8(answer);
img = uint8(img);

figure;

subplot(2,2,1);
imshow(img); 
title('Original Image');

subplot(2,2,2);
imshow(answer);
title('After Contrast Stretch');

subplot(2,2,3);
hist(double(img(:)), 256);
title('Histogram of Original Image');
xlabel('Pixel Intensity');
ylabel('Frequency');

subplot(2,2,4);
hist(double(answer(:)), 256); 
title('Histogram of Stretched Image');
xlabel('Pixel Intensity');
ylabel('Frequency');

disp('Contrast stretching completed.');

%final
%Enter r1: 20
%Enter r2: 130
%Enter v: 0
%Enter w: 255
% Contrast stretching completed.
