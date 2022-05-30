# Load packages ----------------------------------------------------------------
# Navbar example: https://shiny.rstudio.com/gallery/navbar-example.html

# install.packages('rsconnect')
# Run rsconnect::deployApp() in console to deploy
library(shiny)
library(tidyverse)
library(scales)
library(ggtext)
library(rsconnect)
library(shinythemes)

# Load data --------------------------------------------------------------------

# life_meaning <- read_csv("data/babynames.csv", show_col_types = FALSE)
babynames <- read_csv("data/babynames.csv", show_col_types = FALSE)
births <- read_csv("data/births.csv", show_col_types = FALSE)
applicants <- read_csv("data/applicants.csv", show_col_types = FALSE)
lifetables <- read_csv("data/lifetables.csv", show_col_types = FALSE)

# Basic Data Wrangling ---------------------------------------------------------

name_choices <- babynames %>%
  distinct(name) %>%
  arrange(name) %>%
  pull(name)

year_choices <- babynames %>%
  distinct(year) %>%
  arrange(year) %>%
  pull(year)

# Define UI --------------------------------------------------------------------

ui <- navbarPage(
  # Set the basic theme
  theme = bslib::bs_theme(
    bg = "#002B36", fg = "#EEE8D5", primary = "#2AA198",
    # bslib also makes it easy to import CSS fonts
    base_font = bslib::font_google("Pacifico")
  ),
  
  # Application title
  title = "How Popular is Your Name?",
  
  tabPanel(
    title = "Popularity of the name", 
    sidebarPanel(
      textInput(inputId = "name", 
                label = "Enter a name:",
                value = "Jennifer") # Set default name as Jennifer
    ),
    mainPanel(
      # use HTML tags to format structure of text
      hr(),
      "Showing the Popularity of Names Based on Births Data",
      br(), br(),
      # placeholder for selected industries
      textOutput(outputId = "selected_name"),
      hr(),
      br(),
      plotOutput(outputId = "name_popularity"))
  ),
  
    tabPanel(
      title = "Percentage of Name over Years",
      # add conditional panel to select observations based on salary
      conditionalPanel(
        condition = "input.industry.length <= 8",
        sliderInput(
          inputId = "xlim",
          label = "Choose Year Range",
          min = 1909,
          value = c(1920,2000),
          max = 2020,
          width = "100%",
          pre = "Year"
        )
      ),
      # plot and table for this panel
      plotOutput(outputId = "birth_percentage_plot"),
      tableOutput(outputId = "birth_percentage_data")
    ),
    # tabPanel("Data", DT::dataTableOutput(outputId = "birth_percentage_table"))
    tabPanel(title = "Top 10 Names in a Year",
             selectInput(
               inputId = "year",
               label = "Please select the year",
               choices = year_choices,
               selected = 2000
             ),
             plotOutput(outputId = "top10name")),
    # show all the data
    tabPanel(title = "Data", 
             tableOutput(outputId = "birth_percentage_table")
        )
      )
# Define server function --------------------------------------------
server <- function(input, output, session) {
  
  output$selected_name <- reactive({
    paste("You've chosen", input$name, ", right?")
  })
  
  name_data <- reactive({
    babynames %>%
      filter(name == input$name) %>%
      mutate(sex = factor(x = sex,
                          levels = c("F", "M"),
                          labels = c("Female", "Male")))
  })
  
  names_per_year <- reactive({
    name_data()%>%
      filter(year >= 1909) %>%
      group_by(year) %>%
      summarise(num_names = sum(n))
  })
  
  
  birth_percentage_data <- reactive({
    data.frame(Year = as.integer(births$year),
               Births = as.integer(births$births),
               Percentage = names_per_year()$num_names / births$births * 100)
    
  })
  
  female_mean <- reactive({
    mean(name_data()[name_data()$sex == "Female",]$n)
  })
  male_mean <- reactive({
    mean(name_data()[name_data()$sex == "Male",]$n)
  })
  
  color <- reactive({
    ifelse(female_mean() > male_mean(), "#48A096", "#BD7F8A")
  })
  
  
  output$birth_percentage_plot <- renderPlot({
    
    validate(
      need(
        expr = input$name %in% name_choices,
        message = "This name never shows up 5 times in birth records."
      )
    )
    
    birth_percentage_data()%>%
      ggplot(mapping = aes(x = Year,
                           y = Percentage)) +
      geom_line(color = color()) +
      scale_x_continuous(limits = input$xlim)+
      labs(
        x = "Year",
        y = "Percentage (%)",
        title = paste("Percentage of Name <span style = 'color:", color(), "'>", input$name, "</span> over years")
      ) +
      theme(
        plot.title = element_textbox_simple())
    
  })
  
  
  
  output$name_popularity <- renderPlot({
    
    validate(
      need(
        expr = input$name %in% name_choices,
        message = "This name never shows up 5 times in birth records."
      )
    )
    
    name_data()%>%
      ggplot(mapping = aes(x = year,
                           y = n,
                           color = sex)) +
      geom_line() +
      labs(title = paste("Name: <span style = 'color:", color(), "'>", input$name, "</span>"),
           x = "Year",
           y = "Number of Births",
           color = NULL) +
      scale_color_manual(values = c("#48A096", "#BD7F8A")) + #48A096 for female
      theme(
        plot.title = element_textbox_simple())
    
  })
  
  output$birth_percentage_table <- renderTable({
    birth_percentage_data()
  })
  
  output$top10name <- renderPlot({babynames %>%
      filter(year == input$year) %>%
      arrange(desc(n)) %>%
      top_n(n=10) %>%
      ggplot(mapping = aes(y = fct_reorder(name, n),
                           x = n)) +
      geom_col(aes(fill = sex)) +
      labs(title = paste("Top 10 name in ", input$year),
           x = "Number of Baby Given of Each Name",
           y = "Name",
           fill = "Sex") +
      scale_fill_manual(values = c("#8cdbd2", "#fab6c2"))
  })
}


# Create the Shiny app object ---------------------------------------
shinyApp(ui = ui, server = server)
