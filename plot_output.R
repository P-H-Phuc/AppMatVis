#' [VISUALIZATION DISTRIBUTION]

#' load funtion `create_density()`
source("./custom_functions/create_density.R")

#' load function `quantile_fun()`
source("./custom_functions/quantile_fun.R")


output$plot <- renderPlot({
    #' Create data for plot
    x <- create_density(n = input$n, distribution = input$distribution, 
                                  param1 = input$param_1, param2 = input$param_2, 
                                  x_from = input$x_from, x_to = input$x_to)
    #' Create confidence interval
    interval <- quantile_fun(distribution = input$distribution, prob = prob,
                             param_1 = input$param_1, param_2 = input$param_2)
    #' As dataframe
    data <- tibble::tibble(pi = x$param_x, pdf = x$density)
    
    #' Generate plot requires `ggplot2 package`
    
    ggplot(data = data, mapping = aes(x = pi, y = pdf, ymin = 0, ymax = pdf)) +
      geom_ribbon(size = 1, fill = "#008489", color = "black") + # density
      geom_ribbon(data = data %>% filter(pi >= interval[1] & pi <= interval[2]), # confidence interval
                  mapping = aes(x = pi, y = pdf), size = 1, fill = "#00A6AD", color = "black") + 
      geom_segment(aes(x = interval[1], y = max(data$pdf)/4,
                       xend = interval[2], yend = max(data$pdf)/4),
                   arrow = arrow(length = unit(0.2, "cm"), ends = "both", type = "closed"),
                   size = 1, color = "white") +
      annotate(geom = "label", label = glue::glue("{a}% confidence interval",
                                                  a = (interval[2] - interval[1])*100),
               x = x$quantiles[3], y = max(data$pdf)/4, size = 3)
})







































