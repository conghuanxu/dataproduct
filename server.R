library(shiny)

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define a server for the Shiny app
shinyServer(function(input, output) {
        
        # Fill in the spot we created for a plot
        output$phonePlot <- renderPlot({
                
                # Render a barplot
                barplot(WorldPhones[,input$region]*1000, 
                        main=input$region,
                        ylab="Number of Telephones",
                        xlab="Year")
        })
        output$yearPlot <- renderPlot({
                
                # Render a barplot
                barplot(WorldPhones[input$year,], 
                        main=input$year,
                        ylab="Number of Telephones",
                        xlab="Region")
        })
        sliderValues <- reactive({
                data.frame(
                        Region = input$region,
                        Year = input$year,
                        Data = WorldPhones[rownames(WorldPhones) == input$year,
                                           colnames(WorldPhones) == input$region]
                        )
        })
        output$data <- renderTable({
                sliderValues()
        })
})