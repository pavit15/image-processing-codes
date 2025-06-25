# Contrast Stretching

## What This Code Does

This code enhances the contrast of a grayscale image using **contrast stretching**, a piecewise linear transformation that spreads pixel intensities over a wider range.  
It divides the intensity range into three regions and applies different linear scaling factors (`alpha`, `beta`, `gamma`) to each, based on user-defined control points `r1`, `r2`, `v`, and `w`.

- Stretch low and high intensities for better visual appearance.
- Display original and stretched images.
- Plot histograms before and after enhancement.


## Explanation

**Contrast stretching** is a spatial domain image enhancement method used to improve the dynamic range of intensity levels in an image. It’s particularly useful when an image looks dull or washed out.

It applies a **piecewise linear transformation**:
- Low-intensity pixels are scaled up using `alpha`.
- Mid-range pixels are scaled using `beta`.
- High-intensity pixels are scaled using `gamma`.

*The transformation function is defined using control points:*
- `r1` and `r2`: intensity thresholds for original image  
- `v` and `w`: desired output intensity values for corresponding thresholds

This method enhances visual contrast without complex transformations and works well for basic image improvement tasks.

## Code Algorithm

1. **Read Grayscale Image**.
2. **Take User Inputs**:
   - `r1`, `r2`: intensity breakpoints in original image
   - `v`, `w`: desired output values
3. **Compute Transformation Parameters**:
   - `alpha = v / r1`
   - `beta = (w - v) / (r2 - r1)`
   - `gamma = (255 - w) / (255 - r2)`
4. **Apply Piecewise Transformation**:
   - If pixel < `r1` → use `alpha * pixel`
   - If pixel in [`r1`, `r2`) → use `beta * (pixel - r1) + v`
   - If pixel ≥ `r2` → use `gamma * (pixel - r2) + w`
5. **Clip Intensities** to keep within [0, 255].
6. **Display Results**:
   - Original and transformed images
   - Histograms of both images for comparison



## Sample Input

Image: `ivp.jpg` (grayscale)

User inputs:  
Enter r1: 20
Enter r2: 130
Enter v: 0
Enter w: 255
![input](https://github.com/pavit15/image-processing-codes/raw/main/contrast%20stretching/ivp.jpg)


## Sample Output

- Original and contrast stretched
- Histogram of original image
- Histogram of stretched image
![output](https://github.com/user-attachments/assets/0ab85999-6d2f-4f7a-869d-8afbd71fc6b4)


## Notes
- This algorithm is simple yet effective for enhancing contrast in underexposed or low contrast images.
- Unlike histogram equalization, contrast stretching maintains control over which pixel intensities are stretched.
- Useful in preprocessing images for further analysis or computer vision tasks.
