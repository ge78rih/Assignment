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
  group_by(sum_outcomes) %>% # first group outcomes data 
  summarise(probability = sum(probability)) %>% #calculate total peobabilty of each sum
  arrange(desc(probability)) %>% # ordered them
  head(1) # show the most probable value 


## Q8
probabilities <- c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1)
num_delays <- c(0:10)
prob_distributions <- data.frame(Probability = probabilities)
for (p in probabilities) {
  prob_distribution <- dbinom(num_delays, size = 10, prob = p)
  prob_distributions <- cbind(prob_distributions, prob_distribution)
}



## Q9
sim_rides <- function(N, p) {
  sample(c("L", "O"), size = N, replace = TRUE, prob = c(p, 1 - p))
}

set.seed(1237)
obs <- sim_rides(10, 0.3)

likelihoods <- sapply(probabilities, function(p) {
  num_delays_observed <- sum(obs == "L")
  likelihood <- dbinom(num_delays_observed, size = 10, prob = p)
  return(likelihood)
})



## Q10
prior <- c(0.000, 0.004, 0.041, 0.123, 0.209, 0.246, 0.209, 0.123, 0.041, 0.004, 0.000)

posterior <- likelihoods * prior / sum(likelihoods * prior)





            
            




