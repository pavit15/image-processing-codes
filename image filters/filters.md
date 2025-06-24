# Average, Weighted Average, and Median Filters

## What This Code Does

This experiment implements three popular **image smoothing techniques**:
- **Average filter** – smooths by replacing a pixel with the mean of its neighborhood.
- **Weighted average filter** – gives more importance to center pixels.
- **Median filter** – replaces a pixel with the median value, effective against salt-and-pepper noise.


## Theory / Function Explanation

### 1. **Average Filter**  
Replaces each pixel with the **mean** of its surrounding pixels. It smooths the image but may blur edges.

### 2. **Weighted Average Filter**  
Applies **higher weights to the central pixels** in a 3×3 region, preserving more details while reducing noise.

### 3. **Median Filter**  
Replaces each pixel with the **median** of its neighborhood. Very effective for removing **salt-and-pepper noise** without blurring edges.

---

## Code Algorithm

1. **Read image** and convert to grayscale (if required).
2. Add **salt-and-pepper noise** to simulate a noisy image.
3. Define a **3×3 filter size** and pad the image to avoid boundary issues.
4. Create **blank matrices** for storing filtered results.
5. For each pixel:
   - Extract the 3×3 neighborhood.
   - Compute and store:
     - Mean (Average)
     - Weighted average
     - Median
6. Convert filtered outputs to uint8 for display.
7. Compare results with **built-in functions**:
   - `conv2` for average/weighted filters
   - `medfilt2` (MATLAB) 
8. Plot all results in a 2×3 subplot layout.


## Sample Input

Image: `ivp2.png` with added salt-and-pepper noise (2%)
--

## Sample Output

- **Original Noisy Image**
- **Average Filter – Manual**
- **Weighted Avg Filter – Manual**
- **Median Filter – Manual**
- **Average Filter – Built-in**
- **Weighted Avg Filter – Built-in**
- **Median Filter – Built-in**

_*(Insert 2x3 subplot grid of output images + original image separately)*_

---

## Notes

- **Median filter** preserves edges while removing noise.
- **Weighted average filter** is a good compromise between detail preservation and smoothing.
- **Manual implementations** are useful for understanding core concepts before relying on library functions.
