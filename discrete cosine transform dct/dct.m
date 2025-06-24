% Get matrix order from user
N = input("Enter the order of the matrix: ");

% Initialize DCT coefficient matrix
C = zeros(N, N);

% Compute DCT basis matrix
for u = 0:N-1
    for v = 0:N-1
        % Calculate normalization factor
        if u == 0
            alpha = sqrt(1/N);
        else
            alpha = sqrt(2/N);
        end
        
        % Compute DCT coefficient
        C(u+1, v+1) = alpha * cos(((2*v + 1) * u * pi) / (2 * N));
    end
end

% Display the DCT basis matrix
disp('DCT Basis Matrix:');
disp(C);

% Create figure for basis images
figure;
colormap(gray);  % Use grayscale colormap

% Generate and display all basis images
for i = 1:N
    for j = 1:N
        % Create each basis image by outer product of basis vectors
        basis = zeros(N, N);
        for x = 1:N
            for y = 1:N
                basis(x, y) = C(i, x) * C(j, y);
            end
        end
        
        % Display basis image in subplot
        subplot(N, N, (i-1)*N + j);
        imagesc(basis);
        
        % Format the subplot
        axis equal;  % Maintain aspect ratio
        axis off;    % Turn off axes
        title(['(', num2str(i-1), ',', num2str(j-1), ')']);  % Add coordinate title
    end
end

% Add overall title to the figure
sgtitle(['DCT Basis Images of Order ', num2str(N)]);