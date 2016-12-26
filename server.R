###
# The starting point of the app is providing librarys - besides 
# the obvious shiny library I am adding librarys for data presentation
###

library(shiny)
library(plotly)
library(ggplot2)

# Define server logic required to draw a plot using input from checkboxes and sliders
shinyServer(function(input, output) {

  output$plot1 <- renderPlotly({ 
    
    if(length(input$variable)==0) 
    {
      species_data<- iris[input$SepLen[1] <= iris$Sepal.Length & iris$Sepal.Length <= input$SepLen[2],]
      g <- ggplot(species_data, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point() + geom_smooth(method = "lm")
      ggplotly(g)
    } 
    else if(input$LMfit == 'Spec')
    {DataName <- iris[ iris$Species %in% input$variable,]
    DataName<- DataName[input$SepLen[1] <= DataName$Sepal.Length & DataName$Sepal.Length <= input$SepLen[2],]
    g <- ggplot(data = DataName, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_point() + geom_smooth(method = "lm")
    ggplotly(g)
    
    } 
    
    else
    {DataName <- iris[ iris$Species %in% c(input$variable),]
    DataName <- DataName[input$SepLen[1] <= DataName$Sepal.Length & DataName$Sepal.Length <= input$SepLen[2],]
    
    g <- ggplot(data = DataName, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point() + geom_smooth(method = "lm") + geom_point(data = DataName, aes( color= Species))
    ggplotly(g)
    
    }     
    
  })
  
})







