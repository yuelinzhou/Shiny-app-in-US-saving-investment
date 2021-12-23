# ===================================================================
# Title: Workout2
# Description: Make a shiny app that calculates 3 different timelines
# of High Yield Savings Account,U.S. Fixed Income Index Fund (U.S. Bonds)
# and U.S. Equity Index Fund (U.S. Stocks). 
# Input(s): 10 Sliders,1 Numeric input,1 Select input
# Output(s): ggplot facet by 3 timelines or stick together in 1 graph
# Author: yuelinzhou
# Date: 11-11-2019
# ===================================================================
library(shiny)
library(ggplot2)
library(tidyr)
source('~/stat133/workouts/workout2/function.R')

ui <- fluidPage(
    titlePanel("United States saving investments scenarios"),
    # I use splitlayout to fill these input by row
    splitLayout(       
sliderInput(inputId = "init", "Initial Amount",
            min = 0,max = 10000,value = 1000,pre = "$", sep = ",", step = 100),
sliderInput(inputId = "hiyi_ar", "High Yield annual rate (in %)",
            min = 0,max = 20,value = 2, step = 0.1),
sliderInput(inputId = "hiyi_vol", "High Yield volatility (in %)",
            min = 0,max = 20,value = 0.1, step = 0.1),
sliderInput(inputId = "year", "Years",
            min = 0,max = 50,value = 20, step = 1)
    ),
    
    splitLayout(
sliderInput(inputId = "ann_c", "Annual Contribution:", 
            min = 0,max = 5000,value = 200,pre = "$", sep = ",", step = 100),
sliderInput(inputId = "fix_ar", "Fixed Income annual rate (in %)",
            min = 0,max = 20,value = 5, step = 0.1),
sliderInput(inputId = "fix_vol", "Fixed Income volatility (in %)",
            min = 0,max = 20,value = 4.5, step = 0.1),
numericInput(inputId = "num","Random seed",value = 12345)

    ),
    
    splitLayout(       
sliderInput(inputId = "ann_gr", "Annual Growth Rate (in %)", 
            min = 0,max = 20,value = 2, step = 0.1),
sliderInput(inputId = "us_er", "US Equity Rate",
            min = 0,max = 20,value = 10, step = 0.1),
sliderInput(inputId = "us_vol", "US Equity volatility (in %)",
            min = 0,max = 20,value = 15, step = 0.1),
selectInput(inputId = "facet","Facet?",choices = list("Yes" = TRUE,"No" = FALSE))
    ), 
hr(),
        mainPanel(
           plotOutput("Plot")
        )
)


server <- function(input, output) {
    
    output$Plot <- renderPlot({
        # High Yield Savings Account
        rate_high <- input$hiyi_ar/100
        vol_high <- input$hiyi_vol/100 
        # U.S. Bonds
        rate_bonds <- input$fix_ar/100
        vol_bonds <- input$fix_vol/100
        # U.S. Stocks
        rate_stocks <- input$us_er/100
        vol_stocks <- input$us_vol/100
      
       # plug in value in my functions to return an vectors
        high_yi(input$init,rate_high,vol_high,input$ann_gr/100,
                input$ann_c,input$year,input$num)
        us_bonds(input$init,rate_bonds,vol_bonds,input$ann_gr/100,
                 input$ann_c,input$year)
        us_stocks(input$init,rate_stocks,vol_stocks,input$ann_gr/100,
                  input$ann_c,input$year)
        
        # turn these vectors into dataframe for making ggplot
        data <- data.frame(year = c(1:(input$year+1)),
           High_yield = high_yi(input$init,rate_high,vol_high,input$ann_gr/100,
                                input$ann_c,input$year,input$num),
           US_bonds = us_bonds(input$init,rate_bonds,vol_bonds,input$ann_gr/100,
                               input$ann_c,input$year),
           US_stocks =us_stocks(input$init,rate_stocks,vol_stocks,input$ann_gr/100,
                                input$ann_c,input$year))
      
        # I use tidyr to change my data, because "data" is hard to facet in this case
         data2 <- gather(data[,2:4]) # first column is years from (0 : input$year)
                                     # so I only need the column from 2-4 
         
         # if statment for facet or not facet
         if (input$facet == TRUE){
           ggplot(data2, aes(x=rep(0:input$year,3),
                             y = value,group = key,color = key)) + 
             geom_line() + 
             geom_point() + 
             facet_wrap(~key) + 
             geom_area(aes(fill = key),alpha = 0.5,show.legend = FALSE) +
             labs(title ="Three indices", x = "year", 
                  y = "amount",color = "index",tag = "Timeline")
           
         }else {
         ggplot(data2, aes(x=rep(0:input$year,3),
                           y = value,group = key,color = key)) + 
           geom_line() + 
           geom_point() + 
          labs(title ="Three indices", x = "year", 
               y = "amount",color = "index",tag = "Timeline")
         }
    })
}

shinyApp(ui = ui, server = server)
