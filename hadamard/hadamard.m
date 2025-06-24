n = input('Enter order (must be power of 2): '); 

Hbasis = zeros(n, n);  
x = log2(n); 

% Generate Hadamard matrix using binary representation method
for u = 0:n-1       % Row index
    for v = 0:n-1   % Column index
        % Convert indices to binary strings with leading zeros
        row = dec2bin(u,x); 
        col = dec2bin(v,x); 
        
        sum = 0;  % Initialize sum for inner product calculation
        
        % Calculate inner product of binary representations
        for i=0:x-1
            % Multiply corresponding bits and accumulate
            sum = sum + double(row(i+1))*double(col(i+1)); 
        end         
        
        % Assign value based on sum (-1)^sum
        Hbasis(u+1,v+1) = (-1)^sum; 
    end 
end 

% Compare with MATLAB's built-in Hadamard function
H_ideal = hadamard(n); 

% Display both matrices for comparison
disp('Hadamard Matrix (Manual Calculation):'); 
disp(Hbasis); 
disp('Hadamard Matrix (using inbuilt function):'); 
disp(H_ideal); 

% Visualize the Hadamard basis images
figure; 
colormap(gray);  % Use grayscale colormap

% Create n×n grid of subplots to display all basis image combinations
for i = 1:n      % Row basis index
    for j = 1:n  % Column basis index
        % Calculate subplot position
        subplot(n,n, (i-1)*n + j); 
        
        % Compute outer product of basis vectors and display as image
        imagesc(reshape(Hbasis(i, :)' * Hbasis(j, :), [n, n])); 
        
        axis off;  % Turn off axes for cleaner display
    end 
end 

% Add overall title to the figure
sgtitle('Hadamard Basis Images'); 

% Optional command to force immediate display (commented out)
% drawnow;