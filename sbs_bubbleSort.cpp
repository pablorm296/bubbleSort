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
NumericVector sbs_bubbleSort(NumericVector x, int j) {
  double a = x[j];
  double b = x[j+1];
  
  //if a > b, perform a swap in the array
  if (a > b) 
    {
        swap(x, j, j+1);
    }
  return x;
}


