# Image Convolution

## What This Code Does

This code performs **2D convolution** of two matrices:
- `x` → input image matrix  
- `h` → kernel/filter matrix

The result is a convolved matrix which shows how the filter modifies the image. It is implemented manually without using built in `conv2()` function of MATLAB.


## Explanation

**Convolution** is a core operation in image processing where a filter (kernel) is applied to an image. At each position, overlapping values of the image and kernel are multiplied and summed to generate a new pixel value in the output.

It is used for:
- Blurring & smoothing
- Sharpening
- Edge detection
- Feature extraction in CNNs (Deep Learning)

**Key Concepts:**
- Matrix flipping is not done (correlation like implementation).
- Padding is handled implicitly by expanding output size:  
  `output size = input size+kernel size-1`


## Code Algorithm

1. **Input Dimensions**: Read dimensions of matrix `x` and `h`.
2. **Matrix Input**: Fill `x` and `h` using user input.
3. **Output Size**:

    totrows = xrows + hrows - 1

    totcols = xcols + hcols - 1

4. **Convolution Loop**:
- For every `(i,j)` in output:
  - Initialize `sum = 0`
  - For every `(m,n)` in `x`:
    - Check if corresponding index in `h` is valid
    - If valid: `sum += x[m][n] * h[i - m + 1][j - n + 1]`
  - Store `sum` in `output[i][j]`
5. **Print Output**


## Sample Input

*(Insert sample input image here, e.g., 3x3 matrix for `x` and 1x3 matrix for `h`)*


## Sample Output

*(Insert result of convolution as image of matrix)*


## Notes
- Output size increases based on kernel size (no cropping or padding used).
- This manual convolution helps in understanding how image filters work at the pixel level.