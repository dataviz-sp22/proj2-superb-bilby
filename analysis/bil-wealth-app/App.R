# Load packages ----------------------------------------------------------------

# Run rsconnect::deployApp() in console to deploy
library(shiny)
library(tidyverse)
library(scales)
library(ggtext)
library(rsconnect)
library(shinythemes)
library(fmsb)

# Load data --------------------------------------------------------------------
bil <- read.csv("data/billionaire/Forbes Annual Report Data - 2020.csv", skip = 1) %>% drop_na()

# Data Wrangling ---------------------------------------------------------------
# Change dollar sign
bil <- bil %>%
  mutate(Wealth..Millions. = parse_number(Wealth..Millions.))

# Define individual price (in million)
us_household_income <- 0.065
uchicago_master <- 0.16
trip_hawaii <- 0.004
aston_martin <- 0.3
house_in_beverly_hill <- 3
name_school <- 300 # Name UChicago booth

# Create a list for all spending items
spending <- c("Household Spending",
              "UChicago Master",
              "International Trip",
              "Aston Martin",
              "House in Beverly Hill",
              "Name UChicago Booth",
              "Money Left")


# Define Name Choice for selectInput
name_choices <- bil %>%
  distinct(Name.and.Rank) %>%
  arrange(Name.and.Rank) %>%
  pull(Name.and.Rank)


# Define UI --------------------------------------------------------------------
ui <- navbarPage(
  title = "Wealth Inequality",
  
  tabPanel("Spend all your money!", 
           icon=icon("dollar"),
           sidebarLayout(
             sidebarPanel(width=3, #sidebarPanel "New Cases"
                            selectInput(inputId = "name", 
                                      label = "Enter Billionaire Name",
                                      choices = name_choices,
                                      selected = "Jeff Bezos"
                                      ), 
                            br(),
                            fluidRow(
                              column(8, numericInput(inputId = "num_us_household", 
                                                     label = "Household Spending", 
                                                     value = 100)),
                              column(8, numericInput(inputId = "num_uchicago_master", 
                                                     label = "UChicago Master", 
                                                     value = 50))
                            ),
                            fluidRow(
                              column(8, numericInput(inputId = "num_trip_to_hawaii", 
                                                     label = "International Trip", 
                                                     value = 100)),
                              column(8, numericInput(inputId = "num_aston_martin", 
                                                     label = "Aston Martin", 
                                                     value = 20))
                            ),
                            fluidRow(
                              column(8, numericInput(inputId = "num_house_in_beverly_hill", 
                                                     label = "House in Beverly Hill", 
                                                     value = 20)),
                              column(8, numericInput(inputId = "num_name_school", 
                                                     label = "Name UChicago Booth", 
                                                     value = 50))
                            ),
                            br()
                          ),
             mainPanel(
               tabsetPanel(
                 id = 'radar-plot',
                 tabPanel("Radar Plot",
                          br(),
                          # tableOutput("test_table")
                          # textOutput("test")
                          plotOutput("radar_plot")
                          )
                          )
                      )
                ) #sidebarLayout
           )#tabPanel
  )#navbarPage
  



# Define server function -------------------------------------------------------

server <- function(input, output) {
  output$test_table <- renderTable(spending_data())
  # output$test <- renderText(max_value())
  
  wealth <- reactive(
    {
      bil %>%
        filter(Name.and.Rank == input$name)%>%
        pull(Wealth..Millions.) %>%
        as.numeric()          
    }
  )

      
  # total price
  total_household <- reactive({us_household_income * input$num_us_household})
  total_master <- reactive({uchicago_master * input$num_uchicago_master})
  total_trip <- reactive({trip_hawaii * input$num_trip_to_hawaii})
  total_car <- reactive({aston_martin * input$num_aston_martin})
  total_house <- reactive({house_in_beverly_hill * input$num_house_in_beverly_hill})
  total_fame <- reactive({name_school * input$num_name_school})

  money_left <- reactive(wealth() - sum(total_household(),
                             total_master(),
                             total_trip(),
                             total_car(),
                             total_house(),
                             total_fame()))

  max_value <- reactive({max(total_household(),
             total_master(),
             total_trip(),
             total_car(),
             total_house(),
             total_fame(),
             money_left())})

  new_row <- reactive({data.frame("Household" = total_household(),
                   "Education" = total_master(),
                   "Travel" = total_trip(),
                   "Car" = total_car(),
                   "Housing" = total_house(),
                   "Fame" = total_fame(),
                   "Left Money" = money_left())})
  # 
  spending_data <- reactive({rbind(rep(max_value(),7) , rep(0,7) , new_row())})
  
  output$radar_plot <- renderPlot({
    
    radarchart(spending_data(), axistype=1 , 
               
               #custom polygon
               pcol=rgb(0.2,0.5,0.5,0.9) , 
               pfcol=rgb(0.2,0.5,0.5,0.5) , 
               plwd=4 , 
               
               #custom the grid
               cglcol="grey", 
               cglty=1, 
               axislabcol="grey", 
               caxislabels=seq(0, 
                               max_value(), 
                               round(max_value()/5, digits = -4)), 
               cglwd=0.8,
               
               #custom labels
               vlcex=0.8 
    )
  }
  )
      
}











# Create the Shiny app object --------------------------------------------------
shinyApp(ui = ui, server = server)