# ===================================================================
# Title: test plot
# Description: this file is just to test my code from other files 
# and use source() to test my data with numeric number in genreal
# this file will not involve in app.r
# Input(s): N/A
# Output(s): N/A
# Author: yuelinzhou
# Date: 11-11-2019
# ===================================================================
library(ggplot2)
library(tidyr)
source('~/stat133/workouts/workout2/variable.R')
source('~/stat133/workouts/workout2/function.R')

# test my function with numbers
high_yi(1000,rate_high,vol_high,0.03,200,10,set_seed)
us_bonds(1000,rate_bonds,vol_bonds,0.03,200,10)
us_stocks(1000,rate_stocks,vol_stocks,0.03,200,10)

# turn these vectors into dataframe for ploting
data <- data.frame(year = c(1:11),
                   High_yield = high_yi(1000,rate_high,vol_high,0.03,200,10,set_seed),
                   US_bonds = us_bonds(1000,rate_bonds,vol_bonds,0.03,200,10),
                   US_stocks = us_stocks(1000,rate_stocks,vol_stocks,0.03,200,10))

# use tidyr to gather my data because it's hard to facet "data" in this case
data2 <- gather(data[,2:4]) # my first column is just number from 0:year, therefore
                            # I only need column 2-4

# this is plot is without facet 
ggplot(data2, aes(x=rep(0:10,3),
                  y = value,group = key,color = key)) + 
  geom_line() + 
  geom_point() + 
  labs(title ="Three indices", x = "year", 
       y = "amount",color = "index",tag = "Timeline")

# this plot is with facet
ggplot(data2, aes(x=rep(0:10,3),
                  y = value,group = key,color = key)) + 
  geom_line() + 
  geom_point() + 
  facet_wrap(~key) + 
  geom_area(aes(fill = key),alpha = 0.5,show.legend = FALSE) +
  labs(title ="Three indices", x = "year", 
       y = "amount",color = "index",tag = "Timeline")






