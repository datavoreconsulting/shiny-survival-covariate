library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title.
  headerPanel(""),
  
  sidebarPanel(
    sliderInput(inputId = "starve",
                label = "Starvation period (hrs)",
                min = 2,
                max = 24,
                value = 2,
                animate = animationOptions(interval=800, loop=TRUE)
    )
  ), 
  
  mainPanel(
    tabsetPanel(
      tabPanel("Plot", plotOutput("plot_predicted")),
      tabPanel("Model Summary", verbatimTextOutput("summary")),
      tabPanel("Data", tableOutput("raw_data")),
      id = "tabs"
    ) 
  )
))


