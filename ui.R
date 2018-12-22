#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

data <- read.csv("EU_pop.csv", sep=";")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("European Union Population Analysis"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        selectInput("country", "Select a country: ", choices = c("All", "Germany","U.K.","France","Italy",
                                                                 "Spain","Poland","Romania","Netherlands",
                                                                 "Belgium","Greece","Czech Republic",
                                                                 "Portugal","Sweden","Hungary","Austria",
                                                                 "Bulgaria","Denmark","Finland","Slovakia",
                                                                 "Ireland","Croatia","Lithuania","Slovenia",
                                                                 "Latvia","Estonia","Cyprus","Luxembourg","Malta"), selected = "All"),
        sliderInput("numOfCountries", "Number of countries to show: ",
                    min = 1, max=nrow(data), value=10, step = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       #plotOutput("distPlot")
       # Output: Tabset w/ plot, summary, and table ----
       tabsetPanel(type = "tabs",
                   tabPanel("Plot", plotOutput("plot")),
                   tabPanel("Table", dataTableOutput('table')),
                   tabPanel("Documentation", "This ShinyApp has aims to analyse the Population of European Union.
The app shows by 10 countries but allows you to change the number of countries to show by a slider input. 
It also provides a select input to select a specific country to view.
The App has three tabs, first tab is a plot, second tab is a table showing the dataset, and the third tab is documentation.")
       )
    )
  )
))
