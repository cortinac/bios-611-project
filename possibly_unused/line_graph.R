# line_graph.R
# Create line graphs

library(tidyverse)
library(shiny)
library(plotly)

clean <- read_csv("~/project/derived_data/clean.csv")
states <- read_csv("~/project/derived_data/states.csv")
states_metro <- read_csv("~/project/derived_data/states_metro.csv")
states_nonmetro <- read_csv("~/project/derived_data/states_nonmetro.csv")

s <- states %>% filter(recip_state=='NC')
m <- states_metro %>% filter(recip_state=='NC')
nm <- states_nonmetro %>% filter(recip_state=='NC')
c <- clean %>% filter(recip_county=='Wake County' & recip_state=='NC')

ggplot(c, aes(date, series_complete_pop_pct)) + geom_line()

ggplot(s, aes(date, complete)) + geom_line()

ggplot(m, aes(date, complete)) + geom_line()

ggplot(nm, aes(date, complete)) + geom_line()

states_list <- states$recip_state %>% unique()

ui <- shinyUI(fluidPage(
  sidebarLayout(sidebarPanel(selectizeInput(inputId='state',
                                            label='State',
                                            choices=states_list,
                                            multiple=F)),
                mainPanel(plotlyOutput("graph"))
                
)))

server <- function(input, output) {
  output$graph <- renderPlotly({
    
    state <- input$state;
    
    s <- states %>% filter(recip_state==state);
    
    plt <- ggplot(s, aes(date, complete)) + geom_line()
  })
}

shinyApp(ui=ui, server=server, options=list(port=8080, host="0.0.0.0"))
