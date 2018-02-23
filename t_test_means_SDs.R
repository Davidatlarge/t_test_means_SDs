# t-test from mean and SD of the two groups
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
  # p-value
  p.value <- 2*pt(-abs(t),df)
  
  return(setNames(list(diff, sp, t, df, p.value), 
                  c("diff", "var", "t", "df", "p")))
}
