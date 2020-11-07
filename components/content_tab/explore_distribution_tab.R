#' [CONTENT TAB EXPLORE DISTRIBUTION ]
#' 

explore_distribution_tab <- tabItem(
  tabName = "explore_distribution",
  #' Title content
  strong("EXPLORE DISTRIBUTION", 
         style = "font-family: Bell MT; font-size: 18px; text-align: left;"),
  #' Layout
  fluidRow(
    box(solidHeader = TRUE, status = "primary", width = 3, height = 500,
        title = div("Option of distribution", 
                    style = "font-family: Bell MT; font-size: 22px;
                             font-weight: bold; color: white;"),
        #' Select distribution
        selectInput(inputId = "distribution", label = "Choose distribution:",
                    choices = list("Beta", "Binomial", "Chi - square" = "chi-sq", 
                                   "Exponential" = "exp", "Gamma", "Normal",
                                   "Poisson", "Student-t", "Uniform"),
                    selected = "Normal", width = "95%"),
        #' Number observation
        numericInput(inputId = "n", label = "Number observation:",
                     value = NA, min = 1, max = NA, step = 10, width = "95%"),
        #' Parameters
        numericInput(inputId = "param_1", label = "Parameter 1:",
                     value = NA, width = "95%"),
        numericInput(inputId = "param_2", label = "Parameter 2:",
                     value = NA, width = "95%"), 
        #' Range value
        numericInput(inputId = "x_to", label = "Range value from:",
                     value = NA, width = "95%"),
        numericInput(inputId = "x_from", label = "Range value to:",
                     value = NA, width = "95%")
    ),
  ),
  fluidRow()
  
)