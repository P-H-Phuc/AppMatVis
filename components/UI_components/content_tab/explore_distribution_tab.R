#' [CONTENT TAB EXPLORE DISTRIBUTION ]
#' 

explore_distribution_tab <- tabItem(
  tabName = "explore_distribution",
  #' Layout
  fluidRow(
    column(width = 3,
           box(solidHeader = TRUE, status = "primary", width = "100%", height = 680,
               title = div("Option", 
                           style = "font-family: Bell MT; font-size: 22px;
                             font-weight: bold; color: white;"),
               #' Select distribution
               selectInput(inputId = "distribution", label = "Choose distribution:",
                           choices = list("Beta", "Normal"),
                           selected = "Normal", width = "95%"),
               #' Parameters
                #' param_1
               numericInput(inputId = "param_1", label = "Parameter 1:",
                            value = 0, width = "95%"),
                #' param_2
               numericInput(inputId = "param_2", label = "Parameter 2:",
                            value = 2, width = "95%"), 
               #' Range value
               numericInput(inputId = "x_from", label = "Range value from:",
                            value = -6, width = "95%"),
               numericInput(inputId = "x_to", label = "Range value to:",
                            value = 6, width = "95%"),
               #' Button
               actionButton(inputId = "action", label = strong("Update value", style = "color: black; font-size: 18px"),
                                width = "95%", style = "background-color: #cd201f"),
               #' Feedback
               sliderInput(inputId = "prob", label = "Feedback Percentiles", min = 0, max = 1, 
                                      value =c(0.05, 0.95), step = 0.005, width = "95%", ticks = FALSE)
           )
    ),
    column(width = 9,
           box(solidHeader = TRUE, status = "primary", width = "100%", height = 510,
               title = div(textOutput(outputId = "title", span), 
               style = "font-family: Bell MT; font-size: 22px;
                             font-weight: bold; color: white;"),
               plotOutput(outputId = "plot", width = "100%", height = "450px")),
           box(solidHeader = TRUE, status = "primary", width = "100%", height = 150)
    )
    )
  )