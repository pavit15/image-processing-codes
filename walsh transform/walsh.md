# Walsh Transform

## What This Code Does

This code generates the **Walsh basis functions** of a given order (must be a power of 2) and visualizes them as grayscale images.  

The Walsh Transform decomposes an image into a set of orthogonal square wave basis functions, ordered by **sequency** (number of zero crossings).

The code:
- Constructs the Walsh matrix.
- Reorders it into **sequency order**.
- Displays the Walsh basis images using outer products of basis vectors.


## Explanation

The **Walsh Transform** is a non sinusoidal orthogonal transform that uses only +1 and -1 values.  
It is particularly useful in:
- Digital image processing
- Data compression (alternative to DCT/FFT)
- Signal reconstruction

**Sequency Order**:
- Measures the number of zero crossings (sign changes) in the basis function.
- Helps arrange basis functions from low to high complexity (similar to frequency in Fourier transform).

**Key Properties**:
- Binary, fast, and simple to compute.
- Operates on square waveforms.
- More efficient in some logic-based digital hardware systems.


## Code Algorithm

1. **Input**: Get matrix order `N` (must be power of 2).
2. **Walsh Matrix Generation**:
   - Loop over rows `u` and columns `v`.
   - Convert both `u` and `v` to binary strings.
   - Multiply corresponding binary bits; use the parity (odd/even) to determine the +1 or -1 value.
3. **Sequency Ordering**:
   - Count the number of sign changes (zero crossings) in each row.
   - Reorder rows in increasing order of these counts.
4. **Display Basis Images**:
   - Use outer product of `W[i]` and `W[j]` to generate `i,j`-th Walsh basis image.
   - Display the full NxN grid of basis images with proper labels.

## Sample Input

Enter the order of the matrix (power of 2): 4

_(Insert original Walsh matrix and reordered Walsh matrix here)_


## Sample Output

- NxN grayscale images showing the full Walsh basis set.
- Ordered from low to high sequency.

_(Insert visual grid of Walsh basis images here)_

## Notes

- Walsh functions are ideal for binary hardware and fast computations.
- Sequency order is crucial for applications in compression.
- Unlike Fourier or DCT, Walsh functions do not rely on trigonometric functions.