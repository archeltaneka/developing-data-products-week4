#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Simple PCA with mtcars Dataset"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("num_of_pca",
                        "Number of Principal Components:",
                        min = 1,
                        max = 7,
                        value = 7)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("pcaPlot")
        )
    )
))
