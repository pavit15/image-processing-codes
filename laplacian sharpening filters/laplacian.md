# Sharpening Filters (Laplacian and Unsharp Masking)

## What This Code Does

This code performs **image sharpening** using different **Laplacian masks** and **unsharp masking techniques**.  
It enhances the edges and details of the image by detecting areas of rapid intensity change and emphasizing them.

The implementation includes:
- Four types of Laplacian based edge enhancement
- Average and Gaussian unsharp masking
- Comparison of all sharpened outputs with the original

## Explanation

**Image sharpening** is used to enhance fine details and emphasize edges.  
It is achieved using the **second derivative** of the image, commonly implemented with **Laplacian operators**.

### Laplacian Filters:
These are 3×3 kernels with a central coefficient (positive or negative) surrounded by values that detect intensity changes. The Laplacian highlights regions with high frequency (edges).

### Unsharp Masking:
This method involves:
- **Blurring** the image (average or Gaussian)
- **Subtracting** the blurred image from the original to extract high-frequency components
- **Adding** these components back to the original to sharpen it

## Code Algorithm

1. **Read Image**: Convert to grayscale and scale for computation
2. **Laplacian Masks**:
   - Define 4 different Laplacian filters
   - Apply each mask using 2D convolution (`conv2`)
   - Add or subtract results from original to sharpen
3. **Unsharp Masking**:
   - Apply average filter (3×3) for basic blur
   - Subtract blurred image from original and enhance
   - Repeat with Gaussian blur (sigma=1) for weighted blur
4. **Display Results**:
   - Original image
   - Images sharpened by each mask
   - Output from unsharp masking (avg and Gaussian)

## Sample Input
Image: `ted.jpg` (any standard color or grayscale image)

## Sample Output

- **Original Image**
- **Sharpened with Laplacian Mask 1** (center 4)
- **Sharpened with Laplacian Mask 2** (center 8)
- **Sharpened with Laplacian Mask 3** (center -4)
- **Sharpened with Laplacian Mask 4** (center -8)
- **Unsharp Masked Image using Average Blur**
- **Unsharp Masked Image using Gaussian Blur**
![image](https://github.com/user-attachments/assets/8f41c4ad-b7d7-45d9-bcee-cfc1100c28bc)

## Notes

- Laplacian filters highlight fine details but can amplify noise.
- Unsharp masking works well for smooth sharpening without edge artifacts.
- Gaussian based methods offer more natural enhancement due to weighted smoothing.
