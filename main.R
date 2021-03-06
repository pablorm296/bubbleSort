library(Rcpp)
library(ggplot2)
library(extrafont)

#There are two C++ source files.
#bubbleSort.cpp performs a generic Bubble Sort on an array 'x'.
#sbs_bubbleSort.cpp compares two numbers a and b and swaps them if b a is grater than b

#Source C++ files
sourceCpp("bubbleSort.cpp")
sourceCpp("sbs_bubbleSort.cpp")

#Set size of a vector of random values
n <- 100

#Gen a vector of random values (from 1 to n)
x <- data.frame(x = runif(n, 1, n), position = 1:n)

#Sort values in x
bubbleSort(x$x)

#Create a custom ggplot theme
my_theme <- theme(legend.position = "none",
                  text = element_text(family = "Raleway"),
                  plot.title = element_text(size = 22),
                  plot.subtitle = element_text(size = 16),
                  axis.line = element_blank(),
                  axis.text = element_blank(),
                  axis.ticks = element_blank(),
                  axis.title = element_blank(),
                  panel.grid = element_blank())

#Sort values in x, and, in each comp and swap, gen a frame with ggplot2
#WARNING: This can be very memory hungry (R garbabe collection is not very good)
# so, keep a low n

#Keep track of frame number and comparisons
frame_count = 0
op_count = 0

#Iterate over vector x
for (i in 1:(n-1) ) {
  #Iterate over vector x (excluding the last i-1 elements)
  for (j in 1: (n - i) ) {
    #Create a logi vector of lenght n
    foo_selected <- rep(FALSE, n)
    #Set to True the elements in vector that are being compared
    foo_selected[j] <- TRUE
    foo_selected[j+1] <- TRUE
    #Create frame
    foo_plot <- ggplot(data = x, aes(position, x, fill = foo_selected, colour = foo_selected) ) + 
      geom_bar(stat = "identity", alpha = 0.5) + 
      ggtitle("Bubble Sort", subtitle = paste("N = ", n, ", i = ", op_count, sep = "")) +
      theme_minimal() + my_theme
    #Save frame
    ggsave(paste("frames/", frame_count, ".jpg", sep = ""), foo_plot, device = "jpeg")
    #Frame + 1
    frame_count = frame_count + 1
    #Compare and swap
    x$x <- sbs_bubbleSort(x$x, j-1)
    #Create frame
    foo_plot <- ggplot(data = x, aes(position, x, fill = foo_selected, colour = foo_selected) ) + 
      geom_bar(stat = "identity", alpha = 0.5) + 
      ggtitle("Bubble Sort", subtitle = paste("N = ", n, ", i = ", op_count, sep = "")) +
      theme_minimal() + my_theme
    #Save frame
    ggsave(paste("frames/", frame_count, ".jpg", sep = ""), foo_plot, device = "jpeg")
    #Frane abd i + 1
    frame_count = frame_count + 1
    op_count = op_count + 1
  }
}

