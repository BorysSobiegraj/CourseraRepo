###
# The starting point of the app is providing librarys - besides 
# the obvious shiny library I am adding librarys for data presentation
###

library(shiny)
library(ggplot2)
library(plotly)

# Below you will find defined two panels:
# 1. sidebarPanel - has two main ways of filtering data or changeing the presentaiton of LM fits
# 2. mainPanel - has a slider which allows narrowing range of the Sepal.length axis and the main plot. 
#    The plot is interactive to provide a better user expirience

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Species of Iris Analysis"),
  
  # Sidebar with radiobutton and checkbox
  sidebarLayout(
    sidebarPanel(
                  radioButtons("LMfit", "Type of LM fit to show:", c("Whole Data Series" = "All","Per Specie" = "Spec")),
                  checkboxGroupInput("variable", "Species to focus on:",unique(iris$Species))
    ),
    
    # main panel with slider and plot
    mainPanel(
      h4("The application is focused on enabling choosing subsets of data from the Iris data set (Species to focus on) and choosing if you want linear regretion to be fited to each Specie separatly (Per Specie) or to all chosen togethe (Whole Data Series)"),
      h4("Additionaly you can use the slider seen below to narrow the range of data on the X axis"),
      sliderInput("SepLen", "Decide On Sepal Leng Range:",min = min(iris$Sepal.Length)-0.2, max = max(iris$Sepal.Length)+0.2, value = c(0,10), step = 0.2),
      plotlyOutput("plot1")
    )
  )
))


