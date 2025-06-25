# Discrete Fourier Transform

## What This Code Does

This code performs the **2D Discrete Fourier Transform (DFT)** on a grayscale image to convert it from the spatial domain to the frequency domain.  
It does the following:
- Computes the **magnitude** and **phase** spectra manually using DFT equations.
- Compares results with built-in **FFT** functions.
- Visualizes the frequency components present in the image.

## Explaination

**Discrete Fourier Transform (DFT)** is used to analyze the frequency content of signals or images.  
It transforms pixel intensity data into its constituent sine and cosine frequency components.

- **Magnitude Spectrum**: Indicates the strength of each frequency.
- **Phase Spectrum**: Represents the alignment or position of frequencies.
- **FFT (Fast Fourier Transform)**: An optimized version of DFT, reducing time complexity from O(N²) to O(N log N).

**Use Cases:**
- Frequency-based filtering (e.g., low pass, high pass)
- Image compression (e.g., JPEG)
- Pattern recognition & feature extraction


## Code Algorithm

1. **Read Input Image** and convert to grayscale.
2. **Initialize an empty output matrix** of same size for frequency values.
3. **Apply DFT formula manually**:
   - For each output coordinate `(u, v)`:
     - Initialize sum to 0.
     - Loop over all input pixels `(x, y)` and apply:  
       `sum += image[x][y] * exp(-j*2π(ux/M + vy/N))`
     - Store computed sum in output matrix.
4. **Compute Magnitude and Phase** from output:
   - Magnitude = `log(abs(output) + 1)`
   - Phase = `angle(output)`
5. **Apply FFT (built-in)**:
   - Use `fft2()` in MATLAB or `np.fft.fft2()` in Python.
   - Compute and plot magnitude and phase of FFT output.
6. **Display** all four plots:
   - Manual DFT: Magnitude & Phase
   - FFT: Magnitude & Phase

## Sample Output

- Manual DFT Magnitude Spectrum
- Manual DFT Phase Spectrum
- FFT Magnitude Spectrum
- FFT Phase Spectrum
![image](https://github.com/user-attachments/assets/b74ee511-70d8-4ea5-a5b2-198aa20bd980)

## Notes

- Manual DFT is useful for educational understanding but is computationally slow.
- FFT should be used for practical, real world applications.
- Phase information is crucial for image reconstruction and magnitude alone is not enough.
