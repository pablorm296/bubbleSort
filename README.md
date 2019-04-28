# bubbleSort

Script to create a Bubble Sort visualization in R with ggplot2.

## Content

1. `main.R` a R script that generates a vector of _n_ random values, and applies a Bubble Sort Algorithm on it, while generating 
frames with ggplot2 at each step. This script uses `Rcpp` to compile `bubbleSort.cpp` and `sbs_bubbleSort.cpp` (see below), which contain C++ functions to perform the Bubble Sort.
2. `bubbleSort.cpp` a C++ source file with a function that performs a bubble sort on a R numeric vector.
3. `sbs_bubbleSort.cpp` a C++ source file with a function that compares two numbers (_a_, _b_), and swaps them if _a_ is greater
than _b_.
