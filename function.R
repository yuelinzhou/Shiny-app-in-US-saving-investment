# ===================================================================
# Title: functions
# Description: this file is to make the functions for each investment and make
# some roxygen comments on each functions. And finally will be use for app.r
# Input(s): N/A
# Output(s): N/A
# Author: yuelinzhou
# Date: 11-11-2019
# ===================================================================

# High Yield Savings Account
#' @title High Yield Savings Account vectors
#' @description: calculates the annual return value based on years
#' @param init initial amount
#' @param normal A normal distrubution value based on high yield saving acc
#' @param growth Annual Growth Rate
#' @param contr Annual Contribution
#' @param year Time period
#' @return high_vec, an vector that based on those input arguments
high_yi <- function(init,rate,vol,growth,contr,year,seed){
set.seed(seed)
  high_vec <- numeric(length = length(year))
  amt = init
  for(i in 0:year){
    
    if (i==0){
      high_vec[i+1] = amt
    }
    else {
      amt = amt*(1+rnorm(1,rate,vol))+contr*(1+growth)^(i-1)
      high_vec[i+1] = amt
    }
    
  }
  return(high_vec)  
}

# U.S. Bonds
#' @title US bonds vectors
#' @description: calculates the annual return value based on years
#' @param init initial amount
#' @param normal A normal distrubution value based on US bonds
#' @param growth Annual Growth Rate
#' @param contr Annual Contribution
#' @param year Time period
#' @return bonds_vec, an vector that based on those input arguments
us_bonds <- function(init,rate,vol,growth,contr,year){
  bonds_vec <- numeric(length = length(year))
  amt = init
  for(i in 0:year){
    
    if (i==0){
      bonds_vec[i+1] = amt
    }
    else {
    amt = amt*(1+rnorm(1,rate,vol))+contr*(1+growth)^(i-1)
    bonds_vec[i+1] = amt
}
       
  }
  return(bonds_vec)  
}


# U.S. Stocks
#' @title US stock vectors
#' @description: calculates the annual return value based on years
#' @param init initial amount
#' @param normal A normal distrubution value based on US stocks
#' @param growth Annual Growth Rate
#' @param contr Annual Contribution
#' @param year Time period
#' @return stocks_vec, an vector that based on those input arguments

us_stocks <- function(init,rate,vol,growth,contr,year){
  stocks_vec <- numeric(length = length(year))
  amt = init
  for(i in 0:year){
    
    if (i==0){
      stocks_vec[i+1] = amt
    }
    else {
      amt = amt*(1+rnorm(1,rate,vol))+contr*(1+growth)^(i-1)
      stocks_vec[i+1] = amt
    }
    
  }
  return(stocks_vec)  
}





