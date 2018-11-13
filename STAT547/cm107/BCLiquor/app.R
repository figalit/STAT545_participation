#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# load data
bcl <- read.csv("~/Desktop/STAT/STAT-participation/STAT547/cm107/BCLiquor/bcl-data.csv", stringsAsFactors = FALSE)


ui <- fluidPage(
  titlePanel("BC Liquor Price App", 
             windowTitle = "BCL app"), 
  sidebarLayout(
    sidebarPanel("This is in sidebar"), 
    mainPanel(
      plotOutput("price_hist"), 
      tableOutput("bcl_data")
    )
  )
)

server <- function(input, output) {
  output$price_hist <- renderPlot(ggplot2::qplot(bcl$Price))
  output$bcl_data <- renderTable(bcl)
}

# Run the application 
shinyApp(ui = ui, server = server)

