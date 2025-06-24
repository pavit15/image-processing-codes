# Discrete Cosine Transform (DCT)

## What This Code Does

This code computes the **Discrete Cosine Transform (DCT) basis matrix** for a given order and visualizes the DCT basis images:
- Generates the DCT coefficient matrix using cosine functions.
- Constructs 2D basis images by outer product of row and column vectors from the DCT matrix.
- Displays all basis images in a grid format with appropriate labels.


## Explanation

The **Discrete Cosine Transform (DCT)** is a fundamental technique in image processing and compression (e.g., JPEG).  
It transforms an image or signal into a sum of cosine functions oscillating at different frequencies.

**Key Properties:**
- DCT focuses energy into fewer coefficients (energy compaction).
- Only cosine terms (no sine), which makes it more efficient for real signals.
- Most visual information in images is retained in a few low frequency DCT coefficients.

**Why Use DCT?**
- Reduces redundancy in images.
- Important in image compression algorithms (JPEG, MPEG).
- Separates image content into parts (low/high frequency).


## Code Algorithm

1. **Input** the order `N` of the matrix to generate an NxN DCT basis.
2. **Initialize** a zero matrix `C[N][N]` to store DCT coefficients.
3. **Calculate DCT Coefficients**:
   - Loop over each `(u, v)`:
     - If `u == 0`, use normalization factor `sqrt(1/N)`
     - Else, use `sqrt(2/N)`
     - Apply cosine formula:  
       `C[u][v] = alpha * cos(((2v + 1) * u * π) / (2N))`
4. **Print the DCT Basis Matrix**.
5. **Create Basis Images**:
   - For each pair `(i, j)`, compute outer product of `C[i, :]` and `C[j, :]`.
   - Store result in `basis[i][j]`
6. **Display Images**:
   - Plot all basis functions in an NxN grid.
   - Turn off axes and label each image with its `(i, j)` index.
   - Use grayscale colormap for clarity.

---

## Sample Input

_Enter the order of the matrix:_  
`4`  
_(You can include an input screenshot or code snippet here)_


## Sample Output

- DCT Basis Matrix of order 4  
- 16 Grayscale images representing each DCT basis function  
_(Insert the output grid of basis images here)_

## Notes
- DCT basis functions are separable and orthogonal.
- The top left image in the output corresponds to the DC component (average intensity).
- High frequency basis images have more oscillations and capture image details.
- DCT is essential in lossy compression because it allows discarding high frequency components with minimal quality loss.
