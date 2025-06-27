# Hadamard Transform

## What This Code Does

This code generates the **Hadamard basis functions** for a square matrix of order `N` (power of 2) and visualizes them using grayscale images.

The code:
- Constructs the **Hadamard matrix** using Sylvester's recursive construction.
- Computes outer products to generate 2D Hadamard basis images.
- Displays them in a grid with labels for each `(i, j)` index.

## Explaination

The **Hadamard Transform** is an orthogonal transform that uses only +1 and -1 values.  
It’s widely used for:
- Signal processing
- Image compression (especially in JPEG variant)
- Pattern recognition

**Sylvester's Construction** (Recursive):
- Start with `H₁ = [1]`
- Recursively define:
H₂N = [ Hₙ Hₙ
  Hₙ -Hₙ ]

**Key Features**:
- All values are +1 or -1.
- Easier to implement digitally than sinusoidal transforms.
- Orthogonal and invertible.

## Code Algorithm

1. **Input**: Matrix order `N` (must be power of 2).
2. **Build Hadamard Matrix**:
 - Use recursive block construction.
3. **Display Basis Images**:
 - For each pair `(i, j)`, compute `outer(H[i], H[j])`
 - Display each as a grayscale image in an NxN grid.
 - Use `imshow` with `cmap='gray'`.

## Sample Input

Enter the order of the matrix (power of 2): 4

## Sample Output

- NxN Hadamard basis function images as a grid.
- Images represent distinct binary orthogonal patterns.
![image](https://github.com/user-attachments/assets/46e48aff-8c42-4755-b917-dec359ca7d21)

## Notes
- Hadamard matrices form a complete orthogonal set.
- Useful for data compression and optical image processing.
- Much faster than sinusoidal transforms in digital logic circuits.
