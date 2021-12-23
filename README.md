## Project title: US saving investment scenarios
This project is about creating a shiny app to visualize 3 different investment scenarios

 - High Yield Savings Account
 - U.S. Fixed Income Index Fund (U.S. Bonds)
 - U.S. Equity Index Fund (U.S. Stocks)

***High Yield Savings Account*** is the first type of investment scenario which earn you a higher interest rate for deposits than a traditional savings account. When it comes to savings, a higher interest rate can better return on your money. 

 - Average annual return: μ = 2%
 - Volatility (standard deviation): σ = 0.1%

***U.S. Fixed Income Index Fund (U.S. Bonds)*** is the second type of investment scenario that is a government bond that offers a fixed rate of interest over a fixed period of time. they offer oppertunity to obtain current income at a reasonable amount of risk.

 - Average annual return: μ = 5%
 - Volatility (standard deviation): σ = 4.5%
 
***U.S. Equity Index Fund (U.S. Stocks)*** is the last type of investment for this workout, which is funds formed by stocks of American companies across different industries.

 - Average annual return: μ = 10%
 - Volatility (standard deviation): σ = 15%
 
## What my code do
I have created 3 functions from for these investment scenario, I use for loop to sum up the annual value based on how many **year** you want to put (up to 50). my functions has follow input:

 - initial investment
 - Average annual return
 - Volatility
 - growth rate
 - Annual Contribution
 - year
 
After doing so, the output should return an vector of annual value for each years, I then make data frame and plot them into ggplot, finally, I can visualize the graph.


 
## Next, put my code into my shiny app
For the shiny app, I have 12 inputs:

 - 10 sliders input about initial investment, annual return and their volatitlity
 - 1 numeric input for setting seed for a random number generator
 - 1 fact option, whether you want to see these line together or seperate them out
 
After doing so, put them into my server function, and I got the graph
 
## packages 
I use these following packages to finish my plot 
 
 - library(shiny)
 - library(ggplot2)
 - library(tidyr)
