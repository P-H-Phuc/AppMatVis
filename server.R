#' [--SERVER--]
 
server <- function(input, output) {
  #'
  #' [Input]
  #' 
  #' [Output]
  #' Current time
  output$current_time <- renderText({
    invalidateLater(millis = 1000)
    format(Sys.time())
  })
  
}
