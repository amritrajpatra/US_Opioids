#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  output$Plot <- renderPlotly({
    
    data <- all_overdoses_RDS %>% 
      filter(Year == input$year)
    
    # give state boundaries a white border
    l <- list(color = toRGB("white"), width = 2)
    # specify some map projection/options
    g <- list(
      scope = 'usa',
      projection = list(type = 'albers usa'),
      showlakes = TRUE,
      lakecolor = toRGB('white')
    )
    
    plot_geo(data, locationmode = 'USA-states') %>%
      add_trace(
        z = ~deathPer100k, locations = ~Abbrev,
        color = ~deathPer100k, colors = 'Reds'
      ) %>%
      colorbar(title = "") %>%
      layout(
        title = '',
        geo = g)
     })
  
  output$Plot1 <- renderPlot({
    # specify some map projection/options
    
    # filter overdoses_shiny based on Year
    data <- opioids_prescribed_by_state_RDS %>% 
      filter(State == input$state)
  
  ggplot(data, aes(x=reorder(drug,values), y=values,fill=drug)) +
    geom_bar(stat="identity") +
    xlab('') +
    ylab('Prescription Count') + ggtitle("") +
    theme(
      legend.position="none",
      plot.title = element_text(color="blue", size=14, face="bold.italic"),
      axis.title.x = element_text(color="#993333", size=14, face="bold"),
      axis.title.y = element_text(color="#993333", size=14, face="bold"),
      axis.text.x = element_text(hjust = 1),
      axis.text.y = element_text(color="#993333", face="bold")
    ) +
    coord_flip()
  })
  
   # output$click <- renderPrint({
    #  d <- event_data("plotly_click")
    #  if (is.null(d)) "Click on a state to view event data" else d
  #  })
    
}