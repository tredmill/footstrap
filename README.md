## `footstrap` package
 
*`footstrap` is a silly attempt to illustrate the steps behind build an `R` package.* 
 
### Installation
 
You can install it by running `devtools::install_github("mihaiconstantin/footstrap")`.
 
### Basic usage
 
Basic usage
```r
library(footstrap)
library(datasets)
head(cars)
 
test <- get.bootstrap(data = cars, statistic = get.lm, replicates = 1e4, 
                      formula = speed ~ dist)
summary(test)
plot(test)
```