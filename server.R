#' [--SERVER--]
 
server <- function(input, output) {
  
  #' [Input]
  #' Distribution: `idInput = distribution`
  #' NUmber observation `idInput = n`
  #' Parameters
    #' Pamram_1 `idInput = param_1`
    #' Param_2 `idInput = param_2`
  #' Range value from ` inInput = x_from`
  #' Range value to `idInput = x_to`
  #' Feedback Percentiles `idInput = prob`
  #' Button refresh `idInput = refresh`
  #' Button go `idInput = action`

  #' [Output]
  #' Current time
  output$current_time <- renderText({
    invalidateLater(millis = 1000)
    format(Sys.time())
  })
  output$plot <- renderPlot({
    input$action
    source("./custom_functions/create_density.R")
    vis <- create_density(n = input$n, distribution = input$distribution, param1 = input$param_1,
                          param2 = input$param_2, x_from = input$x_from, x_to = input$x_to)
    plot(x = vis$param_x, y = vis$density, "l")
  })
  
}
