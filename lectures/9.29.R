#script out a t-test
#t test method in R called t.test
t.test2 <- function(x, mu) {
  x.bar  <- mean(x, na.rm =TRUE)
  s      <- sd(x)
  n      <- length(x)
  t.stat <- (x.bar-mu)/(s/sqrt(n))
  p.val <- pt(t.stat, n-1)
  return(p.val)
}

#if else statements
sign2 <- function(x) {
  if(x>0) {
    message <- "Your number is positive!"
  } else if (x == 0) {
    message <- "Your number is zero!"
  } else {
    message <- "Your number is negative!"
  }
  return(message) 
}


#make a function for median function
median2 <- function(x) {
  x <- sort(x, decreasing = FALSE) 
  mid <- (length(x) + 1)/2
  if (mid %% 1 == 0) {
    return (x[mid])
  } else {
    return (mean(c(x[mid-.5],x[mid+.5])))
  }
}



