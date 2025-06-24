% Input the order of the matrix (must be a power of 2)
N = input("Enter the order of the matrix (power of 2): ");
W = zeros(N, N);
x = log2(N);

% Generate Walsh matrix
for u = 0:N-1
    for v = 0:N-1
        row = double(dec2bin(u, x));  % Binary representation of row index
        col = double(dec2bin(v, x));  % Binary representation of column index
        prod = 1;
        for i = 1:x
            % Compute product term for Walsh matrix
            prod = prod * (-1)^(row(i) * col(x - i + 1));
        end
        W(u+1, v+1) = prod;
    end
end

% Count sign changes per row (sequency calculation)
counts = zeros(N, 1);
for i = 1:N
    sign = 0;
    for j = 2:N
        if W(i, j) ~= W(i, j-1)
            sign = sign + 1;
        end
    end
    counts(i) = sign;
end

% Sort Walsh matrix by sequency
[~, sorted] = sort(counts);
Wsorted = W(sorted, :);

% Generate basis images
basis = zeros(N, N, N, N);
for u = 1:N
    for v = 1:N
        basis(:, :, u, v) = Wsorted(:, u) * Wsorted(:, v).';
    end
end

% Display results
disp('Walsh Matrix (Original):');
disp(W);
disp('Sequency Counts:');
disp(counts);
disp('Walsh Matrix (Sorted by Sequency):');
disp(Wsorted);

% Plot basis images
figure;
colormap(gray);
for u = 1:N
    for v = 1:N
        subplot(N, N, (u-1)*N + v);
        imagesc(basis(:, :, u, v));
        axis off;
        title(sprintf('(%d, %d)', u-1, v-1));
    end
end