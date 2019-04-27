#include <Rcpp.h>
using namespace Rcpp;

//Function to swap two elements in an array
void swap(NumericVector array, int a, int b)
{
  double a_foo = array[a];
  array[a] = array[b];
  array[b] = a_foo;
}

//Function to perform a bubble sort on an
// [[Rcpp::export]]
NumericVector bubbleSort(NumericVector x) {
    //Get size of vector x
    int n = x.size();
    //For every element in vector x
    for (int i = 0; i < n; i++)
    {
        //For every element in vector x (excluding the last i-1 elements)
        for (int j = 0; j < n - i -1; j++)
        {
          double a = x[j];
          double b = x[j+1];
          
          //if a > b, perform a swap in the array
          if (a > b) 
          {
            swap(x, j, j+1);
          }
        }
    }
    return x;
}

