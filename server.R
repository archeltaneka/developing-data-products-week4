#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggbiplot)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$pcaPlot <- renderPlot({
        
        # create PCA (since PCA only works for numerical values, we exclude 'vs' and 'am' columns)
        mtcars.pca <- prcomp(mtcars[,c(1:input$num_of_pca,10,11)], center = TRUE,scale. = TRUE)
        
        # plot the PCA
        mtcars.country <- c(rep("Japan", 3), rep("US",4), rep("Europe", 7),rep("US",3), "Europe", rep("Japan", 3), rep("US",4), rep("Europe", 3), "US", rep("Europe", 3))
        ggbiplot(mtcars.pca, labels=rownames(mtcars), ellipse=TRUE, groups=mtcars.country) + 
        ggtitle("mtcars Dataset PCA") + # plot title
        theme(legend.position='bottom') + # bottom legend
        coord_equal(ratio = 0.4) # scale plot
    })

})
