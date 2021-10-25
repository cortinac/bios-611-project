# line_graphs_counties.R
# Create R Shiny app to look at line graphs for counties

library(tidyverse)
library(shiny)
library(plotly)

clean <- read_csv("~/project/derived_data/clean.csv")

clean_ <- clean %>% mutate(county_state=paste(recip_county,"-",recip_state)) %>%
  arrange(recip_state, recip_county)

county_state_list <- clean_$county_state %>% unique()

age_dose_list <- c('Complete, All'='series_complete_pop_pct',
                   'Complete, 12+'='series_complete_12pluspop',
                   'Complete, 18+'='series_complete_18pluspop',
                   'Complete, 65+'='series_complete_65pluspop',
                   'One Dose, All'='administered_dose1_pop_pct',
                   'One Dose, 12+'='administered_dose1_recip_12pluspop_pct',
                   'One Dose, 18+'='administered_dose1_recip_18pluspop_pct',
                   'One Dose, 65+'='administered_dose1_recip_65pluspop_pct')

age_list <- c('All'='all',
              '12+'='p12',
              '18+'='p18',
              '65+'='p65')

dose_list <- c('Complete'='complete',
               'One Dose'='onedose')

ui <- shinyUI(
  fluidPage(
    sidebarLayout(
      sidebarPanel(
        selectizeInput(inputId='county',
                       label='County',
                       choices=county_state_list,
                       multiple=F),
        radioButtons(inputId='age',
                     label='Age',
                     choices=age_list),
        radioButtons(inputId='dose',
                     label='Dose',
                     choices=dose_list)
      ),
      mainPanel(plotlyOutput("graph"))
    )
  )
)

server <- function(input, output) {
  output$graph <- renderPlotly({
    
    county <- input$county;
    c <- clean_ %>% filter(county_state==county)    
    
    # output_var <- switch(input$age_dose,
    #                      'series_complete_pop_pct'=c$series_complete_pop_pct,
    #                      'series_complete_12pluspop'=c$series_complete_12pluspop,
    #                      'series_complete_18pluspop'=c$series_complete_18pluspop,
    #                      'series_complete_65pluspop'=c$series_complete_65pluspop,
    #                      'administered_dose1_pop_pct'=c$administered_dose1_pop_pct,
    #                      'administered_dose1_recip_12pluspop_pct'=c$administered_dose1_recip_12pluspop_pct,
    #                      'administered_dose1_recip_18pluspop_pct'=c$administered_dose1_recip_18pluspop_pct,
    #                      'administered_dose1_recip_65pluspop_pct'=c$administered_dose1_recip_65pluspop_pct);
    
    dose <- input$dose;
    
    if(dose=='complete') {
      output_var <- switch(input$age,
                           'all'=c$series_complete_pop_pct,
                           'p12'=c$series_complete_12pluspop,
                           'p18'=c$series_complete_18pluspop,
                           'p65'=c$series_complete_65pluspop,)
    } else if(dose=='onedose') {
      output_var <- switch(input$age,
                           'all'=c$administered_dose1_pop_pct,
                           'p12'=c$administered_dose1_recip_12pluspop_pct,
                           'p18'=c$administered_dose1_recip_18pluspop_pct,
                           'p65'=c$administered_dose1_recip_65pluspop_pct)
    }
    
    plt <- ggplot(c, aes(date, output_var)) + geom_line() + xlab("Date") + ylab("COVID Vaccine Rate")
  })
}

shinyApp(ui=ui, server=server, options=list(port=8080, host="0.0.0.0"))