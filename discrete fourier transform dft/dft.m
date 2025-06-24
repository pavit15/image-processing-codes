% Read the input image
newimg = imread('ivp2.jpg');
[M, N] = size(newimg);
answ = zeros(M, N);

% Compute 2D DFT manually using nested loops
for u = 0:M-1
    for v = 0:N-1
        temp = 0;
        for x = 0:M-1
            for y = 0:N-1
                temp = temp+double(newimg(x+1, y+1)) * exp(-1j*2* pi * ((u * x) / M + (v * y) / N));
            end
        end
        answ(u+1, v+1) = temp;
    end
end

% Compute FFT using built-in function for comparison
fft_img = fft2(newimg);

% Display results
figure;

% Manual DFT Magnitude Spectrum
subplot(2, 2, 1);
mag = log(abs(answ) + 1);
imshow(mag, []);
title('Manual DFT Magnitude Spectrum');

% Manual DFT Phase Spectrum
subplot(2, 2, 2);
phase = angle(answ);
imshow(phase, []);
title('Manual DFT Phase Spectrum');

% Built-in FFT Magnitude Spectrum
subplot(2, 2, 3);
mag2 = log(abs(fft_img) + 1);
imshow(mag2, []);  % Fixed: was showing 'mag' instead of 'mag2'
title('FFT Magnitude Spectrum');

% Built-in FFT Phase Spectrum
subplot(2, 2, 4);
phase2 = angle(fft_img);
imshow(phase2, []);  % Fixed: was showing 'phase' instead of 'phase2'
title('FFT Phase Spectrum');