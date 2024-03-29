#' [--SERVER--]
 
server <- function(input, output) {
  
  #' [Input]
  #' Distribution: `idInput = distribution`
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
  #' Title of distribution
  output$title <- renderText({
    input$action
    isolate(
    glue::glue("The graphic of {name} distribution", name = input$distribution))
  })
  #' PlotOutput
  output$plot <- renderPlot({
    input$action
    isolate({
    source("./components/Server_components/plot_output.R")
    plot <- plot_output(distribution = input$distribution, 
                        param1 = input$param_1, param2 = input$param_2,
                        x_from = input$x_from, x_to = input$x_to, prob = input$prob)
    plot$graphic
    })
  })
}
