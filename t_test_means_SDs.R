# t-test from mean and SD of the two groups
# see https://en.wikipedia.org/wiki/Student%27s_t-test#Independent_two-sample_t-test
# see https://stats.stackexchange.com/questions/30394/how-to-perform-two-sample-t-tests-in-r-by-inputting-sample-statistics-rather-tha
t.test.mean.sd <- function(mean1,
                           mean2,
                           sd1,
                           sd2,
                           n1,
                           n2,
                           equal.variance = FALSE)
  {
  if(equal.variance){
    # pooled group variance
    sp <- sqrt( ((n1-1)*sd1^2 + (n2-1)*sd2^2) / (n1+n2-2) )
    #  t statistic to test whether the means are different
    t <- (mean1 - mean2) / (sp*sqrt((1/n1)+(1/n2)))    
    # degrees of freedom
    df <- n1+n2-2
  } else {
    # in this case sp^2 is not a pooled variance
    sp <- sqrt( (sd1^2/n1)+(sd2^2/n2) )
    #  t statistic to test whether the population means are different:
    t <- (mean1 - mean2) / sp
    # Welch–Satterthwaite equation for degrees of freedom:
    df <- ((sd1^2/n1)+(sd2^2/n2))^2 / ( ((sd1/n1)^2/(n1-1)) + ((sd2^2/n2)^2/(n2-1)) )
  }
  diff <- mean1 - mean2
  # p-value, see http://www.cyclismo.org/tutorial/R/pValues.html#calculating-a-single-p-value-from-a-t-distribution
  p.value <- 2*pt(-abs(t),df)
  
  return(setNames(list(diff, sp, t, df, p.value), 
                  c("diff", "var", "t", "df", "p")))
}

# test
a <- rnorm(100)
b <- rnorm(200)
t.test.mean.sd(mean(a), mean(b), sd(a), sd(b), length(a), length(b))
mean(a) - mean(b)
t.test(a, b)
