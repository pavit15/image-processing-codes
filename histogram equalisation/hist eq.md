# Histogram Equalization

## What This Code Does

This code enhances the **contrast** of a grayscale image using **histogram equalization**.  
It redistributes the pixel intensity values such that the histogram becomes more uniform, improving visual clarity—especially in images with low contrast.

The implementation includes:
- **Manual histogram equalization**
- **Built in `histeq()` function** for comparison 

## Explaination

**Histogram Equalization** is a contrast enhancement technique in spatial domain processing.  
It works by:
- Computing the histogram of pixel intensities
- Calculating the **Cumulative Distribution Function (CDF)**
- Using the CDF to map old intensity values to new ones that are spread across the full range `[0, 255]`

This process:
- Increases image detail in dark or bright regions
- Makes the histogram of the image more **uniform**
- Is widely used in photography, medical imaging, and preprocessing steps in computer vision

## Code Algorithm

1. **Read Image**: Load the image and convert to grayscale if needed.
2. **Image Size & Format**:
   - Ensure image is in `uint8`
   - Set intensity levels `L = 256`
3. **Histogram Computation**:
   - Calculate histogram of grayscale image
   - Normalize to get **PDF**
4. **Cumulative Distribution**:
   - Compute **CDF** from PDF
   - Normalize CDF to `[0, 255]` range using rounding
5. **Mapping**:
   - Use CDF to transform each pixel’s intensity
   - Construct the equalized image
6. **Built-in Equalization**:
   - Use MATLAB’s `histeq()` or Python’s `exposure.equalize_hist()`
7. **Visualization**:
   - Display original, equalized, and built-in equalized images
   - Shows histograms of all three for comparison

## Sample Input

Image: `ivp.jpg` (grayscale or RGB)

## Sample Output

- **Original Image** and its Histogram  
- **Manually Equalized Image** and Histogram  
- **Image via `histeq()` or `equalize_hist()`** and Histogram  
![image](https://github.com/user-attachments/assets/f5ef45ff-b6f9-4a91-b860-38519cf7c640)

## Notes

- Histogram equalization improves overall image contrast without manual thresholding.
- The CDF-based mapping ensures that frequently occurring pixel values are spread over a broader range.
- Built in functions (`histeq`, `exposure.equalize_hist`) are optimized but understanding the manual process is key to mastering image enhancement.
