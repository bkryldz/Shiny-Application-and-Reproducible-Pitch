#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)

data <- read.csv("EU_pop.csv", sep=";")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$plot <- renderPlot({
      
      if (input$country != "All"){
          data <- data[data$Country == input$country,]
      }
      
      data <- data %>% arrange(desc(World)) %>% slice(1:input$numOfCountries)
      
      p<-ggplot(data=data, aes(x=data$Country, y=data$Population/1000)) +
          xlab("Country") +
          ylab("Population (K)") +
          geom_bar(stat="identity", fill="steelblue") +
          theme_minimal()
      p
      
  })
  
  output$table <- renderDataTable({
      
      if (input$country != "All"){
          data <- data[data$Country == input$country,]
      }
      
      data %>% slice(1:input$numOfCountries)
  })
  
})
