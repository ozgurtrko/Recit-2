library(palmerpenguins)
library(dplyr)
head(penguins)

## mean of only bill length and bill depth according to the species.
penguins %>% aggregate(cbind(bill_length_mm, bill_depth_mm) ~ species,.,mean)

## For the ones with bill_length_mm > 40, 
## find the mean of bill depth and body mass of each species, using aggregate function.
penguins %>% 
  subset(bill_length_mm > 40) %>% 
  aggregate(cbind(bill_depth_mm, body_mass_g) ~ species, ., mean)



## Using the same penguins data set, select bill length and species 
## and print the first 10 rows of the data frame.

penguins %>% 
  select(c(bill_length_mm, species)) %>% 
  head(.,10)

## Select bill length, bill depth and body mass shortly. Print the first 10 rows of the data frame.
penguins %>% 
  select(starts_with("b")) %>% 
  head(.,10)


# Select all the quantitative variables and print the first 10 rows of the data frame.

penguins %>% 
  select_if(is.numeric) %>% 
  head(.,10)

# Filter that species of Gentoo whose body mass index ranges between 4900 and 5400.

penguins %>% 
  filter(between(body_mass_g, 4900, 5400), species == "Gentoo")

# What is the mean of the bill length for each species?

penguins %>% 
  aggregate(bill_length_mm ~ species,., mean)

# Using mutate() function create a new column called Proportion, which is the ratio of bill length to bill depth. 
# After that create another new column called Type, 
# if proportion is less than 1.9 then called Type as A, else called Type as B.

new_penguins <- penguins %>% 
  mutate(Proportion = bill_length_mm / bill_depth_mm) %>% 
  mutate(Type = ifelse(Proportion < 1.9 , "A", "B"))

# Count that how many observations are assigned Type B for each species?

new_penguins %>% 
  group_by(species) %>% 
  filter(Type == "B") %>% 
  count()

# Create a relationship between bill depth and body mass and plot with the appropriate visualization techniques. 
# Then split them based on species.

library(magrittr)

penguins %>% select(bill_depth_mm, body_mass_g) %T>% 
  plot(., xlab = "Bill Depth", ylab = "Body Mass", main = "Relationship between bill depth and body mass")


































