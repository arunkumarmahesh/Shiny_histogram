#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#


library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Histogram_irisdata"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 13,
                     value = 5)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("Plot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$Plot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- iris[, 1] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'black', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

