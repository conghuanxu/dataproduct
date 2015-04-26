library(shiny)

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

shinyUI(fluidPage(
        
        # Application title
        titlePanel("Select Region and Year"),
        
        # Sidebar with controls to select the random distribution type
        # and number of observations to generate. Note the use of the
        # br() element to introduce extra vertical spacing
        sidebarLayout(
                sidebarPanel(
                        hr(),
                        selectInput("region", "Region:", 
                                    choices=colnames(WorldPhones)),
                        selectInput("year", "Year:", 
                                    choices=rownames(WorldPhones))
                ),
                
                # Show a tabset that includes a plot, and table view
                # of the generated distribution
                mainPanel(
                        tabsetPanel(type = "tabs", 
                                    tabPanel("Plot", plotOutput("phonePlot")),
                                    tabPanel("Year", plotOutput("yearPlot")),
                                    tabPanel("Data", tableOutput("data"))
                        )
                )
        )
))