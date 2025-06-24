% Get dimensions of matrix x
disp('Dimensions of x'); 
xrows = input('Number of rows: '); 
xcols = input('Number of columns: '); 

% Initialize and input elements of matrix x
disp('Elements of matrix x:'); 
x = zeros(xrows, xcols); 
for i = 1:xrows 
    for j = 1:xcols 
        x(i, j) = input(''); 
    end 
end 

% Get dimensions of matrix h
disp('Dimensions of h'); 
hrows = input('Number of rows: '); 
hcols = input('Number of columns: '); 

% Initialize and input elements of matrix h
disp('Enter the elements of matrix h:'); 
h = zeros(hrows, hcols); 
for i = 1:hrows 
    for j = 1:hcols 
        h(i, j) = input(''); 
    end 
end 

% Calculate output matrix dimensions (result of convolution)
totrows = xrows + hrows - 1; 
totcols = xcols + hcols - 1; 

% Initialize output matrix
output = zeros(totrows, totcols); 

% Perform 2D convolution
for i = 1:totrows 
    for j = 1:totcols 
        sum = 0; 
        % Iterate through all possible overlapping elements
        for m = 1:xrows 
            for n = 1:xcols 
                rowi = i - m + 1; 
                coli = j - n + 1; 
                % Check if current indices are within h matrix bounds
                if (rowi > 0) && (rowi<= hrows) && (coli > 0) && (coli<= hcols) 
                    sum = sum + x(m,n) * h(rowi, coli); 
                end 
            end 
        end 
        output(i, j) = sum; 
    end 
end 

% Display the convolution result
disp('Answer:'); 
disp(output); 