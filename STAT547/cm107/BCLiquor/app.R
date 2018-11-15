#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# load data
bcl <- read.csv("~/Desktop/STAT/STAT-participation/STAT547/cm107/BCLiquor/bcl-data.csv", stringsAsFactors = FALSE)
beverages = unique(bcl$Type)

ui <- fluidPage(
  titlePanel("BC Liquor Price App", 
             windowTitle = "BCL app"), 
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Select your desired price range.",
                  min = 0, max = 100, value = c(15, 30), pre="$"), 
      radioButtons("typeInput", "Select kind of beverage", 
                   choices = beverages, 
                   selected = beverages[1])
    ), 
    mainPanel(
      plotOutput("price_hist"), 
      tableOutput("bcl_data")
    )
  )
)

server <- function(input, output) {
  # observe(print(input$priceInput))
  bcl_filter <- reactive({
    bcl %>% 
    filter(Price < input$priceInput[2], 
           Price > input$priceInput[1], 
           Type == input$typeInput)
  })
  
  output$price_hist <- renderPlot(
    bcl_filter() %>%
      ggplot(aes(Price)) +
      geom_histogram()
  )
  output$bcl_data <- renderTable({
    bcl_filter()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

