library(tidyverse)
library(magrittr)
library(dplyr)
library(data.table)

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


## Q3
# sample_space[, probability := 1/36]

probability <- rep(1/36, nrow(sample_space))
probability
# calculate probability of those 36 value 
sample_space <- cbind(sample_space, probability = probability)
sample_space
# add probability as a new column using to sample_space 


## Q4 
sample_space <- sample_space %>% mutate(sum_outcomes = die_1 + die_2)
sample_space[, -5]
sample_space
# mutate function to add new variable sum of two outcomes  


## Q5
sample_space %>% filter(die_1 == 3) %>% filter(sum_outcomes >= 7) %>% nrow()/ nrow(sample_space)
# [1] 0.08333333


## Q6 
sample_space %>% filter(sum_outcomes >= 4 & sum_outcomes <= 9) %>% nrow()/nrow(sample_space)
# [1] 0.75


## Q7
sample_space %>%
  group_by(sum_outcomes) %>%
  summarise(probability = sum(probability)) %>%
  arrange(desc(probability)) %>%
  head(1)


## Q8

            
            




