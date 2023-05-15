library(tidyverse)

### Assignment 1 ###

## 2 Dice ##

## Q1 
outcome <- c(1:6)
outcome
# a die consist of 6 numbers so possible outcome for a die can be 1 to 6
N <- 6
vec_1 <- sample(outcome, N, replace = F)
vec_1
vec_2 <- sample(outcome, N, replace = F)
vec_2
# each vector represent a die throw at N time and same number can occur multiple times 


## Q2 
sample_space <- expand_grid(die_1 = vec_1, die_2 = vec_2,)
sample_space 






