calculate t-statistic and p-value from group means, SDs, and sample size
================
David Kaiser
2018/02/23

### Description

A function to calculate the **t-statistic** and the **p-value** from the means, standard deviations, and sample size of two groups. The sample size can be equal or not equal but two values need to be supplied. The t-statistic, the variance of the two groups and the degrees of freedom are calculated as described in [wikipedia](https://en.wikipedia.org/wiki/Student%27s_t-test#Independent_two-sample_t-test). The p-value is calculated as described in a [post by Kelly Black](http://www.cyclismo.org/tutorial/R/pValues.html#calculating-a-single-p-value-from-a-t-distribution).

### Arguments

-   *mean1* -- mean value of group 1
-   *mean2* -- mean value of group 2
-   *sd1* -- standard deviation of group 1
-   *sd2* -- standard deviation of group 2
-   *n1* -- sample size of group 1
-   *n2* -- sample size of group 2
-   *equal.variance* -- logical; are group variances assumed to be equal? defaults to FALSE

### Value

A named list in which

-   "diff" = difference between the means
-   "var" = variance of the two groups
-   "t" = t-statistic
-   "df" = degrees of freedom
-   "p" = p-value

### Example

``` r
a <- rnorm(100)
b <- rnorm(200)
t.test.mean.sd(mean(a), mean(b), sd(a), sd(b), length(a), length(b))
```

    ## $diff
    ## [1] -0.0008404071
    ## 
    ## $var
    ## [1] 0.1125538
    ## 
    ## $t
    ## [1] -0.007466716
    ## 
    ## $df
    ## [1] 182.0833
    ## 
    ## $p
    ## [1] 0.9940507

``` r
mean(a) - mean(b)
```

    ## [1] -0.0008404071

``` r
t.test(a, b)
```

    ## 
    ##  Welch Two Sample t-test
    ## 
    ## data:  a and b
    ## t = -0.0074667, df = 235.49, p-value = 0.994
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2225814  0.2209006
    ## sample estimates:
    ##   mean of x   mean of y 
    ## 0.004289820 0.005130227
