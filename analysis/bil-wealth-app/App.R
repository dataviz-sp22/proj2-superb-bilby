# Load packages ----------------------------------------------------------------

# Run rsconnect::deployApp() in console to deploy
library(shiny)
library(tidyverse)
library(scales)
library(ggtext)
library(rsconnect)
library(shinythemes)

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


# user input
num_us_household <- 5000
num_uchicago_master <- 1000
num_trip_to_hawaii <- 1000
num_aston_martin <- 1000
num_house_in_beverly_hill <- 100
num_name_school <- 100

# Define UI --------------------------------------------------------------------
ui <- navbarPage(
  title = "Wealth Inequality",
  
  tabPanel("Spend all your money!", 
           icon=icon("dollar"),
           sidebarLayout(
             sidebarPanel(width=3, #sidebarPanel "New Cases"
                          conditionalPanel(
                            'input.dataset02 === "Edit Table"',
                            textInput(inputId = "name", 
                                      label = "Enter Billionaire Name",
                                      value = "Jeff Bezos"), 
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
                            br(),
                            actionButton("goButton", 
                                         "Update Table",
                                         icon("cloud-upload"), 
                                         style = "width: 100%; height: 60px; color: steelblue; background-color: #337ab7; border-color: #2e6da4"),
                            br()
                          )),
             mainPanel(
               tabsetPanel(
                 id = 'dataset02',
                 tabPanel("Edit Table",
                          br(),
                          dataTableOutput("table3"))
                          )
                      )
                ) #sidebarLayout
           )#tabPanel
  )#navbarPage
  



# Define server function -------------------------------------------------------

server <- function(input, output, session){
  
}



















# Create the Shiny app object --------------------------------------------------
shinyApp(ui = ui, server = server)