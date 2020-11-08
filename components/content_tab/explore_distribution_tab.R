#' [CONTENT TAB EXPLORE DISTRIBUTION ]
#' 

explore_distribution_tab <- tabItem(
  tabName = "explore_distribution",
  #' Layout
  fluidRow(
    column(width = 3,
           box(solidHeader = TRUE, status = "primary", width = "100%", height = 720,
               title = div("Option", 
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
                            value = 1000, min = 1, max = NA, step = 10, width = "95%"),
               #' Parameters
                #' param_1
               numericInput(inputId = "param_1", label = "Parameter 1:",
                            value = 0, width = "95%"),
                #' param_2
               numericInput(inputId = "param_2", label = "Parameter 2:",
                            value = 1, width = "95%"), 
               #' Range value
               numericInput(inputId = "x_from", label = "Range value from:",
                            value = -2, width = "95%"),
               numericInput(inputId = "x_to", label = "Range value to:",
                            value = 2, width = "95%"),
               actionBttn(inputId = "refresh", label = strong("Refresh"), 
                          color = "danger", style = "fill", size = "sm"),
               actionBttn(inputId = "action", label = strong("Go"), 
                          color = "danger", style = "fill", size = "sm"),
               helpText("Create a density plot with information above. 
                         Feedback quantiles, percent confidence interval and parameter of distribution.")
           )
    ),
    column(width = 9,
           box(solidHeader = TRUE, status = "primary", width = "100%", height = 150,
               title = div("Fitting ft Feedback", style = "font-family: Bell MT; font-size: 22px;
                             font-weight: bold; color: white;"),
               column(width = 9, 
                 sliderInput(inputId = "prob", label = "Feedback Percentiles", min = 0, max = 1, 
                             value =c(0.25, 0.75), step = 0.005, width = "30%", ticks = FALSE))),
           box(solidHeader = TRUE, status = "primary", width = "100%", height = 550,
               title = div("Visualize distribution", style = "font-family: Bell MT; font-size: 22px;
                             font-weight: bold; color: white;"),
               plotOutput(outputId = "plot", width = "100%", height = "450px"))
    )
    )
  )